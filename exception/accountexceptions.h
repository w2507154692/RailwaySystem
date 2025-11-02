#ifndef ACCOUNTVEXCEPTIONS_H
#define ACCOUNTVEXCEPTIONS_H

#include <exception>
#include <QString>

// 基础账户异常（可用于所有账户相关异常的catch）
class AccountException : public std::exception {
public:
    explicit AccountException(const QString &msg)
        : message(msg) {}
    virtual const char* what() const noexcept override {
        return message.toUtf8().constData();
    }
protected:
    QString message;
};

// 账户不存在
class AccountNotFoundException : public AccountException {
public:
    explicit AccountNotFoundException(const QString &username)
        : AccountException(QStringLiteral("用户 %1 不存在").arg(username)) {}
};

// 账户已锁定
class AccountLockedException : public AccountException {
public:
    explicit AccountLockedException(const QString &username)
        : AccountException(QStringLiteral("账户 %1 已锁定").arg(username)) {}
};

// 密码错误
class PasswordMismatchException : public AccountException {
public:
    explicit PasswordMismatchException(const QString &username)
        : AccountException(QStringLiteral("账户 %1 密码错误").arg(username)) {}
};

#endif // ACCOUNTVEXCEPTIONS_H
