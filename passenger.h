#ifndef PASSENGER_H
#define PASSENGER_H
#include <QString>
#include <iostream>

class Passenger
{
private:
    QString passenger_name = "";
    QString phone_number = "";
    QString id = "";
    QString type = "";
    QString username = "";

public:
    Passenger();
    Passenger(const QString &passengerName, const QString &phoneNumber,
              const QString &id, const QString &type, const QString &username);

    QString getPassengerName();
    bool setPassengerName(const QString &name);
    QString getPhoneNumber();
    bool setPhoneNumber(const QString &phone);
    QString getId();
    bool setId(const QString &id);
    QString getType();
    bool setType(const QString &type);
    QString getUsername();
    bool setUsername(const QString &username);

    friend bool operator==(const Passenger &p1, const Passenger &p2);
    friend bool operator!=(const Passenger &p1, const Passenger &p2);
    friend std::ostream &operator<<(std::ostream &os, const Passenger &p);
    friend std::istream &operator>>(std::istream &is, Passenger &p);
};

#endif // PASSENGER_H
