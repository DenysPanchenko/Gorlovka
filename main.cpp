#include <QApplication>
#include "mainwindow.h"

int main(int argc, char** argv){
    QApplication::setGraphicsSystem("raster");
    QApplication app(argc,argv);
    /*
    QDeclarativeView* view = new QDeclarativeView();
    view->setSource(QUrl::fromLocalFile("./gui/gui.qml"));
    view->show();
    */
    MainWindow m;
    m.show();
    return app.exec();
}
