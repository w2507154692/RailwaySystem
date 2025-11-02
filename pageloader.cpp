#include "PageLoader.h"
#include <QQmlComponent>
#include <QQmlContext>
#include <QDebug>

PageLoader::PageLoader(QQuickWindow *loginWindow,
                       QObject *loginObj,
                       QQmlApplicationEngine *engine)
    : m_loginWindow(loginWindow),
    m_loginObj(loginObj),
    m_engine(engine) {}

void PageLoader::handleLogin(const QString &role) {
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
