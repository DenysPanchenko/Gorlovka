#ifndef CONFIGPARSER_H
#define CONFIGPARSER_H

#include <QFile>
#include <QTextStream>
#include <QStringList>

class ConfigParser
{
private:
    QStringList pluginPath;
    const QString clearString(QString s);

public:
    ConfigParser(const QString& filePath);
    QStringList getModulePath() const;
};

#endif // CONFIGPARSER_H
