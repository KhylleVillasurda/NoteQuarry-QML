// qt/bridge/bridge.cpp
#include "bridge.h"

extern "C"
{
    char *process_note_data(const char *input);
    void free_string(char *ptr);
}

NoteQuarryBridge::NoteQuarryBridge(QObject *parent) : QObject(parent)
{
    // Initialize if needed
}

QString NoteQuarryBridge::processNote(const QString &input)
{
    char *result = process_note_data(input.toUtf8().constData());
    QString qResult = QString::fromUtf8(result);
    free_string(result);
    return qResult;
}