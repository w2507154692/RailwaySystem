#include "accountmanager.h"

AccountManager::AccountManager(QObject *parent)
    : QObject{parent}
{}

bool AccountManager::login(const QString &username, const QString &password) {
    if(username == "123" && password == "123") {
        emit loginResult(true);
        return true;
    }
    emit loginResult(false);
    return false;
}
