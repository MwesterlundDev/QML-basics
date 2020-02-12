import QtQuick 2.0

Item {
    id: root

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 20
        BlueSquare {}
        RedSquare {}
        GreenSquare {}
    }
}
