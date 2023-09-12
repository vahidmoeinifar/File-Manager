#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QObject>
#include <qqml.h>

class FileManager: public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit FileManager(QObject *parent = nullptr);

    Q_INVOKABLE void removeFile(const QString &filePath);
    Q_INVOKABLE bool removeFolder(const QString &folderPath);
    Q_INVOKABLE bool newFolder(const QString &folderPath);
    Q_INVOKABLE void copyFile(const QString &source, const QString &destination);
    Q_INVOKABLE void cutFile(const QString &source, const QString &destination, QString action);

};

#endif // FILEMANAGER_H
