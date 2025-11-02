#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
// 仅注册需要的类型
#include "accountmanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);            // 创建 GUI 应用程序对象
    QQmlApplicationEngine engine;    // 创建 QML 应用程序引擎对象

    qmlRegisterType<AccountManager>("MyApp", 1, 0, "AccountManager");

    // 直接加载主窗口（包含嵌入式登录页面）
    const QUrl mainUrl("qrc:/qml/main.qml");
    engine.load(mainUrl);
    if (engine.rootObjects().isEmpty()) {
        qWarning() << "main.qml 加载失败";
        return -1;
    }

    return app.exec();
}

