#ifndef ACCOUNTMANAGER_H
#define ACCOUNTMANAGER_H

#include <QObject>
#include <QVariantMap>
#include <vector>
#include "user.h"
#include "admin.h"

class AccountManager : public QObject
{
    Q_OBJECT

public:
    std::vector<User> users;
    std::vector<Admin> admins;

public:
    explicit AccountManager(QObject *parent = nullptr);

    Q_INVOKABLE QVariantMap loginUser(const QString &username, const QString &password);
    // Q_INVOKABLE QVariantMap loginAdmin(const QString &username, const QString &password);
    // Q_INVOKABLE bool lockUser(const QString &username);
    // Q_INVOKABLE bool unlockUser(const QString &username);
    // Q_INVOKABLE bool lockAdmin(const QString &username);
    // Q_INVOKABLE bool unlockAdmin(const QString &username);
    // Q_INVOKABLE bool unregisterUser(const QString &username);
    // Q_INVOKABLE bool unregisterAdmin(const QString &username);
    // Q_INVOKABLE bool changePasswordUser(const QString &username, const QString &newPassword);
    // Q_INVOKABLE bool changePasswordAdmin(const QString &username, const QString &newPassword);

private:
    User& findUserByUsername(const QString &username);
    // Admin& findAdminByUsername(const QString &username);
    void readFromFile(const char filenamep[]);


};

#endif // ACCOUNTMANAGER_H
