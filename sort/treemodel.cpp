#include "treemodel.h"

TreeModel::TreeModel(QString &path, QObject *parent) : QAbstractItemModel(parent)
{
    this->path=path;
    rootItem = setupModelData(path,NULL);
}

TreeModel::~TreeModel()
{
    delete rootItem;
}

int TreeModel::columnCount(const QModelIndex &parent) const
 {
    /*
    if (parent.isValid())
     return static_cast<TreeItem*>(parent.internalPointer())->columnCount();
    else
     return rootItem->columnCount();
     */
    return 1;
}

Qt::DropActions TreeModel::supportedDropActions() const{

    return Qt::MoveAction;
}

Qt::ItemFlags TreeModel::flags(const QModelIndex &index) const
{
    if (!index.isValid()) return 0;

    return Qt::ItemIsDragEnabled | Qt::ItemIsDropEnabled | Qt::ItemIsEnabled | Qt::ItemIsSelectable | Qt::ItemIsEditable;
}

bool TreeModel::setData(const QModelIndex &index, const QVariant &value, int role){
    if(role==Qt::EditRole){
        TreeItem *item = static_cast<TreeItem*>(index.internalPointer());
        QString new_title = value.toString();
        if(!new_title.isEmpty())
            item->setTitle(new_title);
    }
    return true;
}

QVariant TreeModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) return QVariant();
    if (role != Qt::DisplayRole) return QVariant();
    TreeItem *item = static_cast<TreeItem*>(index.internalPointer());

    return item->title();
}

QModelIndex TreeModel::index(int row, int column, const QModelIndex &parent) const {
    if (!hasIndex(row, column, parent)) return QModelIndex();

    TreeItem *parentItem;

    if (!parent.isValid()) parentItem = rootItem;
    else parentItem = static_cast<TreeItem*>(parent.internalPointer());

    TreeItem *childItem = parentItem->child(row);
    if (childItem) return createIndex(row, column, childItem);
    else return QModelIndex();
}

QModelIndex TreeModel::parent(const QModelIndex &index) const {

    if (!index.isValid())
        return QModelIndex();

    TreeItem *childItem = static_cast<TreeItem*>(index.internalPointer());
    TreeItem *parentItem = childItem->parent();

    if (parentItem == rootItem) return QModelIndex();

    return createIndex(parentItem->row(), 0, parentItem);
}

int TreeModel::rowCount(const QModelIndex &parent) const {
    TreeItem *parentItem;
    if (parent.column() > 0) return 0; //???

    if (!parent.isValid())
        parentItem = rootItem;
    else
        parentItem = static_cast<TreeItem*>(parent.internalPointer());

    return parentItem->childCount();
}

QVariant TreeModel::headerData(int section, Qt::Orientation orientation, int role) const{
    if(role==Qt::DisplayRole){
        if(orientation==Qt::Horizontal)
            if(section==0)
                return QString(path);
    }
    return QVariant();
}

TreeItem* TreeModel::setupModelData(QString& cur_path, TreeItem *parent){

    QDir dir(cur_path);
    if(!dir.exists()) return NULL;

    QString dirName = dir.dirName();
    TreeItem* node = new TreeItem(cur_path,parent);

    if(dir.count()<=2){
        TreeItem* emp = TreeItem::emptyItem();
        emp->setParent(node);
        node->appendChild(emp);
    }

    foreach(QString dirName, dir.entryList(QDir::Dirs | QDir::NoDotAndDotDot,QDir::Name)){
        QString new_path(cur_path+QDir::separator()+dirName);
        node->appendChild(setupModelData(new_path,node));
    }
    foreach(QString fileName, dir.entryList(QDir::Files,QDir::Name)){
        QString fullFilePath = cur_path+QDir::separator()+fileName;
        TreeItem* item_node = new TreeItem(fullFilePath,node);
        node->appendChild(item_node);
    }
    return node;
}

TreeItem *TreeModel::getItem(const QModelIndex &index) const
{
    if (index.isValid()) {
        TreeItem *item = static_cast<TreeItem*>(index.internalPointer());
        if (item) return item;
    }
    return rootItem;
}

QStringList TreeModel::mimeTypes() const{
    QStringList types;
    types << "text/node";
    return types;
}

QMimeData* TreeModel::mimeData(const QModelIndexList &indexes) const{
    QMimeData *mimeData = new QMimeData();
    QByteArray encodedData;

    QDataStream stream(&encodedData, QIODevice::WriteOnly);

    foreach (const QModelIndex &index, indexes) {
        if (index.isValid()) {
            TreeItem* item = getItem(index);
            qint64 temp = (qint64)item;
            stream << temp;
        }
    }

    mimeData->setData("text/node", encodedData);
    return mimeData;
}

bool TreeModel::dropMimeData(const QMimeData *data, Qt::DropAction action, int row, int column, const QModelIndex &parent){

     TreeItem* new_source = static_cast<TreeItem*>(parent.internalPointer());

     if(new_source->isEmpty()){
         int row = new_source->row();
         TreeItem* p = new_source->parent();
         p->removeChild(row);
         new_source = p;
     }
     else if(new_source->isFile()) new_source = new_source->parent();

     for(int i=0;i<new_source->childCount();i++){
         if(new_source->child(i)->isEmpty())
             new_source->removeChild(i);
     }

     //if (action != Qt::MoveAction) return false; //wtf???????
     if (!data->hasFormat("text/node")) return false;
     if (column > 0) return false;
     if (!parent.isValid()) return false;

     QByteArray encodedData = data->data("text/node");
     QDataStream stream(&encodedData, QIODevice::ReadOnly);

     while (!stream.atEnd()) {
         qint64 temp;
         stream >> temp;
         TreeItem* item = (TreeItem*)temp;
         TreeItem* new_item = copyBranch(item,NULL);
         new_item->setParent(new_source);
         new_source->appendChild(new_item);
     }

     return true;
}

bool TreeModel::removeRows(int position, int rows, const QModelIndex &parent)
 {
     TreeItem *parentItem = getItem(parent);
     bool success = true;

     beginRemoveRows(parent, position, position + rows - 1);
     success = parentItem->removeChildren(position, rows);
     endRemoveRows();

     return success;
 }

bool TreeModel::insertRows(int position, int rows, const QModelIndex &parent)
 {

     // need changes... for new row we need to add empty child
     TreeItem *parentItem = getItem(parent);
     bool success = true;

     beginInsertRows(parent, position, position + rows - 1);
     success = parentItem->insertChildren(position, rows);
     endInsertRows();

     return success;
 }

TreeItem* TreeModel::copyBranch(TreeItem * old_item, TreeItem* new_parent_item){

    QString full_path = old_item->fullPath();
    TreeItem* new_item = new TreeItem(full_path,new_parent_item);

    for(int i=0;i<old_item->childCount();i++){
        new_item->appendChild(copyBranch(old_item->child(i),new_item));
    }

    return new_item;
}
