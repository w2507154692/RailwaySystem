#ifndef TIMETABLE_H
#define TIMETABLE_H
#include "station.h"
#include "time.h"
#include <vector>
#include <tuple>
#include <iostream>

class Timetable
{
private:
    std::vector<std::tuple<Station, Time, Time>> table;

public:
    Timetable();

    // 从时刻表中查找某个车站的信息（到时、发时，始/过/终）
    std::tuple<Time, Time, QString> getStationInfo(const Station &station);
    int getInterval(const Station &station1, const Station &station2);
    std::vector<std::tuple<Station, Station>> getStationPairsBetweenCities(const QString &startCityName, const QString &endCityName);
    int getIndexByStation(const Station &station);
    std::vector<Station> getStationsBetweenStations(const Station &startStation, const Station &endStation);
    std::vector<std::tuple<Station, Time, Time, int, QString>> getInfo(const Station &startStation, const Station &endStation);
    std::tuple<Station, Time> getStartStationInfo();
    std::tuple<Station, Time> getEndStationInfo();

    friend bool operator==(const Timetable &t1, const Timetable &t2);
    friend bool operator!=(const Timetable &t1, const Timetable &t2);
    friend std::ostream &operator<<(std::ostream &os, Timetable &timetable);
    friend std::istream &operator>>(std::istream &is, Timetable &timetable);
};

#endif // TIMETABLE_H
