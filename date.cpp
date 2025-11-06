#include "date.h"
#include <iomanip>
#include <QChar>

Date::Date() {}

Date::Date(int year, int month, int day)
    : year(year), month(month), day(day) {}

int Date::getYear() {
    return year;
}

bool Date::setYear(int year) {
    this->year = year;
    return true;
}

int Date::getMonth() {
    return month;
}

bool Date::setMonth(int month) {
    this->month = month;
    return true;
}

int Date::getDay() {
    return day;
}

bool Date::setDay(int day) {
    this->day = day;
    return true;
}

bool operator==(const Date &d1, const Date &d2) {
    return d1.year == d2.year &&
           d1.month == d2.month &&
           d1.day == d2.day;
}

bool operator!=(const Date &d1, const Date &d2) {
    return !(d1 == d2);
}

std::ostream &operator<<(std::ostream &os, const Date &d) {
    os << std::setw(4) << std::setfill('0') << d.year << "-"
       << std::setw(2) << std::setfill('0') << d.month << "-"
       << std::setw(2) << std::setfill('0') << d.day;
    return os;
}

std::istream &operator>>(std::istream &is, Date &d) {
    char delimiter1, delimiter2;
    is >> d.year >> delimiter1 >> d.month >> delimiter2 >> d.day;
    return is;
}
