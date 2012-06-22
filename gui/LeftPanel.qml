import QtQuick 1.0

Rectangle {
    anchors.leftMargin: 1
    color: "transparent"
    width: 200 //!!! absolute value of width

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
            gradient: Gradient{
                GradientStop{
                    id: gradientStopTop
                    position: 0.0;
                    color: "#c7e6fc"
                }
                GradientStop{
                    id: gradientStopBottom
                    position: 1.0
                    color: "#9dceef"
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    leftListView.currentIndex = index
                    leftListView.currentItem.z = -1
                }
            }
        }
        id: my_delegate
    }

    Component{
        ItemDelegate{
            z: +2
            module_name: leftListView.currentItem.module_name
            icon: leftListView.currentItem.icon
            gradient: Gradient{
                GradientStop{
                    position: 0.0
                    color: "#f00"
                }
                GradientStop{
                    position: 1.0
                    color: "#fff"
                }
            }
        }
        id: my_delegate_highlight
    }

    ListView {
        anchors.fill: parent
        spacing: 3
        id : leftListView
        model: leftListModel
        highlight: my_delegate_highlight
        delegate: my_delegate
        focus: true
    }

}
