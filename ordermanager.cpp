#include "ordermanager.h"
#include <fstream>
#include <iostream>
#include <QDebug>
#include <QVariantMap>

bool isDateTimeIntervalOverlap(Date &startDate1, Date &startDate2,
                               Time &startTime1, Time &startTime2,
                               Date &endDate1, Date &endDate2,
                               Time &endTime1, Time &endTime2) {
    // 先判断日期区间是否有交集
    if (endDate1 < startDate2 || endDate2 < startDate1) {
        return false;
    }
    // 日期区间有交集，进一步判断时间
    // 统一将区间转为 [start, end]，比较是否有重叠
    // 情况1：区间1在区间2前面
    if (endDate1 == startDate2) {
        if (endTime1 < startTime2) return false;
    }
    // 情况2：区间2在区间1前面
    if (endDate2 == startDate1) {
        if (endTime2 < startTime1) return false;
    }
    // 其它情况均视为有重叠
    return true;
}

QVariantMap converOrderToMap(Order &order) {
    QVariantMap map;
    map["orderNumber"] = order.getOrderNumber();
    map["trainNumber"] = order.getTrainNumber();
    map["year"] = order.getDate().getYear();
    map["month"] = order.getDate().getMonth();
    map["day"] = order.getDate().getDay();
    map["seatLevel"] = order.getSeatLevel();
    map["carriageNumber"] = order.getCarriageNumber();
    map["seatRow"] = order.getSeatRow();
    map["seatCol"] = order.getSeatCol();
    map["price"] = order.getPrice();
    map["status"] = order.getStatus();
    map["passengerName"] = order.getPassenger().getName();
    map["type"] = order.getPassenger().getType();

    Station startSation = order.getStartStation();
    Station endStation = order.getEndStation();
    std::tuple<Time, Time, int, int, QString> startStationInfo =
        order.getTimetable().getStationInfo(startSation.getStationName());
    std::tuple<Time, Time, int, int, QString> endStationInfo =
        order.getTimetable().getStationInfo(endStation.getStationName());
    map["startStationName"] = startSation.getStationName();
    map["startStationStopInfo"] = std::get<4>(startStationInfo);
    map["startHour"] = std::get<1>(startStationInfo).getHour();
    map["startMinute"] = std::get<1>(startStationInfo).getMinute(), 2, 10, QChar('0');
    map["endStationName"] = endStation.getStationName();
    map["endStationStopInfo"] = std::get<4>(endStationInfo);
    map["endHour"] = std::get<0>(endStationInfo).getHour(), 2, 10, QChar('0');
    map["endMinute"] = std::get<0>(endStationInfo).getMinute(), 2, 10, QChar('0');

    int intervalSeconds = order.getTimetable().getInterval(startSation, endStation);
    int hours = intervalSeconds / 3600, minutes = (intervalSeconds % 3600) / 60;
    map["intervalHour"] = hours;
    map["intervalMinute"] = minutes;

    return map;
}

OrderManager::OrderManager(QObject *parent)
    : QObject{parent}
{
    readFromFile("../../data/order.txt");
}

QVariantList OrderManager::getOrdersByUsername_api(const QString &username) {
    QVariantList list;
    std::vector<Order> findResult = getOrdersByUsername(username);
    for (auto &order : findResult) {
        QVariantMap map = converOrderToMap(order);
        list << map;
    }
    
    return list;
}

QVariantMap OrderManager::cancelOrder_api(const QString &orderNumber) {
    QVariantMap result;
    auto findResult = getOrderByOrderNumber(orderNumber);
    if (findResult) {
        Order &order = findResult.value();
        if (order.getStatus() != "待乘坐") {
            result["success"] = false;
            result["message"] = QString("订单 %1 无法取消！").arg(orderNumber);
            return result;
        }
        cancelOrder(orderNumber);
        result["success"] = true;
        result["message"] = QString("订单 %1 取消成功！").arg(orderNumber);
        return result;
    } else {
        result["success"] = false;
        result["message"] = QString("订单 %1 不存在！").arg(orderNumber);
        return result;
    }
}

QVariantList OrderManager::getTimetableInfo_api(const QString &orderNumber) {
    QVariantList list;
    auto findResult = getOrderByOrderNumber(orderNumber);
    if (!findResult) {
        return list;
    }
    Order &order = findResult.value();
    std::vector<std::tuple<Station, Time, Time, int, QString>> info = order.getTimetable().getInfo(order.getStartStation().getStationName(), order.getEndStation().getStationName());
    for (auto &t : info) {
        QVariantMap map;
        Station station = std::get<0>(t);
        Time arriveTime = std::get<1>(t);
        Time departureTime = std::get<2>(t);
        int stopInterval = std::get<3>(t);
        QString passInfo = std::get<4>(t);
        map["stationName"] = station.getStationName();
        map["arriveHour"] = arriveTime.getHour();
        map["arriveMinute"] = arriveTime.getMinute();
        map["departureHour"] = departureTime.getHour();
        map["departureMinute"] = departureTime.getMinute();
        map["stopInterval"] = stopInterval;
        map["passInfo"] = passInfo;
        list << map;
    }
    return list;
}

QVariantList OrderManager::getOrders_api() {
    QVariantList list;
    for (auto &order : orders) {
        QVariantMap map = converOrderToMap(order);
        list << map;
    }

    return list;
}

QVariantMap OrderManager::getOrderByOrderNumber_api(const QString &orderNumber) {
    auto findResult = getOrderByOrderNumber(orderNumber);
    if (findResult) {
        Order order = findResult.value();
        QVariantMap map = converOrderToMap(order);
        return map;
    }
    return QVariantMap(); // 返回空 map
}

bool OrderManager::isPassengerAvailable(const QString &passengerId, Date &queryStartDate, Date &queryEndDate, Time &queryStartTime, Time &queryEndTime) {
    for (auto order : orders) {
        if (order.getPassenger().getId() == passengerId && order.getStatus() == "待乘坐") {
            Date orderStartDate = order.getDate();
            std::tuple<Time, Time, int, int, QString> startStationInfo = order.getTimetable().getStationInfo(order.getStartStation().getStationName());
            std::tuple<Time, Time, int, int, QString> endStationInfo = order.getTimetable().getStationInfo(order.getEndStation().getStationName());
            Date orderEndDate = orderStartDate + std::get<2>(endStationInfo) - std::get<3>(startStationInfo);
            Time orderStartTime = std::get<1>(startStationInfo);
            Time orderEndTime = std::get<0>(endStationInfo);
            if (isDateTimeIntervalOverlap(orderStartDate, queryStartDate,
                                          orderStartTime, queryStartTime,
                                          orderEndDate, queryEndDate,
                                          orderEndTime, queryEndTime)) {
                return false;
            }
        }
    }
    return true;
}

std::vector<Order> OrderManager::getOrdersUnusedAndOverlapByTrainNumber(const QString &trainNumber, Date &queryStartDate, Date &queryEndDate, Time &queryStartTime, Time &queryEndTime) {
    std::vector<Order> result;
    for (auto order : orders) {
        if (order.getStatus() == "待乘坐" && order.getTrainNumber() == trainNumber) {
            Date orderStartDate = order.getDate();
            std::tuple<Time, Time, int, int, QString> startStationInfo = order.getTimetable().getStationInfo(order.getStartStation().getStationName());
            std::tuple<Time, Time, int, int, QString> endStationInfo = order.getTimetable().getStationInfo(order.getEndStation().getStationName());
            Date orderEndDate = orderStartDate + std::get<2>(endStationInfo) - std::get<3>(startStationInfo);
            Time orderStartTime = std::get<1>(startStationInfo);
            Time orderEndTime = std::get<0>(endStationInfo);
            if (isDateTimeIntervalOverlap(orderStartDate, queryStartDate,
                                          orderStartTime, queryStartTime,
                                          orderEndDate, queryEndDate,
                                          orderEndTime, queryEndTime)) {
                result.push_back(order);
            }
        }
    }
    return result;
}

QVariantMap OrderManager::getPassengerByOrderNumber_api(const QString &orderNumber) {
    QVariantMap result;
    auto findResult = getOrderByOrderNumber(orderNumber);
    if (!findResult) {
        result["success"] = false;
        return result;
    }
    Order order = findResult.value();
    Passenger passenger = order.getPassenger();
    QVariantMap p;
    p["name"] = passenger.getName();
    p["phoneNumber"] = passenger.getPhoneNumber();
    p["id"] = passenger.getId();
    p["type"] = passenger.getType();
    result["success"] = true;
    result["passenger"] = p;
    return result;
}

std::vector<Order> OrderManager::getOrdersByUsername(const QString &username) {
    std::vector<Order> result;
    for (auto &order : orders) {
        if (order.getUsername() == username) {
            result.push_back(order);
        }
    }
    return result;
}

std::optional<Order> OrderManager::getOrderByOrderNumber(const QString &orderNumber) {
    for (auto order : orders) {
        if (order.getOrderNumber() == orderNumber) {
            return order;
        }
    }
    return std::nullopt;
}


bool OrderManager::cancelOrder(const QString &orderNumber) {
    for (auto &order : orders) {
        if (order.getOrderNumber() == orderNumber) {
            order.setStatus("已取消");
            return true;
        }
    }
    return false;
}

bool OrderManager::readFromFile(const char filename[]) {
    std::fstream fis(filename, std::ios::in);
    if (!fis) {
        qWarning() << "订单文件不存在！";
        return false;
    }
    Order order;
    while (fis >> order) {
        orders.push_back(order);
    }
    return true;
}

bool OrderManager::writeToFile(const char filename[]) {
    std::fstream fos(filename, std::ios::out);
    if (!fos) {
        qWarning() << "无法打开订单文件进行写入！";
        return false;
    }
    for (auto &order : orders) {
        fos << order << std::endl;
    }
    return true;
}
