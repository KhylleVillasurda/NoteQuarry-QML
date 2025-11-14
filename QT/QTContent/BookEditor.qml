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

        RowLayout {
            id: rowLayout
            x: 8
            y: 129
            width: 100
            height: 926
        }

        Button {
            id: m1_redoBtn
            x: 17
            y: 298
            width: 80
            height: 72
            text: qsTr("Redo")
        }

        Button {
            id: button
            x: 1487
            y: 34
            width: 90
            height: 53
            text: qsTr("Previous")
            highlighted: false
        }

        TextField {
            id: pageNum
            x: 1591
            y: 34
            width: 90
            height: 53
            text: "Page Num"
            horizontalAlignment: Text.AlignHCenter
            placeholderText: qsTr("Text Field")
        }
    }

    TextArea {
        id: m1_paginatedEditor
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
        id: m1_saveBtn
        x: 17
        y: 142
        width: 80
        height: 72
        text: qsTr("Save")
    }

    Button {
        id: m1_undoBtn
        x: 17
        y: 220
        width: 80
        height: 72
        text: qsTr("Undo")
    }

    Button {
        id: m1_exitBtn
        x: 17
        y: 378
        width: 80
        height: 72
        text: qsTr("Exit")
    }

    Button {
        id: button2
        x: 1694
        y: 34
        width: 90
        height: 53
        text: qsTr("Next")
    }
}
