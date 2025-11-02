#ifndef PAGELOADER_H
#define PAGELOADER_H

#include <QObject>
#include <QQuickWindow>
#include <QQmlApplicationEngine>

class PageLoader : public QObject {
    Q_OBJECT

private:
    QQuickWindow *m_loginWindow;
    QObject *m_loginObj;
    QQmlApplicationEngine *m_engine;

public:
    PageLoader(QQuickWindow *loginWindow,
               QObject *loginObj,
               QQmlApplicationEngine *engine);

public slots:
    void handleLogin(const QString &role);
};

#endif // PAGELOADER_H
