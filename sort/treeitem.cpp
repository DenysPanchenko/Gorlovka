#include "treeitem.h"

TreeItem::TreeItem(QString &data, TreeItem *parent)
{
    setFullPath(data);
    parentItem=parent;
}

TreeItem::~TreeItem(){
    qDeleteAll(childItems); // not sure
}

QString TreeItem::title() const {
    return itemTitle;
}

QString TreeItem::fullPath() const {
    return path;
}

TreeItem* TreeItem::child(int row) const{
    return childItems.value(row);
}

int TreeItem::childCount() const {
    return childItems.count();
}

TreeItem* TreeItem::parent() const{
    return parentItem;
}

int TreeItem::row() const
 {
     if (parentItem)
         return parentItem->childItems.indexOf(const_cast<TreeItem*>(this));

     return 0;
 }

void TreeItem::setTitle(QString new_title){
    itemTitle = new_title;
}

void TreeItem::setFullPath(QString data){
    QFileInfo ff(data);
    if(ff.isDir()){
        itemTitle=QDir(data).dirName();
        flag=EX_DIR;
        path=data;
    }
    else if(ff.isFile()){
        itemTitle = ff.fileName();
        flag=FILE;
        path=data;
    }
    else if(data==empty()){
        itemTitle = data;
        flag=EMPTY;
        path=data; // empty don't need path
    }
    else{
        itemTitle = data;
        flag=NEW_DIR;
        path=parentItem->fullPath(); // for new dir we only save the path to it's parent
    }
}

bool TreeItem::insertChildren(int position, int count)
 {
    if (position < 0 || position > childItems.size())
        return false;

    for (int row = 0; row < count; ++row) {
        TreeItem *item = newDirItem();
        item->setParent(this);
        childItems.insert(position, item);
    }

    return true;
 }

 bool TreeItem::removeChildren(int position, int count)
 {
    if (position < 0 || position + count > childItems.size())
        return false;

    for (int row = 0; row < count; ++row)
        childItems.removeAt(position);

    return true;
 }

 void TreeItem::appendChild(TreeItem *item){
     childItems.append(item);
 }

 bool TreeItem::removeChild(int position){
     if (position < 0 || position >= childItems.size()) return false;
         childItems.removeAt(position);

     return true;
 }

 void TreeItem::setParent(TreeItem *new_parent){
     parentItem=new_parent;
 }

 TreeItem* TreeItem::emptyItem(){
     QString str = empty();
     return new TreeItem(str,NULL);
 }

 TreeItem* TreeItem::newDirItem(){
     QString str = new_directory();
     return new TreeItem(str,NULL);
 }

 bool TreeItem::isEmpty(){
     return flag==EMPTY;
 }

 bool TreeItem::isExistedDir(){
     return flag==EX_DIR;
 }

 bool TreeItem::isNewDir(){
     return flag==NEW_DIR;
 }

 bool TreeItem::isFile(){
     return flag==FILE;
 }
