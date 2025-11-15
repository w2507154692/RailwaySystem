#ifndef PASSENGERMANAGER_H
#define PASSENGERMANAGER_H

#include <QObject>
#include <vector>
#include <optional>
#include "passenger.h"
#include <QVariantList>
#include <QVariantMap>

class PassengerManager : public QObject
{
    Q_OBJECT
private:
    std::vector<Passenger> passengers;

public:
    explicit PassengerManager(QObject *parent = nullptr);
    Q_INVOKABLE QVariantList getPassengersByUsername_api(const QString &username);
    Q_INVOKABLE QVariantMap deletePassengerByUsernameAndId_api(const QString &username, const QString &id);
    Q_INVOKABLE QVariantMap deletePassengersByUsername_api(const QString &username);

private:
    std::optional<Passenger> getPassengerById(const QString &id);
    std::vector<Passenger> getPassengersByUsername(const QString &username);
    bool readFromFile(const char filename[]);
    bool writeToFile(const char filename[]);

signals:
};

#endif // PASSENGERMANAGER_H
