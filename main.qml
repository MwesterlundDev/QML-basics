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



        Item {
            // I NEED A MODEL TO ALLOW ONLY ONE VISIBLE!

            id: controls
            x: 0; y: 0
            width: parent.width
            height: 100

             property int buttonMargin : 3

            function xLocation (x, width) {
                console.log("x, width", x, width)
                return x * (width + buttonMargin) + 12
            }

            function yLocation (y, height) {
                return y * (height + buttonMargin) + 12
            }

            Flow {
                id: grid
                anchors.fill: parent

                anchors.margins: 10
                spacing: 5


                Button {
                    id: showButtonDemo
                    text: "Show Button Demo"
                    onClicked: {
                        buttonContainer.visible = !buttonContainer.visible
                        text = ((buttonContainer.visible) ? "Hide" : "Show") + " Button Demo"
                    }
                }

                Button {
                    id: showTextDemo
                    text: "Show Text Demo"
                    onClicked: {
                        textDemo.visible = !textDemo.visible
                        text = ((textDemo.visible) ? "Hide" : "Show") + " Text Demo"
                    }
                }

                Button {
                    id: showRectangleDemo
                    text: "Show Rectangle Demo"
                    onClicked: {
                        rectangleDemo.visible = !rectangleDemo.visible
                        text = ((rectangleDemo.visible) ? "Hide" : "Show") + " Rectangle Demo"
                    }
                }

                Button {
                    id: showTransformDemo
                    text: "Show Transform Demo"
                    onClicked: {
                        transformationDemo.visible = !transformationDemo.visible
                        text = ((transformationDemo.visible) ? "Hide" : "Show") + " Transform Demo"
                    }
                }

                Button {
                    id: showColumnDemo
                    text: "Show Column Demo"
                    onClicked: {
                        columnDemo.visible = !columnDemo.visible
                        text = ((columnDemo.visible) ? "Hide" : "Show") + " Column Demo"
                    }
                }

                Button {
                    id: showRowDemo
                    text: "Show Row Demo"
                    onClicked: {
                        rowDemo.visible = !rowDemo.visible
                        text = ((rowDemo.visible) ? "Hide" : "Show") + " Row Demo"
                    }
                }

                Button {
                    id: showRepeaterDemo
                    text: "Show Repeater Demo"
                    onClicked: {
                        repeaterDemo.visible = !repeaterDemo.visible
                        text = ((repeaterDemo.visible) ? "Hide" : "Show") + " Repeater Demo"
                    }
                }
            }

        }

        Item {
            id: demoArea
            x: 0; y: 100
            width: parent.width
            height: parent.height - controls.height

            TextDemo {
                id: textDemo
                visible: false
                anchors.fill: parent
            }

            RectangleDemo {
                id: rectangleDemo
                visible: false
                anchors.fill: parent
            }

            ButtonDemo {
                id: buttonContainer
                anchors.fill: parent
                visible: false
            }

            TransformationDemo {
                id: transformationDemo
                anchors.fill: parent
                visible: false
            }

            ColumnDemo {
                id: columnDemo
                anchors.fill: parent
                visible: false
            }

            RowDemo {
                id: rowDemo
                anchors.fill: parent
                visible: false
            }

            RepeaterDemo {
                id: repeaterDemo
                anchors.fill: parent
                visible: false
            }
        }
    }

}
