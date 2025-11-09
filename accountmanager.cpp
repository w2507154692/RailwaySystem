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
    auto findResult = findUserByUsername(username);
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


std::optional<User> AccountManager::findUserByUsername(const QString &username) {
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
