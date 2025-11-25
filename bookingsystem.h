#ifndef BOOKINGSYSTEM_H
#define BOOKINGSYSTEM_H

#include <QObject>
#include <queue>
#include <tuple>
#include "stationmanager.h"
#include "ordermanager.h"
#include "trainmanager.h"
#include "accountmanager.h"
#include "passengermanager.h"

class BookingSystem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList queryHistory READ getQueryHistory_api NOTIFY queryHistoryChanged)

private:
    StationManager *station_manager = nullptr;
    OrderManager *order_manager = nullptr;
    TrainManager *train_manager = nullptr;
    AccountManager *account_manager = nullptr;
    PassengerManager *passenger_manager = nullptr;
    Date today;
    std::queue<std::tuple<City, City>> query_history;
public:
    explicit BookingSystem(StationManager* stationManager, 
                            OrderManager* orderManager,
                            TrainManager* trainManager,
                            AccountManager* accountManager,
                            PassengerManager* passengerManager,
                            QObject *parent = nullptr);
    Q_INVOKABLE QVariantList getQueryHistory_api();
    Q_INVOKABLE bool addQueryHistory_api(const QString &startCityName, const QString &endCityName);
    Q_INVOKABLE bool clearQueryHistory_api();
    Q_INVOKABLE QVariantList queryTickets_api(const QString &startCityName,
                                              const QString &endCityName,
                                              int year, int month, int day);
    // 根据时间区间，查找该用户所有乘车人并标记是否空闲
    Q_INVOKABLE QVariantList getPassengers_api(const QVariantMap &info);

private:
    std::tuple<double, double, double> computePrice(const QString &trainNumber, std::vector<Station> &stations);

signals:
    void queryHistoryChanged();
};

#endif // BOOKINGSYSTEM_H
