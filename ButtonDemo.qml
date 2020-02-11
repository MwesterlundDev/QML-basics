import QtQuick 2.0

Item {
    id: root
//    anchors.fill: parent

    Button {
        id: button
        x: 12; y: 12
        text: "Start"
        onClicked: {
            status.text = "Button Clicked!"
        }
    }

    Text {
        id: status
        x: 12; y:76
        width: parent.width - x * 2
        text: "Waiting..."
        horizontalAlignment: Text.AlignHCenter
        color: "#AAAAAA"
    }
}
