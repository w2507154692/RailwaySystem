#include "city.h"
#include <iostream>

City::City() {}

QString City::getName() {
    return name;
}

double City::getLongitude() {
    return longitude;
}

double City::getLatitude() {
    return latitude;
}

bool operator==(const City &c1, const City &c2) {
    return c1.name == c2.name &&
           c1.longitude == c2.longitude &&
           c1.latitude == c2.latitude;
}

bool operator!=(const City &c1, const City &c2) {
    return !(c1 == c2);
}

std::istream& operator>>(std::istream& is, City& c) {
    std::string nameStd;
    is >> nameStd >> c.longitude >> c.latitude;
    c.name = QString::fromStdString(nameStd);
    return is;
}

std::ostream& operator<<(std::ostream& os, const City& c) {
    os << c.name.toStdString() << " " << c.longitude << " " << c.latitude;
    return os;
}
