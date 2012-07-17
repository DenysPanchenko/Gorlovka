import QtQuick 1.0

Rectangle {
    anchors.leftMargin: 1
    color: "transparent"
    width: 200 //!!! absolute value of width

    ListModel{
        ListElement{
            module_name: "Module 1"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
            description: "This is a very long and detailed description of this module and it's work."
            curState: "active_short"
        }
        ListElement{
            module_name: "Module 2"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
            description: "This is a very long and detailed description of this module and it's work."
            curState: "passive"
        }
        ListElement{
            module_name: "Module 3"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
            description: "This is a very long and detailed description of this module and it's work."
            curState: "passive"
        }
        ListElement{
            module_name: "Module 4"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
            description: "This is a very long and detailed description of this module and it's work."
            curState: "passive"
        }
        ListElement{
            module_name: "Module 5"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
            description: "This is a very long and detailed description of this module and it's work."
            curState: "passive"
        }
        ListElement{
            module_name: "Module 6"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
            curState: "passive"
        }
        ListElement{
            module_name: "Module 7"
            icon: "http://static.commentcamarche.net/en.kioskea.net/faq/images/1819-icofx-s-.png"
            curState: "passive"
        }
        id : leftListModel
    }

    Component{
        Rectangle {
            id: itemDelegate

            height: 46// + details.height + 5
            width:200
            radius: 10

            border.width: 1
            smooth: true

            property string module_name: model.module_name
            property string icon: model.icon
            property string description: model.description

            gradient: Gradient{
                GradientStop{
                    id: top_gradient
                    position: 0.0
                    color: "#c7e6fc"
                }
                GradientStop{
                    id: bottom_gradient
                    position: 1.0
                    color: "#9dceef"
                }
            }

            Image{
                id: image
                width: 40
                height: 40
                anchors.left: parent.left
                anchors.margins: 5
                anchors.top: parent.top
                source:icon
            }

            Item{
                anchors.left: image.right
                anchors.top: parent.top
                anchors.right: more_image.left
                anchors.bottom: details.top
                anchors.topMargin: 5
                anchors.bottomMargin: 3
                Text{
                    id: label
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:module_name
                    font.pixelSize: 16
                    color: "Black"
                }
            }

            Image{
                id: more_image
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 5
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if (parent.parent.state != "active_detailed"){
                            leftListView.currentIndex = index
                            parent.parent.state = "active_detailed"
                        }
                        else
                            parent.parent.state = "active_short"
                    }
                }
            }

            Text{
                id: details
                anchors.left: parent.left
                anchors.top: image.bottom
                anchors.right: more_image.left
                anchors.margins: 3
                wrapMode: Text.WordWrap
            }

            //state: "active_short"

            states: [
                State{
                    name: "passive"
                    when: leftListView.currentIndex != index
                    PropertyChanges{
                        target: more_image
                        source: "./show_more.png"
                    }
                    PropertyChanges{
                        target: details
                        text: " "
                    }
                    PropertyChanges {
                        target: top_gradient
                        color: "#c7e6fc"
                    }
                    PropertyChanges {
                        target: bottom_gradient
                        color: "#9dceef"
                    }
                },

                State {
                    name: "active_detailed"
                    PropertyChanges {
                        target: more_image
                        source: "./hide_more.png"
                    }
                    PropertyChanges{
                        target: details
                        text: parent.description
                        anchors.rightMargin: 0
                        opacity: 1.0
                    }
                    PropertyChanges {
                        target: itemDelegate
                        height: 46 + details.height + 5
                    }
                    PropertyChanges {
                        target: top_gradient
                        color: "#f00"
                    }
                    PropertyChanges {
                        target: bottom_gradient
                        color: "#fff"
                    }
                },

                State {
                    name: "active_short"
                    when: leftListView.currentIndex == index
                    PropertyChanges{
                        target: more_image
                        source: "./show_more.png"
                    }
                    PropertyChanges{
                        target: details
                        text: " "
                    }
                    PropertyChanges {
                        target: top_gradient
                        color: "#f00"
                    }
                    PropertyChanges {
                        target: bottom_gradient
                        color: "#fff"
                    }
                }
                /*
                ,
                State {
                    name: "short"
                    PropertyChanges{
                        target: more_image
                        source: "./show_more.png"
                    }
                    PropertyChanges{
                        target: details
                        text: " "
                    }
                    PropertyChanges {
                        target: itemDelegate
                        height: 46
                    }
                },
                State {
                    name: "detailed"
                    PropertyChanges {
                        target: more_image
                        source: "./hide_more.png"
                    }
                    PropertyChanges{
                        target: details
                        text: parent.description
                        anchors.rightMargin: 0
                        opacity: 1.0
                    }
                    PropertyChanges {
                        target: itemDelegate
                        height: 46 + details.height + 5
                    }
                }
                */
            ]

            transitions: [
                Transition {
                    from: "active_short"
                    to: "active_detailed"
                    PropertyAnimation{
                        target: itemDelegate
                        properties: "height"
                        duration: 200
                    }
                    PropertyAnimation{
                        target: top_gradient
                        properties: "color"
                        duration: 200
                    }
                    PropertyAnimation{
                        target: bottom_gradient
                        properties: "color"
                        duration: 200
                    }
                },
                Transition {
                    from: "active_detailed"
                    to: "active_short"
                    PropertyAnimation{
                        target: itemDelegate
                        properties: "height"
                        duration: 200
                    }
                },
                Transition{
                    from: "active_short"
                    to: "passive"
                    PropertyAnimation{
                        target: top_gradient
                        properties: "color"
                        duration: 250
                    }
                    PropertyAnimation{
                        target: bottom_gradient
                        properties: "color"
                        duration: 250
                    }
                },
                Transition{
                    from: "passive"
                    to: "active_short"
                    PropertyAnimation{
                        target: top_gradient
                        properties: "color"
                        duration: 250
                    }
                    PropertyAnimation{
                        target: bottom_gradient
                        properties: "color"
                        duration: 250
                    }
                },
                Transition{
                    from: "active_detailed"
                    to: "passive"
                    PropertyAnimation{
                        target: top_gradient
                        properties: "color"
                        duration: 250
                    }
                    PropertyAnimation{
                        target: bottom_gradient
                        properties: "color"
                        duration: 250
                    }
                    PropertyAnimation{
                        target: itemDelegate
                        properties: "height"
                        duration: 200
                    }
                }

            ]
            MouseArea{
                z: -1
                anchors.fill: parent
                onClicked:{
                    leftListView.currentIndex = index

                }
            }

        }
        id: my_delegate
    }
    /*
    Component{
        ItemDelegate{
            z: +2
            id: it
            module_name: leftListView.currentItem.module_name
            icon: leftListView.currentItem.icon
            description: leftListView.currentItem.description
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
    */
    ListView {
        anchors.fill: parent
        spacing: 3
        id : leftListView
        model: leftListModel

        delegate: my_delegate
        focus: true
    }
}
