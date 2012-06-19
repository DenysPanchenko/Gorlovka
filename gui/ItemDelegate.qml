import QtQuick 1.0

Rectangle {
    id: itemDelegate

    height: 46
    width:200
    radius: 10

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

    border.color: "#91c7ec"
    border.width: 2
    smooth: true

    property string module_name: "Module Name"
    property string icon: "Value"
    property string description: "Short description of module"

    Image{
        id: image
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        source:icon
    }

    Column{
        height: 40
        anchors.left: image.right
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        spacing: 6

        Text{
            id: label
            text:module_name
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
            color: "Black"
        }

        Text{
            id: descript
            text: description
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 10
        }
    }

    MouseArea{
        id: mouse
        anchors.fill: parent
        onEntered: parent.scale = 1.1
        onExited: parent.scale = 1.0
        hoverEnabled: true
        onClicked: {
            gradientStopBottom.color = "#f00"
            gradientStopTop.color = "#fff"
        }
    }
}
