import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 450
    height: 350
    color: "#322b2b"

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 450
        height: 78
        color: "#468f35"

        Text {
            id: text1
            x: 163
            y: 27
            text: qsTr("Mode Selection")
            font.pixelSize: 18
            font.family: "Tahoma"
        }
    }

    Button {
        id: mode1
        x: 22
        y: 240
        width: 197
        height: 41
        text: qsTr("Paginated Mode")
        font.family: "Tahoma"
        flat: false
    }

    Button {
        id: mode2
        x: 232
        y: 240
        width: 197
        height: 41
        text: qsTr("Note Taking Mode")
        font.family: "Tahoma"
    }

    TextField {
        id: titleEntry
        x: 22
        y: 147
        width: 407
        height: 39
        text: ""
        font.family: "Tahoma"
        placeholderText: qsTr("Title")
    }

    Text {
        id: remindText
        x: 50
        y: 192
        text: qsTr("Guide: Input a entry title then choose the mode to create an entry.")
        font.pixelSize: 12
        font.family: "Tahoma"
    }

    Button {
        id: cancelBtn
        x: 22
        y: 287
        width: 407
        height: 41
        text: qsTr("Cancel")
    }
}
