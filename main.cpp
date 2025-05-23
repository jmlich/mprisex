#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "libwatchfish/musiccontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Register the custom QML type
    qmlRegisterType<watchfish::MusicController>("uk.co.piggz.amazfish", 1, 0, "MusicControler");

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [](QObject *obj, const QUrl &objUrl) {
                         if (!obj) QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));

    return app.exec();
}
