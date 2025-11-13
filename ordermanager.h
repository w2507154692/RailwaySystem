#ifndef ORDERMANAGER_H
#define ORDERMANAGER_H

#include <QObject>
#include <vector>
#include "order.h"
#include <QVariantMap>
#include <optional>

class OrderManager : public QObject
{
    Q_OBJECT

private:
    std::vector<Order> orders;

public:
    explicit OrderManager(QObject *parent = nullptr);
    Q_INVOKABLE QVariantList getOrdersByUsername_api(const QString &username);
    Q_INVOKABLE QVariantMap cancelOrder_api(const QString &orderNumber);
    Q_INVOKABLE QVariantList getTimetableInfo_api(const QString &orderNumber);
    Q_INVOKABLE QVariantList getOrders_api();
    std::vector<Order> getOrdersByTrainNumberAndDate(const QString &trainNumber, const Date &date);

private:
    std::vector<Order> getOrdersByUsername(const QString &username);
    std::optional<Order> getOrderByOrderNumber(const QString &orderNumber);
    bool cancelOrder(const QString &orderNumber);
    bool readFromFile(const char filename[]);
    bool writeToFile(const char filename[]);

signals:
};

#endif // ORDERMANAGER_H
