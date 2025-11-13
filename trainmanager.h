#ifndef TRAINMANAGER_H
#define TRAINMANAGER_H

#include <QObject>
#include <vector>
#include <QVariantList>
#include <QVariantMap>
#include "train.h"

class TrainManager : public QObject
{
    Q_OBJECT

private:
    std::vector<Train> trains;

public:
    explicit TrainManager(QObject *parent = nullptr);
    Q_INVOKABLE QVariantList getTrains_api();
    std::vector<std::tuple<Train, Station, Station>> getRoutesByCities(const QString &startCityName, const QString &endCityName);

private:
    bool readFromFile(const char filename[]);
    bool writeToFile(const char filename[]);

signals:
};

#endif // TRAINMANAGER_H
