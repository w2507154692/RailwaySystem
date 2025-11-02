#include "accountmanager.h"
#include "exception/accountexceptions.h"
#include <fstream>
#include <QDebug>
#include <QDir>
#include <QFileInfo>

AccountManager::AccountManager(QObject *parent)
    : QObject{parent}
{
    qDebug() << "当前工作目录:" << QDir::currentPath();
    
    // 使用相对于可执行文件的路径，向上两级回到源码根目录
    QString dataPath = QDir::currentPath() + "/../../data/user.txt";
    QFileInfo dataFile(dataPath);
    QString normalizedPath = dataFile.absoluteFilePath();
    
    qDebug() << "尝试从以下路径加载用户数据:" << normalizedPath;
    readFromFile(normalizedPath.toStdString().c_str());
    qDebug() << "加载用户数量:" << users.size();
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
        result["message"] = QString("%1账户不存在！").arg(QString::fromUtf8(e.what()));
        return result;
    } catch (const AccountLockedException &e) {
        result["success"] = false;
        result["message"] = QString("%1账户已锁定，请联系管理员解锁。").arg(QString::fromUtf8(e.what()));
        return result;
    } catch (const PasswordMismatchException &e) {
        result["success"] = false;
        result["message"] = QString("密码错误！请重新输入！");
        return result;
    }
}

// QVariantMap AccountManager::loginAdmin(const QString &username, const QString &password) {
//     QVariantMap result;
//     try {
//         Admin &user = findAdminByUsername(username);
//         if (user.isLocked()) {
//             throw AccountLockedException(username);
//         }
//         if (user.getPassword() != password) {
//             throw AccountNotFoundException(username);
//         }
//         result["username"] = user.getUsername();
//         result["success"] = true;
//         result["message"] = "Admin login successful";
//         return result;
//     } catch (const AccountNotFoundException &e) {
//         result["success"] = false;
//         result["message"] = QString("%1账户不存在！").arg(QString::fromUtf8(e.what()));
//         return result;
//     } catch (const AccountLockedException &e) {
//         result["success"] = false;
//         result["message"] = QString("%1账户已锁定，请联系管理员解锁。").arg(QString::fromUtf8(e.what()));
//         return result;
//     } catch (const PasswordMismatchException &e) {
//         result["success"] = false;
//         result["message"] = QString("密码不存在！");
//         return result;
//     }
// }

User& AccountManager::findUserByUsername(const QString &username) {
    for (auto &user : users) {
        if (user.getUsername() == username) {
            return user;
        }
    }
    throw AccountNotFoundException(username);
}

void AccountManager::readFromFile(const char filename[]) {
    std::fstream fis(filename, std::ios::in);
    if (!fis) qWarning() << "文件不存在！";

    User user;
    while (fis >> user) {
        users.push_back(user);
    }

    return;
}
