// qt/bridge/bridge.h
#ifndef BRIDGE_H
#define BRIDGE_H

#include <QObject>
#include <QString>

class NoteQuarryBridge : public QObject
{
    Q_OBJECT

public:
    explicit NoteQuarryBridge(QObject *parent = nullptr);

    Q_INVOKABLE QString processNote(const QString &input);

private:
    // You can add Rust context here if needed
};

#endif // BRIDGE_H