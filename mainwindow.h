#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtDebug>
#include <QDir>
#include <QFile>
#include <QMenu>
#include <QMenuBar>
#include <QTreeView>
#include <QStatusBar>
#include <QMainWindow>
#include <QTextStream>
#include <QPluginLoader>
#include <QGraphicsObject>
#include <QDeclarativeItem>
#include <QDeclarativeView>

#include "sort/treemodel.h"
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
    QTreeView* treeView;
    TreeModel* treeModel;
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
