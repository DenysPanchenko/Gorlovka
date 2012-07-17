#ifndef TREEITEM_H
#define TREEITEM_H

#include <QList>
#include <QString>
#include <QFileInfo>
#include <QDir>

class TreeItem
{
public:
    TreeItem(QString& data,TreeItem* parent);
    ~TreeItem();

    static TreeItem* emptyItem();
    static TreeItem* newDirItem();

    bool insertChildren(int,int);
    bool removeChildren(int,int);

    void appendChild(TreeItem*);
    bool removeChild(int pos);

    TreeItem* parent() const;
    void setParent(TreeItem*);
    int childCount() const;
    int row() const;
    TreeItem* child(int row) const;

    QString title() const;
    QString fullPath() const;
    void setFullPath(QString);
    void setTitle(QString);

    bool isEmpty();
    bool isExistedDir();
    bool isNewDir();
    bool isFile();


private:

    static QString empty() {return QString("<empty>");}
    static QString new_directory(){return QString("<new directory>");}

    enum PROPERTY{EX_DIR,NEW_DIR,FILE,EMPTY};

    QString itemTitle;
    QString path;
    QList<TreeItem*> childItems;
    TreeItem* parentItem;

    PROPERTY flag;
};

#endif // TREEITEM_H
