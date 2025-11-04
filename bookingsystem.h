#ifndef BOOKINGSYSTEM_H
#define BOOKINGSYSTEM_H

#include <QObject>
#include <queue>
#include <tuple>
#include "station.h"

class BookingSystem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList queryHistory READ getQueryHistory NOTIFY queryHistoryChanged)

private:
    std::queue<std::tuple<Station, Station>> query_history;
public:
    explicit BookingSystem(QObject *parent = nullptr);
    Q_INVOKABLE QVariantList getQueryHistory();
    // Q_INVOKABLE QVariantList addQueryHistory();

signals:
    void queryHistoryChanged();
};

#endif // BOOKINGSYSTEM_H
