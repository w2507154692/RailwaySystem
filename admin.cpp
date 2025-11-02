#include "admin.h"

Admin::Admin() {}

QString Admin::getUsername() {
    return username;
}

bool Admin::setUsername(const QString &username) {
    this->username = username;
    return true;
}

QString Admin::getPassword() {
    return password;
}

bool Admin::setPassword(const QString &password) {
    this->password = password;
    return true;
}

bool Admin::isLocked() {
    return locked;
}

bool Admin::lock() {
    locked = true;
    return true;
}

bool Admin::unlock() {
    locked = false;
    return true;
}

Admin& Admin::operator()(const QString &username, const QString &password, bool locked) {
    this->username = username;
    this->password = password;
    this->locked = locked;
    return *this;
}

bool operator==(const Admin &a1, const Admin &a2) {
    return (a1.username == a2.username) &&
           (a1.password == a2.password) &&
           (a1.locked == a2.locked);
}

bool operator!=(const Admin &a1, const Admin &a2) {
    return !(a1 == a2);
}

std::istream& operator>>(std::istream& is, Admin& a) {
    std::string username, password;
    bool locked;
    is >> username >> password >> locked;
    a.username = QString::fromStdString(username);
    a.password = QString::fromStdString(password);
    a.locked = locked;
    return is;
}

std::ostream& operator<<(std::ostream& os, const Admin& a) {
    os << a.username.toStdString() << " " << a.password.toStdString() << " " << a.locked;
    return os;
}
