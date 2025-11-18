#ifndef TRAINMANAGER_H
#define TRAINMANAGER_H

#include <QObject>
#include <vector>
#include <QVariantList>
#include <QVariantMap>
#include <optional>
#include "train.h"

class TrainManager : public QObject
{
    Q_OBJECT

private:
    std::vector<Train> trains;

public:
    explicit TrainManager(QObject *parent = nullptr);
    Q_INVOKABLE QVariantList getTrains_api();
    Q_INVOKABLE QVariantMap deleteTrain_api(const QString &trainNumber);
    Q_INVOKABLE QVariantList getTimetableInfo_api(const QString &trainNumber);
    std::vector<std::tuple<Train, Station, Station>> getRoutesByCities(const QString &startCityName, const QString &endCityName);

private:
    std::optional<Train> getTrainByTrainNumber(const QString &trainNumber);
    bool readFromFile(const char filename[]);
    bool writeToFile(const char filename[]);

signals:
};

#endif // TRAINMANAGER_H
