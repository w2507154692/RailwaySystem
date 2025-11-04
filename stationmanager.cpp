#include "stationmanager.h"
#include <math.h>
#include <fstream>
#include <iostream>
#include <QDebug>

StationManager::StationManager(QObject *parent)
    : QObject{parent}
{
    readFromFile("../../data/station.txt", "../../data/city.txt");
    qDebug() << "加载车站的数量：" << stations.size();
    qDebug() << "加载城市的数量：" << stations.size();
}

QStringList StationManager::getCityNames() {
    QStringList list;
    for (auto &city : cities) {
        list << city.getName();
    }
    return list;
}

double StationManager::computeDistance(City &c1, City &c2) {
    double lon1 = c1.getLongitude(), lon2 = c2.getLongitude();
    double lat1 = c1.getLatitude(), lat2 = c2.getLatitude();
    double a = sin((lat1-lat2)/2)*sin((lat1-lat2)/2) + cos(lat1)*cos(lat2)*sin((lon1-lon2)/2)*sin((lon1-lon2)/2);
    double c = 2 * atan2(sqrt(a), sqrt(1-a));
    return  c * 6371.0;
}

std::optional<Station> StationManager::findStationByStationName(const QString &stationName) {
    for (auto &station : stations) {
        if (station.getStationName() == stationName)
            return station;
    }
    return std::nullopt;
}

std::optional<City> StationManager::findCityByCityName(const QString &cityName) {
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
