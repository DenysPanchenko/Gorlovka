#include "mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent)
{
    mainMenu = new QMenuBar(this);
    setMenuBar(mainMenu);

    centralWidget = new QDeclarativeView();
    centralWidget->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    centralWidget->setSource(QUrl::fromLocalFile("./gui/gui.qml"));
    centralWidget->setSizePolicy(QSizePolicy::Preferred,QSizePolicy::Preferred);

    setCentralWidget(centralWidget);

    loadPlugins();
}

void MainWindow::loadPlugins(){
    ConfigParser parser(QDir::currentPath() + QDir::separator() + "config");
    QStringList moduleList = parser.getModulePath();
    foreach(QString s, moduleList){
        QPluginLoader loader(s);
        QObject* plugin = loader.instance();
        if(plugin)
            initializePlugin(plugin);
        else{
            //throw exception - can't load plugin
        }
    }
}

void MainWindow::initializePlugin(QObject *pntr){
    ModuleInterface* module = qobject_cast(pntr);
}
