#ifndef BOOKINGSYSTEM_H
#define BOOKINGSYSTEM_H

#include <QObject>
#include <queue>
#include <tuple>
#include "station.h"
#include "stationmanager.h"

class BookingSystem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList queryHistory READ getQueryHistory NOTIFY queryHistoryChanged)

private:
    StationManager *station_manager = nullptr;
    std::queue<std::tuple<City, City>> query_history;
public:
    explicit BookingSystem(StationManager* stationManager, QObject *parent = nullptr);
    Q_INVOKABLE QVariantList getQueryHistory();
    Q_INVOKABLE bool addQueryHistory(const QString &startCityName, const QString &endCityName);
    Q_INVOKABLE bool clearQueryHistory();

signals:
    void queryHistoryChanged();
};

#endif // BOOKINGSYSTEM_H
