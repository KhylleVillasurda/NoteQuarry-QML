import QtQuick
import QtQuick.Controls

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
    }

    TextArea {
        id: textArea
        x: 120
        y: 142
        width: 1776
        height: 914
        font.pointSize: 14
        font.family: "IM FELL English"
        placeholderText: qsTr("Text Area")
    }

    Button {
        id: button
        x: 34
        y: 142
        width: 80
        height: 72
        text: qsTr("Button")
    }

    Button {
        id: button1
        x: 34
        y: 220
        width: 80
        height: 72
        text: qsTr("Button")
    }

    Button {
        id: button2
        x: 34
        y: 298
        width: 80
        height: 72
        text: qsTr("Button")
    }
}
