import QtQuick 1.1

Rectangle {
    id: main
    width: 800
    height: 600

    gradient: Gradient{
        GradientStop{
            position: 0.0
            color: "#555555"
        }
        GradientStop{
            position: 1.0
            color: "#777777"
        }
    }

    MainMenu{
        z: +2
        id: mainMenu
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
    }

    Rectangle{
        anchors.top: mainMenu.bottom
        anchors.left: parent.left
        height: 30
        width: leftPanel.width + 1
        z: 1
        id:leftListTitle
        border.color: "black"
        border.width: 1

        gradient: Gradient{
            GradientStop{
                position: 0.0
                color: "#9c9c9c"
            }
            GradientStop{
                position: 1.0
                color: "#313131"
            }
        }


        Text{
            //anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            font.pixelSize: 16
            text: "Available modules:"
        }
    }

    LeftPanel{
        id: leftPanel
        border.color: "black"
        border.width: 2
        anchors.top: leftListTitle.bottom
        anchors.bottom: bottomButtons.top
        anchors.left: parent.left
    }

    Rectangle{
        id: bottomButtons

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: leftPanel.width + 1
        height: 62
        z: +1
        border.width: 2
        border.color: "black"
        gradient: Gradient{
            GradientStop{
                position: 0.0
                color: "#9c9c9c"
            }
            GradientStop{
                position: 1.0
                color: "#313131"
            }
        }

        Rectangle{
            id: previewButton

            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10

            anchors.right: startButton.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 42
            color: "transparent"
            border.color: "black"
            border.width: 2
            radius: 10
            smooth: true
            Image{
                anchors.fill: parent
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                MouseArea {
                    anchors.fill: parent
                    onEntered:
                        parent.parent.scale = 1.2
                    onExited: parent.parent.scale = 1.0
                    hoverEnabled: true
                }
                source: "http://png-2.findicons.com/files//icons/573/must_have/48/play.png"
            }
        }
        Rectangle{
            id: startButton

            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: 42
            color: "transparent"

            border.color: "black"
            border.width: 2
            radius: 10
            smooth: true

            Image{
                anchors.fill: parent

                MouseArea {
                    anchors.fill: parent
                    onEntered:
                        parent.parent.scale = 1.2
                    onExited: parent.parent.scale = 1.0
                    hoverEnabled: true
                }
                source: "http://icons.iconarchive.com/icons/icons-land/play-stop-pause/128/Record-Normal-Red-icon.png"
            }
        }
        Rectangle{
            id: addToPipeButton

            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10

            anchors.left: startButton.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 42
            color: "transparent"
            border.color: "black"
            border.width: 2
            radius: 10
            smooth: true
            Image{
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onEntered:
                        parent.parent.scale = 1.2
                    onExited: parent.parent.scale = 1.0
                    hoverEnabled: true
                }
                source: "http://icons.iconarchive.com/icons/visualpharm/must-have/128/Refresh-icon.png"
            }
        }
    }

    Rectangle{
        id: topListTitle
        anchors.top: mainMenu.bottom
        anchors.left: leftListTitle.right
        anchors.right: parent.right
        width: parent.width - leftListTitle.width
        height: 30
        border.color: "black"
        border.width: 1
        gradient: Gradient{
            GradientStop{
                position: 0.0
                color: "#9c9c9c"
            }
            GradientStop{
                position: 1.0
                color: "#313131"
            }
        }
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
            color: "white"
            text:"Pipeline modules:"
        }
    }

    TopPanel{
        border.color: "black"
        border.width: 2
        anchors.top: topListTitle.bottom
        anchors.left: leftPanel.right
        anchors.right: parent.right
    }
}
