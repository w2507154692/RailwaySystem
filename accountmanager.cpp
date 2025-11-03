#include "accountmanager.h"
#include "exception/accountexceptions.h"
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

QVariantMap AccountManager::loginUser(const QString &username, const QString &password) {
    QVariantMap result;
    try {
        User &user = findUserByUsername(username);
        if (user.isLocked()) {
            throw AccountLockedException(username);
        }
        if (user.getPassword() != password) {
            throw PasswordMismatchException(username);
        }
        result["username"] = user.getUsername();
        result["success"] = true;
        result["message"] = "User login successful";
        return result;
    } catch (const AccountNotFoundException &e) {
        result["success"] = false;
        result["message"] = e.what();
        return result;
    } catch (const AccountLockedException &e) {
        result["success"] = false;
        result["message"] = e.what();
        return result;
    } catch (const PasswordMismatchException &e) {
        result["success"] = false;
        result["message"] = e.what();
        return result;
    }
}

QVariantMap AccountManager::loginAdmin(const QString &username, const QString &password) {
    QVariantMap result;
    try {
        Admin &admin = findAdminByUsername(username);
        if (admin.isLocked()) {
            throw AccountLockedException(username);
        }
        if (admin.getPassword() != password) {
            throw PasswordMismatchException(username);
        }
        result["username"] = admin.getUsername();
        result["success"] = true;
        result["message"] = "Admin login successful";
        return result;
    } catch (const AccountNotFoundException &e) {
        result["success"] = false;
        result["message"] = e.what();
        return result;
    } catch (const AccountLockedException &e) {
        result["success"] = false;
        result["message"] = e.what();
        return result;
    } catch (const PasswordMismatchException &e) {
        result["success"] = false;
        result["message"] = e.what();
        return result;
    }
}



User& AccountManager::findUserByUsername(const QString &username) {
    for (auto &user : users) {
        if (user.getUsername() == username) {
            return user;
        }
    }
    throw AccountNotFoundException(username);
}

Admin& AccountManager::findAdminByUsername(const QString &username) {
    for (auto &admin : admins) {
        if (admin.getUsername() == username) {
            return admin;
        }
    }
    throw AccountNotFoundException(username);
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
