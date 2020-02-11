import QtQuick 2.0

Item {
    id: root

    Column {
        id: row
        anchors.centerIn: parent
        spacing: 8
        RedSquare {}
        GreenSquare { width: 96 }
        BlueSquare {}
    }
}
