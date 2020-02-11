import QtQuick 2.0

Item {
    id: root

    Text {
        text: "Rectangles"
        color: "#AAAAAA"
        font.family: "Agency FB"
        font.pixelSize: 28
    }

    Rectangle {
        id: rect1
        x: 12; y: 22

        width: parent.width / 2 - x * 2; height: parent.height - y * 2
        color: "lightsteelblue"

        MouseArea {
            id: area
            width: parent.width
            height: parent.height
            onClicked: rect2.visible = !rect2.visible
        }

    }

    Rectangle {
        id: rect2
        x: parent.width / 2 + 12; y: 22

        width: parent.width / 2 - 12 * 2; height: parent.height - y * 2
        color: "#00000000"
        border.color: "lightsteelblue"
        border.width: 4
        radius: 8

    }
}
