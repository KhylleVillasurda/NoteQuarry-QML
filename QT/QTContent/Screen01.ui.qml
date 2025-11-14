

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QT

Rectangle {
    width: Constants.width
    height: Constants.height
    color: "#322b2b"

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 1920
        height: 120
        color: "#468f35"

        TextField {
            id: findEntry
            x: 1498
            y: 24
            width: 396
            height: 72
            font.family: "Tahoma"
            font.pointSize: 15
            placeholderText: qsTr("Find an entry")
        }

        Button {
            id: newEntryButton
            x: 1260
            y: 24
            width: 220
            height: 72
            text: qsTr("+ New Entry")
            font.family: "Tahoma"
            icon.color: "#204e17"
            font.pointSize: 15
        }
    }
    Text {
        width: 244
        height: 64
        text: "NoteQuarry"
        font.family: "Tahoma"
        font.pointSize: 35
        anchors.verticalCenterOffset: -480
        anchors.horizontalCenterOffset: -729
        anchors.centerIn: parent
    }

    Image {
        id: image
        x: 14
        y: 24
        width: 92
        height: 72
        source: "images/app_icon.png"
        fillMode: Image.PreserveAspectFit
    }

    ScrollView {
        id: scrollView
        x: 22
        y: 142
        width: 1878
        height: 920
    }
}
