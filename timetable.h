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
    std::tuple<Station, Time, Time, QString> getStationInfo(const QString &stationName);
    int getInterval(const QString &stationName1, const QString &stationName2);

    friend bool operator==(const Timetable &t1, const Timetable &t2);
    friend bool operator!=(const Timetable &t1, const Timetable &t2);
    friend std::ostream &operator<<(std::ostream &os, const Timetable &timetable);
    friend std::istream &operator>>(std::istream &is, Timetable &timetable);
};

#endif // TIMETABLE_H
