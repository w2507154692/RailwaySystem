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
    for (const auto &train : trains) {
        fos << train << std::endl;
    }
    return true;
}
