#include "timetable.h"

Timetable::Timetable() {}

std::tuple<Station, Time, Time, QString> Timetable::getStationInfo(const QString &stationName) {
    int len = table.size();
    for (int i = 0; i < len; i++) {
        Station &station = std::get<0>(table[i]);
        if (station.getStationName() == stationName) {
            Time &arrival = std::get<1>(table[i]);
            Time &departure = std::get<2>(table[i]);
            QString passInfo;
            if (i == 0) {
                passInfo = "始";
            } else if (i == len - 1) {
                passInfo = "终";
            } else {
                passInfo = "过";
            }
            return std::make_tuple(station, arrival, departure, passInfo);
        }
    }
    return std::make_tuple(Station(), Time(), Time(), QString("Not Found"));
}

int Timetable::getInterval(const QString &stationName1, const QString &stationName2) {
    int len = table.size();
    Time time1, time2;
    for (int i = 0; i < len; i++) {
        Station &station = std::get<0>(table[i]);
        if (station.getStationName() == stationName1) {
            time1 = std::get<2>(table[i]);
        }
        if (station.getStationName() == stationName2) {
            time2 = std::get<1>(table[i]);
        }
    }
    return time2 - time1;
}

bool operator==(const Timetable &t1, const Timetable &t2) {
    return t1.table == t2.table;
}

bool operator!=(const Timetable &t1, const Timetable &t2) {
    return !(t1 == t2);
}

std::ostream &operator<<(std::ostream &os, const Timetable &timetable) {
    os << timetable.table.size() << std::endl;
    for (const auto &entry : timetable.table) {
        const Station &station = std::get<0>(entry);
        const Time &arrival = std::get<1>(entry);
        const Time &departure = std::get<2>(entry);
        os << station << " " << arrival << " " << departure << std::endl;
    }
    return os;
}

std::istream &operator>>(std::istream &is, Timetable &timetable) {
    timetable.table.clear();
    Station station;
    Time arrival, departure;
    int count;
    is >> count;
    timetable.table.resize(count);
    for (int i = 0; i < count; ++i) {
        is >> station >> arrival >> departure;
        timetable.table[i] = std::make_tuple(station, arrival, departure);
    }
    return is;
}
