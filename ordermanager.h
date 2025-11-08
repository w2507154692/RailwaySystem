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
    Q_INVOKABLE QVariantList getOrders_api(const QString &username);
    Q_INVOKABLE QVariantMap cancelOrder_api(const QString &orderNumber);

private:
    std::vector<Order> findOrdersByUsername(const QString &username);
    std::optional<Order> findOrdersByOrderNumber(const QString &orderNumber);
    bool cancelOrder(const QString &orderNumber);
    bool readFromFile(const char filename[]);
    bool writeToFile(const char filename[]);

signals:
};

#endif // ORDERMANAGER_H
