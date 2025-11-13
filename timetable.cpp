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

std::vector<std::tuple<Station, Time, Time, int, QString>> Timetable::getInfo(const Station &startStation, const Station &endStation) {
    std::vector<std::tuple<Station, Time, Time, int, QString>> result;
    int startStationIndex = getIndexByStation(startStation);
    int endStationIndex = getIndexByStation(endStation);
    int len =table.size();
    for (int i = 0; i < len; i++) {
        QString info;
        if (i < startStationIndex || i > endStationIndex) {
            info = "其他站";
        }
        else if (i == startStationIndex || i == endStationIndex) {
            info = "起末站";
        }
        else {
            info = "中间站";
        }
        Time arriveTime = std::get<1>(table[i]);
        Time departureTime = std::get<2>(table[i]);
        int stopInterval;
        if (arriveTime.isNull() || departureTime.isNull()) {
            stopInterval = -1;
        }
        else if (departureTime < arriveTime) {
            stopInterval = (departureTime - arriveTime + 24 * 60 * 60) / 60;
        }
        else {
            stopInterval = (departureTime - arriveTime) / 60;
        }

        std::tuple<Station, Time, Time, int, QString> t = std::make_tuple(std::get<0>(table[i]), arriveTime, departureTime, stopInterval, info);
        result.push_back(t);
    }
    return result;
}

std::tuple<Station, Time> Timetable::getStartStationInfo() {
    Station startStation = std::get<0>(table[0]);
    Time departureTime = std::get<2>(table[0]);
    return std::make_tuple<startStation, departureTime>
}

std::tuple<Station, Time> Timetable::getEndStationInfo() {
    int len = table.size();
    Station endStation = std::get<0>(table[len-1]);
    Time arriveTime = std::get<2>(table[len-1]);
    return std::make_tuple<endStation, arriveTime>
}

bool operator==(const Timetable &t1, const Timetable &t2) {
    return t1.table == t2.table;
}

bool operator!=(const Timetable &t1, const Timetable &t2) {
    return !(t1 == t2);
}

std::ostream &operator<<(std::ostream &os, Timetable &timetable) {
    os << timetable.table.size() << std::endl;
    for (auto &entry : timetable.table) {
        Station &station = std::get<0>(entry);
        Time &arrival = std::get<1>(entry);
        Time &departure = std::get<2>(entry);
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
