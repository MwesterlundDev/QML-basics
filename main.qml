import QtQuick 2.12
import QtQuick.Window 2.12

// root element is the window
Window {
    visible: true
    width: 400
    height: 500
    title: qsTr("Hello World")

    // this a rectangle element
    Rectangle {
        // id of the rectangle
        id: rect

        // proterties <name>: <value>
        width: parent.width
        height: parent.height

        // color property
//        color: "#414141"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#414141" }
            GradientStop { position: 1.0; color: "#111111" }
        }

        //declair a nested element (child of rectangle)
        Image {
            id: triangle

            // set the x,y values of the image
            x: (parent.width - width) / 2
            y: 40

            // source of the image
            source: "assets/triangle_red.png"

            KeyNavigation.tab: label1

        }

        Text {
            // (1) identifier
            id: label1

            // (2) set x/y position -- reference the triangle image
            y: triangle.y + triangle.height + 20

            // reference the rect element
            width: parent.width

            // (3) set height
            height: width / 4

            // (4) create custom property
            property int times: 24

            // (5) property alias
            property alias anotherTimes: label1.times

            // (6) set text appended by value
            text: "Greetings " + times

            // (7) font is grouped property
            font.family: "arial"
            font.pixelSize: 24

            // (8) Key KeyNavigation is an attached property
            KeyNavigation.tab: label2

            // (9) signal hjandler for property changes
            onHeightChanged: console.log("height: ", height)

            // focus is needed to recieve key events
            focus: true

            // change color based on focus:
            color: focus?"red":"black"

            // text properies
            horizontalAlignment: Text.AlignHCenter

        }

        Text {
            id: label2

            x: 24; y:24

            // custom counter property for space presses
            property int spacePresses: 0

            text: "Space Pressed " + spacePresses + " times"

            // (1) Handler for text changes
            onTextChanged: console.log("text changed to: ", text)

            // need focus to register key events
            focus: false

            // (2) handler with some JS
            Keys.onSpacePressed: {
                increment()
            }

            // clear the text on escape:
            Keys.onEscapePressed: {
//                label2.text = ''
                spacePresses = 0
            }

            KeyNavigation.tab: label1

            // change color based on focus:
            color: focus?"red":"black"

            // (3) a javascript function
            function increment() {
                spacePresses = spacePresses + 1
            }

        }

        Item {
            id: rectContainer
            width: parent.width // like css 100%
            height: parent.height / 2 // like css 50%

            x: 0 ; y: parent.height / 2

            Text {
                text: "The quick brown fox"
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
    }

}
