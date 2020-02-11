import QtQuick 2.0

Item {
    id: root
    anchors.fill: parent
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
}
