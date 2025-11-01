#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickWindow>
#include <QQmlContext>
#include <QDebug>

class PageLoader : public QObject {             //在登录成功后，关闭登录窗口并加载主页面（管理员或普通用户）
    Q_OBJECT                    //Qt的宏，让类支持 Qt 信号槽等高级特性
public:
    PageLoader(QQuickWindow *loginWindow,       //登录窗口对象指针
               QObject *loginObj,               //登录页面对象指针
               QQmlApplicationEngine *engine)       //QML引擎对象指针
        : m_loginWindow(loginWindow),
          m_loginObj(loginObj),
          m_engine(engine) {}

public slots:               //表示下面定义的是槽函数
    void handleLogin(const QString &role) {
        if (m_loginWindow) m_loginWindow->close();
        if (m_loginObj) m_loginObj->deleteLater();

        m_engine->rootContext()->setContextProperty("userRole", role);

        QQmlComponent comp(m_engine, QUrl("qrc:/main.qml"));
        if (comp.isError()) {
            for (auto &e : comp.errors()) qWarning() << e.toString();
            return;
        }
        QObject *mainObj = comp.create(m_engine->rootContext());
        if (QQuickWindow *win = qobject_cast<QQuickWindow*>(mainObj))
            win->show();
    }

private:
    QQuickWindow *m_loginWindow;
    QObject *m_loginObj;
    QQmlApplicationEngine *m_engine;
};

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);            // 创建 GUI 应用程序对象
    QQmlApplicationEngine engine;               // 创建 QML 应用程序引擎对象

    // 加载登录页
    const QUrl loginUrl("qrc:/qml/pages/Login.qml");
    engine.load(loginUrl);
    if (engine.rootObjects().isEmpty()) {
        qWarning() << "Login.qml 加载失败";
        return -1;
    }

    QObject *loginObj = engine.rootObjects().first();
    QQuickWindow *loginWindow = qobject_cast<QQuickWindow*>(loginObj);
    if (!loginWindow) {
        qWarning() << "Login.qml 根对象不是 Window，请把根改为 ApplicationWindow 或 Window。";
        return -2;
    }

    auto *loader = new PageLoader(loginWindow, loginObj, &engine);

    QObject::connect(loginObj, SIGNAL(loginSuccess(QString)),
                     loader, SLOT(handleLogin(QString)));

    return app.exec();
}

#include "main.moc"

