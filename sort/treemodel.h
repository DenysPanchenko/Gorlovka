#ifndef TREEMODEL_H
#define TREEMODEL_H

#include <QAbstractItemModel>
#include <QModelIndex>
#include <QVariant>
#include <QMimeData>
#include <QtDebug>
#include "treeitem.h"


 class TreeModel : public QAbstractItemModel
 {
     Q_OBJECT

 public:
     TreeModel(QString &path, QObject *parent = 0);
     ~TreeModel();

     QVariant data(const QModelIndex &index, int role) const;
     QVariant headerData(int section, Qt::Orientation orientation,int role = Qt::DisplayRole) const;
     QModelIndex index(int row, int column,const QModelIndex &parent = QModelIndex()) const;
     QModelIndex parent(const QModelIndex &index) const;
     int rowCount(const QModelIndex &parent = QModelIndex()) const;
     int columnCount(const QModelIndex &parent = QModelIndex()) const;

     bool setData ( const QModelIndex & index, const QVariant & value, int role = Qt::EditRole );
     Qt::ItemFlags flags(const QModelIndex &index) const;
     bool insertRows(int position, int rows,const QModelIndex &parent = QModelIndex());
     bool removeRows(int position, int rows,const QModelIndex &parent = QModelIndex());

     QStringList mimeTypes() const;
     QMimeData* mimeData(const QModelIndexList &indexes) const;
     bool dropMimeData(const QMimeData *data, Qt::DropAction action, int row, int column, const QModelIndex &parent);
     Qt::DropActions supportedDropActions() const;
 private:
     TreeItem *getItem(const QModelIndex &index) const;
     TreeItem* setupModelData(QString& ,TreeItem*);
     TreeItem* copyBranch(TreeItem*,TreeItem*);
     TreeItem *rootItem;
     QString path;
 };

 #endif
