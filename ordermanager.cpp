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

QVariantList OrderManager::getOrders_api(const QString &username) {
    QVariantList list;
    std::vector<Order> findResult = findOrdersByUsername(username);
    for (auto &order : findResult) {
        QVariantMap map;
        map["orderNumber"] = order.getOrderNumber();
        map["trainNumber"] = order.getTrainNumber();
        map["date"] = QString("%1年%2月%3日")
                          .arg(order.getDate().getYear())
                          .arg(order.getDate().getMonth())
                          .arg(order.getDate().getDay());
        map["seatLevel"] = order.getSeatLevel();
        map["carriageNumber"] = QString("%1车").arg(order.getCarriageNumber(), 2, 10, QChar('0'));
        map["seatRow"] = QString("%1").arg(order.getSeatRow(), 2, 10, QChar('0'));
        QChar seatLetter('A' + order.getSeatCol() - 1);
        map["seatCol"] = QString("%1号").arg(seatLetter);
        map["price"] = QString::number(order.getPrice());
        map["status"] = order.getStatus();
        map["passengerName"] = order.getPassenger().getPassengerName();
        map["type"] = QString("%1票").arg(order.getPassenger().getType());
        
        std::tuple<Station, Time, Time, QString> startStationInfo =
            order.getTimetable().getStationInfo(order.getStartStationName());
        std::tuple<Station, Time, Time, QString> endStationInfo =
            order.getTimetable().getStationInfo(order.getEndStationName());
        map["startStationName"] = std::get<0>(startStationInfo).getStationName() +
                                    "（" + std::get<3>(startStationInfo) + "）";
        map["startTime"] = QString("%1:%2")
                                .arg(std::get<2>(startStationInfo).getHour(), 2, 10, QChar('0'))
                                .arg(std::get<2>(startStationInfo).getMinute(), 2, 10, QChar('0'));
        map["endStationName"] = std::get<0>(endStationInfo).getStationName() +
                                  "（" + std::get<3>(endStationInfo) + "）";
        map["endTime"] = QString("%1:%2")
                              .arg(std::get<1>(endStationInfo).getHour(), 2, 10, QChar('0'))
                              .arg(std::get<1>(endStationInfo).getMinute(), 2, 10, QChar('0'));
        
        int intervalSeconds = order.getTimetable().getInterval(
            order.getStartStationName(), order.getEndStationName());
        int hours = intervalSeconds / 3600, minutes = (intervalSeconds % 3600) / 60;
        map["interval"] = QString("%1时%2分").arg(hours).arg(minutes);

        list << map;
    }
    
    return list;
}

QVariantMap OrderManager::cancelOrder_api(const QString &orderNumber) {
    QVariantMap result;
    auto findResult = findOrdersByOrderNumber(orderNumber);
    if (findResult) {
        Order &order = findResult.value();
        if (order.getStatus() != "待乘坐") {
            result["success"] = false;
            result["message"] = QString("该订单无法取消！").arg(orderNumber);
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

std::vector<Order> OrderManager::findOrdersByUsername(const QString &username) {
    std::vector<Order> result;
    for (auto &order : orders) {
        if (order.getUsername() == username) {
            result.push_back(order);
        }
    }
    return result;
}

std::optional<Order> OrderManager::findOrdersByOrderNumber(const QString &orderNumber) {
    for (auto &order : orders) {
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
    for (const auto &order : orders) {
        fos << order << std::endl << std::endl;
    }
    return true;
}
