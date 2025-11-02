#ifndef ACCOUNTMANAGER_H
#define ACCOUNTMANAGER_H

#include <QObject>

class AccountManager : public QObject
{
    Q_OBJECT
public:
    explicit AccountManager(QObject *parent = nullptr);

    Q_INVOKABLE bool login(const QString &username, const QString &password);

signals:
    void loginResult(bool success);
};

#endif // ACCOUNTMANAGER_H
