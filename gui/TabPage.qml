import QtQuick 1.0

Rectangle {
    property string title: "Title"
    anchors.fill: parent
    color: "#e3e3e3"

    border.color: "black"
    border.width: 2

    Rectangle {
        anchors.fill: parent; anchors.margins: 20
    }
}
