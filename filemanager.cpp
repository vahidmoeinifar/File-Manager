#include <QFile>
#include <QDir>
#include "filemanager.h"
#include <qqml.h>

FileManager::FileManager(QObject *parent) : QObject(parent) {}

bool FileManager::newFolder(const QString &folderPath)
{

    QUrl url(folderPath);
    QString path = url.toLocalFile();

    QDir dir;
    if (dir.mkdir(path)) {
        return true;
    } else {
        return false;
    }
}

void FileManager::copyFile(const QString &source, const QString &destination)
{
    QUrl sourceUrl(source);
    QString sourceFilePath = sourceUrl.toLocalFile();

    // Convert the QML destination URL to a local file path
    QUrl destinationUrl(destination);
    QString destinationFilePath = destinationUrl.toLocalFile();

    // Check if both local file paths are valid
    if (!sourceFilePath.isEmpty() && !destinationFilePath.isEmpty()) {
        // Create a QFile object for the source file
        QFile sourceFile(sourceFilePath);

        // Check if the source file exists
        if (sourceFile.exists()) {
            // Attempt to copy the file to the destination
            if (QFile::copy(sourceFilePath, destinationFilePath)) {
                qDebug() << "File copied successfully!";
            } else {
                qDebug() << "Failed to copy the file.";
            }
        } else {
            qDebug() << "Source file does not exist.";
        }
    } else {
        qDebug() << "Invalid file paths.";
    }

}
void FileManager::cutFile(const QString &source, const QString &destination, QString action)
{
    QUrl sourceUrl(source);
    QString sourceFilePath = sourceUrl.toLocalFile();

    // Convert the QML destination URL to a local file path
    QUrl destinationUrl(destination);
    QString destinationFilePath = destinationUrl.toLocalFile();

    // Check if both local file paths are valid
    if (!sourceFilePath.isEmpty() && !destinationFilePath.isEmpty()) {
        // Attempt to move the file to the destination
        if (action == "cut"){
            if (QFile::rename(sourceFilePath, destinationFilePath)) {
                qDebug() << "File(s) moved successfully!";
            } else {
                qDebug() << "Failed to move the file(s).";
            }
        }
        else if (action == "rename"){

            //QUrl sourceUrlWithoutFileName = sourceUrl.adjusted(QUrl::RemoveFilename);

            QFileInfo fileFormat(sourceFilePath);
            QString fileExtension = fileFormat.suffix();


            qDebug() << sourceFilePath;
            qDebug() << destinationFilePath;
            destinationFilePath += "." + fileExtension;


            if (QFile::rename(sourceFilePath, destinationFilePath)) {
                qDebug() << "File(s) renamed successfully!";
            } else {
                qDebug() << "Failed to rename the file(s).";
            }
        }

    } else {
        qDebug() << "Invalid file(s) paths.";
    }


}

void FileManager::removeFile(const QString &filePath)
{

    QUrl url(filePath);
    QString localFilePath = url.toLocalFile();
    QFile file(localFilePath);

    if (file.remove())
      qDebug() << "File removed successfully!";

  }

bool FileManager::removeFolder(const QString &folderPath)
{
    QDir dir(folderPath);
    return dir.removeRecursively();
}
