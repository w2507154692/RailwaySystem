#include "stationmanager.h"
#include <math.h>
#include <fstream>
#include <iostream>
#include <QDebug>
#include <QVariantMap>

StationManager::StationManager(QObject *parent)
    : QObject{parent}
{
    readFromFile("../../data/station.txt", "../../data/city.txt");
    qDebug() << "加载车站的数量：" << stations.size();
    qDebug() << "加载城市的数量：" << stations.size();
}

QStringList StationManager::getCitiesName_api() {
    QStringList list;
    for (auto &city : cities) {
        list << city.getName();
    }
    return list;
}

QVariantMap StationManager::getCitiesByStationNames_api(const QString &startStationName, const QString &endStationName) {
    QVariantMap result;
    
    // 获取起始站对应的城市
    auto startStation = getStationByStationName(startStationName);
    if (startStation.has_value()) {
        result["startCity"] = startStation->getCityName();
    } else {
        result["startCity"] = startStationName; // 如果找不到，使用车站名
    }
    
    // 获取终到站对应的城市
    auto endStation = getStationByStationName(endStationName);
    if (endStation.has_value()) {
        result["endCity"] = endStation->getCityName();
    } else {
        result["endCity"] = endStationName; // 如果找不到，使用车站名
    }
    
    return result;
}

QVariantList StationManager::getAllStationNames_api() {
    QVariantList list;
    for (auto station : stations) {
        list << station.getStationName();
    }
    return list;
}

double StationManager::computeDistance(City &c1, City &c2) {
    const double PI = 3.14159265358979323846;
    double lon1 = c1.getLongitude() * PI / 180.0;
    double lon2 = c2.getLongitude() * PI / 180.0;
    double lat1 = c1.getLatitude() * PI / 180.0;
    double lat2 = c2.getLatitude() * PI / 180.0;
    double a = sin((lat1-lat2)/2)*sin((lat1-lat2)/2) + cos(lat1)*cos(lat2)*sin((lon1-lon2)/2)*sin((lon1-lon2)/2);
    double c = 2 * atan2(sqrt(a), sqrt(1-a));
    double km = std::round(c * 6371.0 * 100.0) / 100.0;
    qWarning() << km;
    return  km;
}

std::optional<Station> StationManager::getStationByStationName(const QString &stationName) {
    for (auto &station : stations) {
        if (station.getStationName() == stationName)
            return station;
    }
    return std::nullopt;
}

std::optional<City> StationManager::getCityByCityName(const QString &cityName) {
    for (auto &city : cities) {
        if (city.getName() == cityName)
            return city;
    }
    return std::nullopt;
}

void StationManager::readFromFileStations(const char filename[]) {
    std::fstream fis(filename, std::ios::in);
    if (!fis) qWarning() << "车站文件不存在！";
    Station station;
    while (fis >> station)
        stations.push_back(station);

    return ;
}

void StationManager::readFromFileCities(const char filename[]) {
    std::fstream fis(filename, std::ios::in);
    if (!fis) qWarning() << "城市信息文件不存在！";
    City city;
    while (fis >> city)
        cities.push_back(city);

    return ;
}

void StationManager::readFromFile(const char filenameStations[], const char filenameCities[]) {
    readFromFileStations(filenameStations);
    readFromFileCities(filenameCities);

    return ;
}
