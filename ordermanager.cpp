#include "ordermanager.h"
#include <fstream>
#include <iostream>
#include <QDebug>
#include <QVariantMap>

OrderManager::OrderManager(QObject *parent)
    : QObject{parent}
{
    readFromFile("../../data/order.txt");
}

QVariantList OrderManager::getOrdersByUsername_api(const QString &username) {
    QVariantList list;
    std::vector<Order> findResult = getOrdersByUsername(username);
    for (auto &order : findResult) {
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
        std::tuple<Time, Time, QString> startStationInfo =
            order.getTimetable().getStationInfo(startSation);
        std::tuple<Time, Time, QString> endStationInfo =
            order.getTimetable().getStationInfo(endStation);
        map["startStationName"] = startSation.getStationName();
        map["startStationStopInfo"] = std::get<2>(startStationInfo);
        map["startHour"] = std::get<1>(startStationInfo).getHour();
        map["startMinute"] = std::get<1>(startStationInfo).getMinute(), 2, 10, QChar('0');
        map["endStationName"] = endStation.getStationName();
        map["endStationStopInfo"] = std::get<2>(endStationInfo);
        map["endHour"] = std::get<0>(endStationInfo).getHour(), 2, 10, QChar('0');
        map["endMinute"] = std::get<0>(endStationInfo).getMinute(), 2, 10, QChar('0');
        
        int intervalSeconds = order.getTimetable().getInterval(startSation, endStation);
        int hours = intervalSeconds / 3600, minutes = (intervalSeconds % 3600) / 60;
        map["intervalHour"] = hours;
        map["intervalMinute"] = minutes;

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
        std::tuple<Time, Time, QString> startStationInfo =
            order.getTimetable().getStationInfo(startSation);
        std::tuple<Time, Time, QString> endStationInfo =
            order.getTimetable().getStationInfo(endStation);
        map["startStationName"] = startSation.getStationName();
        map["startStationStopInfo"] = std::get<2>(startStationInfo);
        map["startHour"] = std::get<1>(startStationInfo).getHour();
        map["startMinute"] = std::get<1>(startStationInfo).getMinute(), 2, 10, QChar('0');
        map["endStationName"] = endStation.getStationName();
        map["endStationStopInfo"] = std::get<2>(endStationInfo);
        map["endHour"] = std::get<0>(endStationInfo).getHour(), 2, 10, QChar('0');
        map["endMinute"] = std::get<0>(endStationInfo).getMinute(), 2, 10, QChar('0');

        int intervalSeconds = order.getTimetable().getInterval(startSation, endStation);
        int hours = intervalSeconds / 3600, minutes = (intervalSeconds % 3600) / 60;
        map["intervalHour"] = hours;
        map["intervalMinute"] = minutes;

        list << map;
    }

    return list;
}

std::vector<Order> OrderManager::getOrdersByTrainNumberAndDate(const QString &trainNumber, const Date &date) {
    std::vector<Order> result;
    for (auto &order : orders) {
        if (order.getStatus() == "待乘坐" && order.getTrainNumber() == trainNumber && order.getDate() == date) {
            result.push_back(order);
        }
    }
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
    for (auto &order : orders) {
        if (order.getOrderNumber() == orderNumber) {
            return order;
        }
    }
    return std::nullopt;
}

QVariantMap OrderManager::getOrderByOrderNumber_api(const QString &orderNumber) {
    auto orderOpt = getOrderByOrderNumber(orderNumber);
    if (orderOpt.has_value()) {
        Order &order = orderOpt.value();
        QVariantMap orderMap;
        orderMap["orderNumber"] = order.getOrderNumber();
        orderMap["trainNumber"] = order.getTrainNumber();
        orderMap["year"] = order.getDate().getYear();
        orderMap["month"] = order.getDate().getMonth();
        orderMap["day"] = order.getDate().getDay();
        orderMap["seatLevel"] = order.getSeatLevel();
        orderMap["carriageNumber"] = order.getCarriageNumber();
        orderMap["seatRow"] = order.getSeatRow();
        orderMap["seatCol"] = order.getSeatCol();
        orderMap["price"] = order.getPrice();
        orderMap["status"] = order.getStatus();
        orderMap["passengerName"] = order.getPassenger().getName();
        orderMap["type"] = order.getPassenger().getType();
        orderMap["username"] = order.getUsername();  // 添加订单所属用户名
        
        // 添加起止站点和时间信息
        Station startStation = order.getStartStation();
        Station endStation = order.getEndStation();
        std::tuple<Time, Time, QString> startStationInfo =
            order.getTimetable().getStationInfo(startStation);
        std::tuple<Time, Time, QString> endStationInfo =
            order.getTimetable().getStationInfo(endStation);
        orderMap["startStationName"] = startStation.getStationName();
        orderMap["startStationStopInfo"] = std::get<2>(startStationInfo);
        orderMap["startHour"] = std::get<1>(startStationInfo).getHour();
        orderMap["startMinute"] = std::get<1>(startStationInfo).getMinute();
        orderMap["endStationName"] = endStation.getStationName();
        orderMap["endStationStopInfo"] = std::get<2>(endStationInfo);
        orderMap["endHour"] = std::get<0>(endStationInfo).getHour();
        orderMap["endMinute"] = std::get<0>(endStationInfo).getMinute();

        int intervalSeconds = order.getTimetable().getInterval(startStation, endStation);
        int hours = intervalSeconds / 3600, minutes = (intervalSeconds % 3600) / 60;
        orderMap["intervalHour"] = hours;
        orderMap["intervalMinute"] = minutes;
        
        return orderMap;
    }
    return QVariantMap(); // 返回空 map
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
