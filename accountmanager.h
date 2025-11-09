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

    Q_INVOKABLE QVariantMap loginUser_api(const QString &username, const QString &password);
    Q_INVOKABLE QVariantMap loginAdmin_api(const QString &username, const QString &password);
    // Q_INVOKABLE bool lockUser(const QString &username);
    // Q_INVOKABLE bool unlockUser(const QString &username);
    // Q_INVOKABLE bool lockAdmin(const QString &username);
    // Q_INVOKABLE bool unlockAdmin(const QString &username);
    // Q_INVOKABLE bool unregisterUser(const QString &username);
    // Q_INVOKABLE bool unregisterAdmin(const QString &username);
    // Q_INVOKABLE bool changePasswordUser(const QString &username, const QString &newPassword);
    // Q_INVOKABLE bool changePasswordAdmin(const QString &username, const QString &newPassword);

private:
    std::optional<User> findUserByUsername(const QString &username);
    std::optional<Admin> findAdminByUsername(const QString &username);
    void readFromFileUser(const char filename[]);
    void readFromFileAdmin(const char filename[]);
    void readFromFile(const char filenameUser[], const char filenameAdmin[]);

};

#endif // ACCOUNTMANAGER_H
