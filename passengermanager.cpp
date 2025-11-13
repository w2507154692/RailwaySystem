#include "passengermanager.h"
#include <iostream>
#include <fstream>
#include <QDebug>

PassengerManager::PassengerManager(QObject *parent)
    : QObject{parent}
{
    readFromFile("../../data/passenger.txt");
    writeToFile("../../data/passenger1.txt");
}

std::optional<Passenger> PassengerManager::getPassengerById(const QString &id) {
    for (auto &passenger : passengers) {
        if (passenger.getId() == id) {
            return passenger;
        }
    }
    return std::nullopt;
}

QVariantList PassengerManager::getPassengersByUsername_api(const QString &username) {
    QVariantList list;
    auto passengerList = getPassengersByUsername(username);
    for (auto &passenger : passengerList) {
        QVariantMap map;
        map["name"] = passenger.getName();
        map["phoneNumber"] = passenger.getPhoneNumber();
        map["id"] = passenger.getId();
        map["type"] = passenger.getType();
        list << map;
    }
    return list;
}

QVariantMap PassengerManager::deletePassenger_api(const QString &username, const QString &id) {
    QVariantMap result;
    for (auto it = passengers.begin(); it != passengers.end(); it++) {
        if (it->getUsername() == username && it->getId() == id) {
            result["success"] = true;
            result["message"] = QString("用户 %1 下的乘车人 %2 删除成功！").arg(username, id);
            passengers.erase(it);
            return result;
        }
    }
    result["success"] = false;
    result["message"] = QString("未找到用户 %1 下的乘车人 %2 ！").arg(username, id);
    return result;
}

std::vector<Passenger> PassengerManager::getPassengersByUsername(const QString &username) {
    std::vector<Passenger> result;
    for (auto &passenger : passengers) {
        if (passenger.getUsername() == username) {
            result.push_back(passenger);
        }
    }
    return result;
}

bool PassengerManager::readFromFile(const char filename[]) {
    std::fstream fis(filename, std::ios::in);
    if (!fis) {
        qWarning() << "乘车人文件不存在！";
        return false;
    }
    Passenger passenger;
    while (fis >> passenger) {
        passengers.push_back(passenger);
    }
    return true;
}

bool PassengerManager::writeToFile(const char filename[]) {
    std::fstream fos(filename, std::ios::out);
    if (!fos) {
        qWarning() << "无法打开乘车人文件进行写入！";
        return false;
    }
    for (auto &passenger : passengers) {
        fos << passenger << std::endl;
    }
    return true;
}

