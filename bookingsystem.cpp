#include "bookingsystem.h"
#include <QVariantMap>

BookingSystem::BookingSystem(QObject *parent)
    : QObject{parent}
{
    for (int i = 0; i < 2; i ++) {
        Station tmp("测试", "测试");
        std::tuple<Station, Station> t = std::make_tuple(tmp, tmp);
        query_history.push(t);
    }
}

QVariantList BookingSystem::getQueryHistory() {
    QVariantList list;
    std::queue<std::tuple<Station, Station>> tmp = query_history;
    while (!tmp.empty()) {
        Station startStation = std::get<0>(tmp.front());
        Station endStation = std::get<1>(tmp.front());
        QVariantMap map;
        map["startStation"] = startStation.getStationName();
        map["endStation"] = endStation.getStationName();
        list << map;
        tmp.pop();
    }
    return list;
}
