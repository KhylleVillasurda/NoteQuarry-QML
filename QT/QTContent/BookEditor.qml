import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#322b2b"
    focus: false

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 1920
        height: 120
        color: "#468f35"

        Text {
            id: entryTitle
            x: 38
            y: 43
            width: 328
            height: 34
            text: "Title Area"
            font.pixelSize: 35
            font.italic: false
            font.family: "IM FELL English"
        }

        TabButton {
            id: tabButton
            x: 1210
            y: 43
            text: qsTr("Tab Button")
        }

        RowLayout {
            id: rowLayout
            x: 8
            y: 129
            width: 100
            height: 926
        }

        Button {
            id: button3
            x: 17
            y: 298
            width: 80
            height: 72
            text: qsTr("Redo")
        }
    }

    TextArea {
        id: textArea
        x: 120
        y: 142
        width: 1776
        height: 914
        placeholderTextColor: "#9f8f8f"
        font.pointSize: 14
        font.family: "IM FELL English"
        placeholderText: qsTr("Text Area")
    }

    Button {
        id: button
        x: 17
        y: 142
        width: 80
        height: 72
        text: qsTr("Save")
    }

    Button {
        id: button1
        x: 17
        y: 220
        width: 80
        height: 72
        text: qsTr("Undo")
    }

    Button {
        id: button2
        x: 17
        y: 378
        width: 80
        height: 72
        text: qsTr("Button")
    }
}
