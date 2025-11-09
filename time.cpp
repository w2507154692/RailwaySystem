#include "time.h"
#include <iomanip>

Time::Time() {}

Time::Time(int hour, int minute, int second)
    : hour(hour), minute(minute), second(second) {}

int Time::getHour() {
    return hour;
}

bool Time::setHour(int hour) {
    this->hour = hour;
    return true;
}

int Time::getMinute() {
    return minute;
}

bool Time::setMinute(int minute) {
    this->minute = minute;
    return true;
}

int Time::getSecond() {
    return second;
}

bool Time::setSecond(int second) {
    this->second = second;
    return true;
}

bool operator==(const Time &t1, const Time &t2) {
    return t1.hour == t2.hour &&
           t1.minute == t2.minute &&
           t1.second == t2.second;
}

bool operator!=(const Time &t1, const Time &t2) {
    return !(t1 == t2);
}

int operator-(const Time &t1, const Time &t2) {
    int totalSeconds1 = t1.hour * 3600 + t1.minute * 60 + t1.second;
    int totalSeconds2 = t2.hour * 3600 + t2.minute * 60 + t2.second;
    return totalSeconds1 - totalSeconds2;
}

std::ostream &operator<<(std::ostream &os, const Time &t) {
    if (t.hour == -1 || t.minute == -1 || t.second == -1) {
        os << "---";
    }
    else {
        os << std::setw(2) << std::setfill('0') << t.hour << ":"
           << std::setw(2) << std::setfill('0') << t.minute << ":"
           << std::setw(2) << std::setfill('0') << t.second;
    }

    return os;
}

std::istream &operator>>(std::istream &is, Time &t) {
    std::string input;
    is >> input;
    if (input == "---") {
        t.hour = t.minute = t.second = -1;
    } else {
        std::istringstream ss(input);
        char delimiter1, delimiter2;
        ss >> t.hour >> delimiter1 >> t.minute >> delimiter2 >> t.second;
    }
    return is;
}
