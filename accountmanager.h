#ifndef ACCOUNTMANAGER_H
#define ACCOUNTMANAGER_H

#include <QObject>
#include <QVariantList>
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
    Q_INVOKABLE QVariantMap getUserProfile_api(const QString &username);
    Q_INVOKABLE QVariantList getAccounts_api();
    // 对某个用户加锁，传入用户名
    Q_INVOKABLE QVariantMap lockUser_api(const QString &username);
    // 对某个管理员加锁，传入用户名
    Q_INVOKABLE QVariantMap lockAdmin_api(const QString &username);
    // 对某个用户解锁，传入用户名
    Q_INVOKABLE QVariantMap unlockUser_api(const QString &username);
    // 对某个管理员解锁，传入用户名
    Q_INVOKABLE QVariantMap unlockAdmin_api(const QString &username);
    // 注销账户，传入用户名

private:
    std::optional<User> findUserByUsername(const QString &username);
    std::optional<Admin> findAdminByUsername(const QString &username);
    bool lockUser(const QString &username);
    bool lockAdmin(const QString &username);
    bool unlockUser(const QString &username);
    bool unlockAdmin(const QString &username);
    void readFromFileUser(const char filename[]);
    void readFromFileAdmin(const char filename[]);
    void readFromFile(const char filenameUser[], const char filenameAdmin[]);

};

#endif // ACCOUNTMANAGER_H
