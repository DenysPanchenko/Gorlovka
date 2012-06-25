import QtQuick 1.0

Rectangle{
    width:  48
    height: 48

    anchors.topMargin:    10
    anchors.leftMargin:   10
    anchors.rightMargin:  10
    anchors.bottomMargin: 10

    radius: 10
    smooth: true
    color: "transparent"

    border.width: 2
    border.color: "black"

    property string icon_source: ""

    Image{
        smooth: true
        anchors.fill: parent
        anchors.topMargin:    4
        anchors.leftMargin:   4
        anchors.rightMargin:  4
        anchors.bottomMargin: 4
        MouseArea {
            anchors.fill: parent
            onPressed:
                parent.parent.scale = 1.0
            onReleased:
                parent.parent.scale = containsMouse ? 1.2 : 1.0
            onContainsMouseChanged:
                parent.parent.scale = containsMouse ? 1.2 : 1.0
            hoverEnabled: true
        }
        source: parent.icon_source
    }
}

