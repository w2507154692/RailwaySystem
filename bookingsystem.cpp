#include "bookingsystem.h"
#include <QVariantMap>
#include <QDebug>
#include <iostream>
#include <stack>
#include <ctime>
#include <QDebug>
#include <QVariantMap>

BookingSystem::BookingSystem(StationManager* stationManager, 
                                OrderManager* orderManager,
                                TrainManager* trainManager,
                                AccountManager* accountManager,
                                QObject* parent)
    :station_manager(stationManager), order_manager(orderManager), train_manager(trainManager), account_manager(accountManager), QObject{parent}
{
    // 获取当前时间戳
    std::time_t t = std::time(nullptr);
    std::tm* now = std::localtime(&t);
    // 分别获取年、月、日
    int year = now->tm_year + 1900;
    int month = now->tm_mon + 1;
    int day = now->tm_mday;
    // 存储今天日期
    today.setYear(year);
    today.setMonth(month);
    today.setDay(day);
}

QVariantList BookingSystem::getQueryHistory_api() {
    QVariantList list;
    std::queue<std::tuple<City, City>> tmp = query_history;
    std::stack<std::tuple<City, City>> s;

    // 倒置
    while (!tmp.empty()) {
        s.push(tmp.front());
        tmp.pop();
    }
    while (!s.empty()) {
        tmp.push(s.top());
        s.pop();
    }

    while (!tmp.empty()) {
        City startCity = std::get<0>(tmp.front());
        City endCity = std::get<1>(tmp.front());
        QVariantMap map;
        map["startCity"] = startCity.getName();
        map["endCity"] = endCity.getName();
        list << map;
        tmp.pop();
    }
    return list;
}

bool BookingSystem::addQueryHistory_api(const QString &startCityName, const QString &endCityName) {
    if (!station_manager) {
        return false;
    }
    auto startCityFindResult = station_manager->getCityByCityName(startCityName);
    auto endCityFindResult = station_manager->getCityByCityName(endCityName);
    if (!startCityFindResult or !endCityFindResult) {
        return false;
    }
    City startCity = startCityFindResult.value();
    City endCity = endCityFindResult.value();
    std::tuple<City, City> t = std::make_tuple(startCity, endCity);
    query_history.push(t);
    if (query_history.size() > 3)
        query_history.pop();
    emit queryHistoryChanged();
    return true;
}

bool BookingSystem::clearQueryHistory_api() {
    while (!query_history.empty()) {
        query_history.pop();
    }
    emit queryHistoryChanged();
    return true;
}

QVariantList BookingSystem::queryTickets_api(const QString &startCityName,
                                             const QString &endCityName,
                                             int year, int month, int day) {
    QVariantList list;
    if (!station_manager || !order_manager || ! train_manager || !account_manager) {
        qWarning() << "管理类为空！";
        return list;
    }

    qWarning() << "日期：" << year << month << day;

    // 查询满足能从起始城市开到终点城市的所有车次和车站安排
    std::vector<std::tuple<Train, Station, Station>> routes = train_manager->getRoutesByCities(startCityName, endCityName);
    // 实例化要查询的日期
    Date queryDate(year, month, day);
    // 遍历每趟车次，计算其在那一天的余票
    for (auto &route : routes) {
        // 获得该车次的各等级座位数量，如果座位数减为0，代表没票了
        Train train = std::get<0>(route);
        int firstClassCount = train.getFirstClassCount();
        int secondClassCount = train.getSecondClassCount();
        int businessClassCount = train.getBusinessClassCount();
        // 获得该安排的车站在时刻表中的区间
        Station startStation = std::get<1>(route), endStation = std::get<2>(route);
        Timetable timetable = train.getTimetable();
        int a = timetable.getIndexByStation(startStation);
        int b= timetable.getIndexByStation(endStation);
        std::vector<Order> ordersWithTrainNumberAndDate = order_manager->getOrdersByTrainNumberAndDate(train.getNumber(), queryDate);
        for (auto &order : ordersWithTrainNumberAndDate) {
            if (order.getStatus() == "待乘坐") {
                int c = timetable.getIndexByStation(order.getStartStation());
                int d = timetable.getIndexByStation(order.getEndStation());
                qWarning() << a << b << "and" << c << d;
                // 如果 [a,b] 区间和 [c,d] 区间重合
                if (!(b <= c || a >= d)) {
                    if (order.getSeatLevel() == "一等座") {
                        firstClassCount--;
                        qWarning() << "检测到一等座被占用！";
                    } else if (order.getSeatLevel() == "二等座") {
                        secondClassCount--;
                        qWarning() << "检测到二等座被占用！";
                    } else if (order.getSeatLevel() == "商务座") {
                        businessClassCount--;
                        qWarning() << "检测到商务座被占用！";
                    }
                }
            }
        }
        // 如果遍历完所有订单后，发现该车次当天仍然有余票
        QVariantMap map;
        map["trainNumber"] = train.getNumber();
        std::tuple<Time, Time, QString> startStationInfo =
            timetable.getStationInfo(startStation);
        std::tuple<Time, Time, QString> endStationInfo =
            timetable.getStationInfo(endStation);
        map["startStationName"] = startStation.getStationName();
        map["startHour"] = std::get<1>(startStationInfo).getHour();
        map["startMinute"] = std::get<1>(startStationInfo).getMinute();
        map["startStationStopInfo"] = std::get<2>(startStationInfo);
        map["endStationName"] = endStation.getStationName();
        map["endHour"] = std::get<0>(endStationInfo).getHour();
        map["endMinute"] = std::get<0>(endStationInfo).getMinute();
        map["endStationStopInfo"] = std::get<2>(endStationInfo);

        // 计算历时
        int intervalSeconds = timetable.getInterval(startStation, endStation);
        int hours = intervalSeconds / 3600, minutes = (intervalSeconds % 3600) / 60;
        map["intervalHour"] = hours;
        map["intervalMinute"] = minutes;

        // 计算票价
        std::vector<Station> passStations = timetable.getStationsBetweenStations(startStation, endStation);
        std::tuple<double, double, double> prices = computePrice(train.getNumber(), passStations);
        map["firstClassPrice"] = std::get<0>(prices);
        map["secondClassPrice"] = std::get<1>(prices);
        map["businessClassPrice"] = std::get<2>(prices);

        map["firstClassCount"] = firstClassCount;
        map["secondClassCount"] = secondClassCount;
        map["businessClassCount"] = businessClassCount;

        qWarning() << "firstClassCount =" << firstClassCount
                   << "secondClassCount =" << secondClassCount
                   << "businessClassCount =" << businessClassCount;

        list << map;
    }
    return list;
}

std::tuple<double, double, double> BookingSystem::computePrice(const QString &trainNumber, std::vector<Station> &stations) {
    QChar trainType = trainNumber[0];
    double times;
    if (trainType == 'G') {
        times = 1;
    } else if (trainType == 'D') {
        times = 0.8;
    } else if (trainType == 'C') {
        times = 0.7;
    } else if (trainType == 'T') {
        times = 0.8;
    } else if (trainType == 'K') {
        times = 0.5;
    } else {
        times = 0.3;
    }

    double secondClassPrice = 0;
    int len = stations.size();
    for (int i = 0; i < len - 1; i++) {
        auto result1 = station_manager->getCityByCityName(stations[i].getCityName());
        auto result2 = station_manager->getCityByCityName(stations[i+1].getCityName());
        if (!result1 || !result2) {
            return std::make_tuple(0.0, 0.0, 0.0);
        }
        City city1 = result1.value(), city2 = result2.value();
        double distance = station_manager->computeDistance(city1, city2);
        secondClassPrice += distance * times;
    }
    secondClassPrice = std::round(secondClassPrice * 100.0) / 100.0;
    double firstClassPrice = std::round(secondClassPrice * 1.5 * 100.0) / 100.0;
    double businessClassPrice = std::round(secondClassPrice * 2.0 * 100.0) / 100.0;
    qWarning() << "---" << secondClassPrice;

    return std::make_tuple(firstClassPrice, secondClassPrice, businessClassPrice);
}

