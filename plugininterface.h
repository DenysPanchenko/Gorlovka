#ifndef PLUGININTERFACE_H
#define PLUGININTERFACE_H

#include <QtPlugin>

QT_BEGIN_NAMESPACE
class QString;
class QPixmap;
QT_END_NAMESPACE

class ModuleInterface{
    virtual ~ModuleInterface(){}
    virtual QString getDescription() = 0;
    virtual QPixmap getIcon() = 0;
    virtual QString getTitle() = 0;
};

QT_BEGIN_NAMESPACE
Q_DECLARE_INTERFACE(ModuleInterface,"1.0")
QT_END_NAMESPACE

#endif // PLUGININTERFACE_H
