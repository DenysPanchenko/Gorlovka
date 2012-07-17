#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtDebug>
#include <QDir>
#include <QFile>
#include <QMenu>
#include <QMenuBar>
#include <QStatusBar>
#include <QMainWindow>
#include <QTextStream>
#include <QPluginLoader>
#include <QDeclarativeView>

#include "plugininterface.h"
#include "configparser.h"

class MainWindow : public QMainWindow
{
    Q_OBJECT
private:
    QMenuBar* mainMenu;
    QMenu* fileMenu;
    QMenu* editMenu;
    QMenu* helpMenu;
    QDeclarativeView* centralWidget;

    void setTitles();
    void loadPlugins();
    void initializePlugin(QObject* p);

public:
    explicit MainWindow(QWidget *parent = 0);

signals:

public slots:

};

#endif // MAINWINDOW_H
