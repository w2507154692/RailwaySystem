#include "bookingsystem.h"
#include <QVariantMap>
#include <QDebug>
#include <iostream>
#include <stack>

BookingSystem::BookingSystem(StationManager* stationManager, QObject* parent)
    :station_manager(stationManager) , QObject{parent}
{
    // for (int i = 0; i < 2; i ++) {
    //     Station tmp("测试", "测试");
    //     std::tuple<Station, Station> t = std::make_tuple(tmp, tmp);
    //     query_history.push(t);
    // }
}

QVariantList BookingSystem::getQueryHistory() {
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

bool BookingSystem::addQueryHistory(const QString &startCityName, const QString &endCityName) {
    if (!station_manager) {
        return false;
    }
    auto startCityFindResult = station_manager->findCityByCityName(startCityName);
    auto endCityFindResult = station_manager->findCityByCityName(endCityName);
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

bool BookingSystem::clearQueryHistory() {
    while (!query_history.empty()) {
        query_history.pop();
    }
    emit queryHistoryChanged();
    return true;
}

