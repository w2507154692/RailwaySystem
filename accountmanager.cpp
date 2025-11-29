#include "accountmanager.h"
#include <fstream>
#include <QDebug>
#include <QDir>
#include <QFileInfo>
#include <iostream>

AccountManager::AccountManager(QObject *parent)
    : QObject{parent}
{
    readFromFile("../../data/user.txt", "../../data/admin.txt");
    qDebug() << "加载用户数量:" << users.size();
    qDebug() << "加载管理员数量:" << admins.size();
    std::cout << admins[0];
}

QVariantMap AccountManager::loginUser_api(const QString &username, const QString &password) {
    QVariantMap result;
    auto findResult = getUserByUsername(username);
    if (findResult) {
        User user = findResult.value();
        if (user.isLocked()) {
            result["success"] = false;
            result["message"] = QString("账户 %1 已被锁定！请联系管理员解锁。").arg(username);
            return result;
        }
        if (user.getPassword() != password) {
            result["success"] = false;
            result["message"] = QString("账户 %1 密码错误！请重新输入。").arg(username);
            return result;
        }
        result["success"] = true;
        return result;
    }
    else {
        result["success"] = false;
        result["message"] = QString("账户 %1 不存在！").arg(username);
        return result;
    }
}

QVariantMap AccountManager::loginAdmin_api(const QString &username, const QString &password) {
    QVariantMap result;
    auto findResult = findAdminByUsername(username);
    if (findResult) {
        Admin admin = findResult.value();
        if (admin.isLocked()) {
            result["success"] = false;
            result["message"] = QString("账户 %1 已被锁定！请联系管理员解锁。").arg(username);
            return result;
        }
        if (admin.getPassword() != password) {
            result["success"] = false;
            result["message"] = QString("账户 %1 密码错误！请重新输入。").arg(username);
            return result;
        }
        result["success"] = true;
        return result;
    }
    else {
        result["success"] = false;
        result["message"] = QString("账户 %1 不存在！").arg(username);
        return result;
    }
}

QVariantMap AccountManager::getUserProfile_api(const QString &username) {
    QVariantMap result;
    auto findResult = getUserByUsername(username);
    if (findResult) {
        User user = findResult.value();
        result["name"] = user.getProfile().getName();
        result["phoneNumber"] = user.getProfile().getPhoneNumber();
        result["id"] = user.getProfile().getId();
        return result;
    }
    return result;
}

QVariantList AccountManager::getAccounts_api() {
    QVariantList list;
    for (auto &user : users) {
        QVariantMap map;
        map["type"] = "user";
        map["username"] = user.getUsername();
        map["password"] = user.getPassword();
        map["isLocked"] = user.isLocked();
        list << map;
    }
    for (auto &admin : admins) {
        QVariantMap map;
        map["type"] = "admin";
        map["username"] = admin.getUsername();
        map["password"] = admin.getPassword();
        map["isLocked"] = admin.isLocked();
        list << map;
    }
    return list;
}

QVariantMap AccountManager::lockUser_api(const QString &username) {
    QVariantMap result;
    for (auto it = users.begin(); it != users.end(); it++) {
        if (it->getUsername() == username) {
            if (it->isLocked()) {
                result["success"] = false;
                result["message"] = QString("用户 %1 已被锁定！").arg(username);
                return result;
            }
            it->lock();
            result["success"] = true;
            result["message"] = QString("用户 %1 成功锁定！").arg(username);
            return result;
        }
    }
    result["success"] = false;
    result["message"] = QString("用户 %1 不存在！").arg(username);
    return result;
}

QVariantMap AccountManager::lockAdmin_api(const QString &username) {
    QVariantMap result;
    for (auto it = admins.begin(); it != admins.end(); it++) {
        if (it->getUsername() == username) {
            if (it->isLocked()) {
                result["success"] = false;
                result["message"] = QString("管理员 %1 已被锁定！").arg(username);
                return result;
            }
            it->lock();
            result["success"] = true;
            result["message"] = QString("管理员 %1 成功锁定！").arg(username);
            return result;
        }
    }
    result["success"] = false;
    result["message"] = QString("管理员 %1 不存在！").arg(username);
    return result;
}


QVariantMap AccountManager::unlockUser_api(const QString &username) {
    QVariantMap result;
    for (auto it = users.begin(); it != users.end(); it++) {
        if (it->getUsername() == username) {
            if (!it->isLocked()) {
                result["success"] = false;
                result["message"] = QString("用户 %1 已被解锁！").arg(username);
                return result;
            }
            it->unlock();
            result["success"] = true;
            result["message"] = QString("用户 %1 成功解锁！").arg(username);
            return result;
        }
    }
    result["success"] = false;
    result["message"] = QString("用户 %1 不存在！").arg(username);
    return result;
}

QVariantMap AccountManager::unlockAdmin_api(const QString &username) {
    QVariantMap result;
    for (auto it = admins.begin(); it != admins.end(); it++) {
        if (it->getUsername() == username) {
            if (!it->isLocked()) {
                result["success"] = false;
                result["message"] = QString("管理员 %1 已被解锁！").arg(username);
                return result;
            }
            it->unlock();
            result["success"] = true;
            result["message"] = QString("管理员 %1 成功解锁！").arg(username);
            return result;
        }
    }
    result["success"] = false;
    result["message"] = QString("管理员 %1 不存在！").arg(username);
    return result;
}

bool AccountManager::deleteUser(const QString &username) {
    for (auto it = users.begin(); it != users.end(); it++) {
        if (it->getUsername() == username) {
            users.erase(it);
            return true;
        }
    }
    return false;
}

QVariantMap AccountManager::editUserProfile_api(const QString &username, const QString &name, const QString &phoneNumber, const QString &id) {
    QVariantMap result;

    // 判断身份证号是否重复
    auto findResult = findUserById(id);
    if (findResult && findResult.value().getUsername() != username) {
        result["success"] = false;
        result["message"] = QString("该身份证号已注册其他账号！");
        return result;
    }

    for (auto it = users.begin(); it != users.end(); it++) {
        if (it->getUsername() == username) {
            UserProfile userProfile(name, phoneNumber, id);
            it->setProfile(userProfile);
            result["success"] = true;
            result["message"] = QString("用户 %1 个人信息成功修改！").arg(username);
            return result;
        }
    }
    result["success"] = false;
    result["message"] = QString("用户 %1 不存在！").arg(username);
    return result;
}

std::optional<User> AccountManager::getUserByUsername(const QString &username) {
    for (auto &user : users) {
        if (user.getUsername() == username) {
            return user;
        }
    }
    return std::nullopt;
}

std::optional<Admin> AccountManager::findAdminByUsername(const QString &username) {
    for (auto &admin : admins) {
        if (admin.getUsername() == username) {
            return admin;
        }
    }
    return std::nullopt;
}

std::optional<User> AccountManager::findUserById(const QString &id) {
    for (auto &user : users) {
        if (user.getProfile().getId() == id) {
            return user;
        }
    }
    return std::nullopt;
}

void AccountManager::readFromFileUser(const char filename[]) {
    std::fstream fis(filename, std::ios::in);
    if (!fis) qWarning() << "用户文件不存在！";
    User user;
    while (fis >> user) {
        users.push_back(user);
    }
}

void AccountManager::readFromFileAdmin(const char filename[]) {
    std::fstream fis(filename, std::ios::in);
    if (!fis) qWarning() << "用户文件不存在！";
    Admin admin;
    while (fis >> admin) {
        admins.push_back(admin);
    }
}


void AccountManager::readFromFile(const char filenameUser[], const char filenameAdmin[]) {
    readFromFileUser(filenameUser);
    readFromFileAdmin(filenameAdmin);

    return;
}
