#ifndef ORDERMANAGER_H
#define ORDERMANAGER_H

#include <QObject>
#include <vector>
#include "order.h"

class OrderManager : public QObject
{
    Q_OBJECT

private:
    std::vector<Order> orders;

public:
    explicit OrderManager(QObject *parent = nullptr);
    Q_INVOKABLE QVariantList getOrders_api(const QString &username);

private:
    std::vector<Order> findOrdersByUsername(const QString &username);
    bool readFromFile(const char filename[]);
    bool writeToFile(const char filename[]);

signals:
};

#endif // ORDERMANAGER_H
