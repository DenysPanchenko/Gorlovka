#include "configparser.h"

ConfigParser::ConfigParser(const QString& filePath)
{
    QFile check;
    QFile f(filePath);
    QString t; //temporary line
    if(f.open(QFile::ReadOnly)){
        QTextStream in(&f);
        do{
            t = in.readLine();
            QStringList stl = clearString(t).split(":");
            if(clearString(stl.first()) != "module"){
                //throw exception - unexpected token in config file
            }
            check.setFileName(clearString(stl.last()));
            if(!check.exists()){
                //throw exception - module doesn't exist
            }
            QString t_s = clearString(stl.last());
            if(!t_s.isEmpty())
                pluginPath << t_s;
        }
        while(!t.isEmpty());
    }
}

const QString ConfigParser::clearString(QString s){
    s.remove("\s");
    s.remove(" \t\n");
    s.toLower();
    return s;
}

QStringList ConfigParser::getModulePath() const{
    return pluginPath;
}
