import QtQuick 2.0

Item {
    id: root

    property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]

    Grid {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4
        Repeater {
            model: 16
            Rectangle {
                width: 56; height: 56
                property int colorIndex: Math.floor(Math.random() * 3)
                color: root.colorArray[colorIndex]
                border.color: Qt.lighter(color)
                Text {
                    anchors.centerIn: parent
                    color: "#f0f0f0"
                    text: "Cell " + index
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("CLICKED CELL " + index + " with value " + colorIndex )
                    }
                }
            }
        }
    }
}
