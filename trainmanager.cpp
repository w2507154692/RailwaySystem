#include "trainmanager.h"
#include <iostream>
#include <fstream>
#include <QDebug>

TrainManager::TrainManager(QObject *parent)
    : QObject{parent}
{
    readFromFile("../../data/train.txt");
    writeToFile("../../data/train1.txt");
}

QVariantList TrainManager::getTrains_api() {
    QVariantList list;
    for (auto &train : trains) {
        QVariantMap map;
        map["trainNumber"] = train.getNumber();

        std::tuple<Station, Time> startStationInfo = train.getTimetable().getStartStationInfo();
        std::tuple<Station, Time> endStationInfo = train.getTimetable().getEndStationInfo();
        Station startStation = std::get<0>(startStationInfo);
        Time startTime = std::get<1>(startStationInfo);
        Station endStation = std::get<0>(endStationInfo);
        Time endTime = std::get<1>(endStationInfo);
        map["startStationName"] = startStation.getStationName();
        map["startHour"] = startTime.getHour();
        map["startMinute"] = startTime.getMinute();
        map["endStationName"] = endStation.getStationName();
        map["endHour"] = endTime.getHour();
        map["endMinute"] = endTime.getMinute();

        int intervalSeconds = train.getTimetable().getInterval(startStation, endStation);
        int hours = intervalSeconds / 3600, minutes = (intervalSeconds % 3600) / 60;
        map["intervalHour"] = hours;
        map["intervalMinute"] = minutes;

        list << map;
    }
    return list;
}

QVariantMap TrainManager::deleteTrain_api(const QString &trainNumber) {
    QVariantMap result;
    for (auto it = trains.begin(); it != trains.end(); it++) {
        if (it->getNumber() == trainNumber) {
            result["success"] = true;
            result["message"] = QString("车次 %1 删除成功！").arg(trainNumber);
            trains.erase(it);
            return result;
        }
    }
    result["success"] = false;
    result["message"] = QString("未找到车次 %1").arg(trainNumber);
    return result;
}

std::vector<std::tuple<Train, Station, Station>> TrainManager::getRoutesByCities(const QString &startCityName, const QString &endCityName) {
    std::vector<std::tuple<Train, Station, Station>> result;
    for (auto &train : trains) {
        std::vector<std::tuple<Station, Station>> stationPairs = train.getTimetable().getStationPairsBetweenCities(startCityName, endCityName);
        for (auto &pair : stationPairs) {
            Station s1 = std::get<0>(pair);
            Station s2 = std::get<1>(pair);
            std::tuple<Train, Station, Station> t = std::make_tuple(train, s1, s2);
            result.push_back(t);
        }
    }
    return result;
}

bool TrainManager::readFromFile(const char filename[]) {
    std::fstream fis(filename, std::ios::in);
    if (!fis) {
        qWarning() << "列车文件不存在！";
        return false;
    }
    Train train;
    while (fis >> train) {
        trains.push_back(train);
    }
    return true;
}

bool TrainManager::writeToFile(const char filename[]) {
    std::fstream fos(filename, std::ios::out);
    if (!fos) {
        qWarning() << "无法打开列车文件进行写入！";
        return false;
    }
    for (auto &train : trains) {
        fos << train << std::endl;
    }
    return true;
}
