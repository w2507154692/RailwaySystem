#include "timetable.h"

Timetable::Timetable() {}

std::tuple<Time, Time, QString> Timetable::getStationInfo(const Station &station) {
    int len = table.size();
    for (int i = 0; i < len; i++) {
        Station &s = std::get<0>(table[i]);
        if (s == station) {
            Time &arrivalTime = std::get<1>(table[i]);
            Time &departureTime = std::get<2>(table[i]);
            QString passInfo;
            if (i == 0) {
                passInfo = "始";
            } else if (i == len - 1) {
                passInfo = "终";
            } else {
                passInfo = "过";
            }
            return std::make_tuple(arrivalTime, departureTime, passInfo);
        }
    }
    return std::make_tuple(Time(), Time(), QString("Not Found"));
}

int Timetable::getInterval(const Station &station1, const Station &station2) {
    int day = 0, len = table.size();
    Time time1, time2;
    for (int i = 0; i < len; i++) {
        Station &station = std::get<0>(table[i]);
        if (station == station1) {
            time1 = std::get<2>(table[i]);
        }
        if (station == station2) {
            time2 = std::get<1>(table[i]);
        }
        if (i > 0 && std::get<1>(table[i]) < std::get<2>(table[i-1])) {
            day++;
        }
    }
    return time2 - time1 + 60 * 60 * 24 * day;
}

std::vector<std::tuple<Station, Station>> Timetable::getStationPairsBetweenCities(const QString &startCityName, const QString &endCityName) {
    std::vector<std::tuple<Station, Station>> result;
    int len = table.size();
    for (int i = 0; i < len - 1; i++) {
        Station s1 = std::get<0>(table[i]);
        if (s1.getCityName() == startCityName) {
            for (int j = i + 1; j < len; j++) {
                Station s2 = std::get<0>(table[j]);
                if (s2.getCityName() == endCityName) {
                    std::tuple<Station, Station> t = std::make_tuple(s1, s2);
                    result.push_back(t);
                }
            }
        }
    }
    return result;
}

int Timetable::getIndexByStation(const Station &station) {
    int len = table.size();
    for (int i = 0; i < len; i++) {
        if (std::get<0>(table[i]) == station) {
            return i;
        }
    }
    return -1;
}

std::vector<Station> Timetable::getStationsBetweenStations(const Station &startStation, const Station &endStation) {
    std::vector<Station> result;
    bool flag = false;
    for (auto &stop : table) {
        Station station = std::get<0>(stop);
        if (station == startStation) {
            flag = true;
        }
        if (flag) {
            result.push_back(station);
        }
        if (station == endStation) {
            flag = false;
            break;
        }
    }
    return result;
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
