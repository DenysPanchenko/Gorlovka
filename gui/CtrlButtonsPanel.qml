import QtQuick 1.0

Rectangle {

    Item{
        id: leftItem
        anchors.top: parent.top
        anchors.left: parent.top
        anchors.bottom: parent.bottom
        width: parent.width / 3
        CtrlButton{
            id: previewButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            icon_source: "./preview_icon.png"
        }
    }

    Item{
        id: centerItem
        anchors.top: parent.top
        anchors.left: leftItem.right
        anchors.bottom: parent.bottom
        width: parent.width / 3
        CtrlButton{
            id: startButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            icon_source: "./start_icon.png"
        }
    }

    Item{
        anchors.top: parent.top
        anchors.left: centerItem.right
        anchors.bottom: parent.bottom
        width: parent.width / 3
        CtrlButton{
            id: resetButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            icon_source: "./undo.png"
        }
    }
}
