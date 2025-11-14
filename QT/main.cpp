// qt/main.cpp (modified)
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Add bridge include
#include "bridge/bridge.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Register the C++ bridge with QML
    qmlRegisterType<NoteQuarryBridge>("NoteQuarry", 1, 0, "NoteQuarryBridge");

    // Your existing QML loading code (keep this)
    const QUrl url(u"qrc:/NoteQuarry/App.qml"_qs);
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl)
        {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}