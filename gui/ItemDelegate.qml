import QtQuick 1.0

Rectangle {
    id: itemDelegate

    height: 46// + details.height + 5
    width:200
    radius: 10

    border.width: 1
    smooth: true

    property string module_name: "Module Name"
    property string icon: "Value"
    property string description: "Short description"

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
                parent.parent.state = parent.parent.state == "active_short" ? "active_detailed" : "active_short"
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

    state: "active_short"

    states: [
        State{
            name: "passive"
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
        }
    ]
}
