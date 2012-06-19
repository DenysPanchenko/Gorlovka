import QtQuick 1.0

Item {
    anchors.leftMargin: 8
    width:200 //!!! absolute value of width

    ListModel{
        ListElement{
            module_name: "Module 1"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        ListElement{
            module_name: "Module 2"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        ListElement{
            module_name: "Module 3"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        ListElement{
            module_name: "Module 4"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        ListElement{
            module_name: "Module 5"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        ListElement{
            module_name: "Module 6"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        ListElement{
            module_name: "Module 7"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        ListElement{
            module_name: "Module 8"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        ListElement{
            module_name: "Module 9"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
        }
        id : leftListModel
    }

    Component{
        ItemDelegate{
            module_name: model.module_name
            icon: model.icon
        }
        id: my_delegate
    }

    ListView{
        spacing: 8
        id : leftListView
        model: leftListModel
        delegate: my_delegate
        anchors.fill: parent
        MouseArea {
            anchors.fill: parents
        }
    }
}
