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

    CtrlButtonsPanel{
        id: bottomButtons

        z: +1
        height: 68
        width: leftPanel.width + 1

        anchors.left: parent.left
        anchors.bottom: parent.bottom

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
        id: topPanel
        border.color: "black"
        border.width: 2
        anchors.top: topListTitle.bottom
        anchors.left: leftPanel.right
        anchors.right: parent.right
    }

    TabWidget {
        anchors.top: topPanel.bottom
        anchors.left: leftPanel.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        id: tabs

        TabPage{
            title: "Module 1"
        }
        TabPage{
            title: "Module 2"
        }
        TabPage{
            title: "Preview"
        }
    }
}
