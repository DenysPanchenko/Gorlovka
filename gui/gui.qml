import QtQuick 1.0

Rectangle {
    id: main
    width: 600
    height: 400

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

    LeftPanel{
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }
}
