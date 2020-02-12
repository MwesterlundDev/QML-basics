import QtQuick 2.0

Item {
    id: root

    GreenSquare {
        id: square
        x: 10; y: 10
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("set focus to root?")
                root.focus = true
            }
        }
    }

    focus: true
    Keys.onLeftPressed: square.x -= 8
    Keys.onRightPressed: square.x += 8
    Keys.onUpPressed: square.y -= 8
    Keys.onDownPressed: square.y += 8
    Keys.onPressed: {
        switch(event.key) {
            case Qt.Key_Plus:
                square.scale += 0.2
                break;
            case Qt.Key_Minus:
                square.scale -= 0.2
                break;
        }
    }



}
