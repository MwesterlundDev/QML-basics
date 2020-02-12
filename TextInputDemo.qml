import QtQuick 2.0

Item {
    id: root

    Column {
        id: row
        anchors.centerIn: parent
        spacing: 10

        TextInput {
            id: input1
            width: 96; height: 20
            focus: true
            text: "Text Input 1"
            color: "#AAAAAA"
            KeyNavigation.tab: input2
            KeyNavigation.backtab: testClick
        }

        TextInput {
            id: input2
            width: 96; height: 20
            text: "Text Input 2"
            color: "#AAAAAA"
            KeyNavigation.tab: testClick
            KeyNavigation.backtab: input1
        }

        Button {
            id: testClick
            onClicked: {
                entered()
            }

            // not sure how to make sure this focus is correct
            KeyNavigation.tab: input1
            KeyNavigation.backtab: input2
            Keys.onEnterPressed: {
                entered()
            }

            function entered() {
                console.log(input1.text + " " + input2.text)
            }
        }


    }
}
