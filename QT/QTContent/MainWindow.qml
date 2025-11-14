import QtQuick
import QtQuick.Controls
import QT

Rectangle {
    width: Constants.width
    height: Constants.height
    color: "#322b2b"

    // Mock data model for testing
    ListModel {
        id: entriesModel

        ListElement {
            entryId: 1
            title: "My First Book"
            mode: "BOOK"
            createdAt: "2024-01-15"
            pageCount: 5
            tags: "fiction, draft"
        }
        ListElement {
            entryId: 2
            title: "Research Notes"
            mode: "NOTE"
            createdAt: "2024-01-14"
            pageCount: 0
            tags: "work, important"
        }
        ListElement {
            entryId: 3
            title: "Travel Journal"
            mode: "BOOK"
            createdAt: "2024-01-12"
            pageCount: 12
            tags: "personal, travel"
        }
        ListElement {
            entryId: 4
            title: "Project Ideas"
            mode: "NOTE"
            createdAt: "2024-01-10"
            pageCount: 0
            tags: "brainstorm"
        }
        ListElement {
            entryId: 5
            title: "Daily Thoughts"
            mode: "BOOK"
            createdAt: "2024-01-08"
            pageCount: 25
            tags: "journal, daily"
        }
    }

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 1920
        height: 120
        color: "#468f35"

        Image {
            id: image
            x: 14
            y: 24
            width: 92
            height: 72
            source: "images/app_icon.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            x: 112
            y: 28
            width: 244
            height: 64
            text: "NoteQuarry"
            font.family: "Tahoma"
            font.pointSize: 35
            color: "#ffffff"
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

            onClicked: {
                // Add new entry to model
                entriesModel.append({
                    entryId: entriesModel.count + 1,
                    title: "New Entry " + (entriesModel.count + 1),
                    mode: "BOOK",
                    createdAt: Qt.formatDate(new Date(), "yyyy-MM-dd"),
                    pageCount: 0,
                    tags: ""
                })
                console.log("New entry created")
            }
        }

        TextField {
            id: findEntry
            x: 1498
            y: 24
            width: 396
            height: 72
            font.family: "Tahoma"
            font.pointSize: 15
            placeholderText: qsTr("Find an entry")

            onTextChanged: {
                // Simple filter functionality
                console.log("Searching for: " + text)
            }
        }
    }

    ScrollView {
        id: scrollView
        x: 22
        y: 142
        width: 1878
        height: 920
        clip: true

        ListView {
            id: entriesListView
            anchors.fill: parent
            spacing: 10
            model: entriesModel

            delegate: Rectangle {
                width: entriesListView.width - 20
                height: 120
                color: "#3d3535"
                radius: 8
                border.color: "#5a5050"
                border.width: 1

                // Hover effect
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: {
                        console.log("Opening entry:", model.title, "ID:", model.entryId)
                        // This is where you'd open the BookEditor or NoteEditor
                    }
                }

                // Visual feedback on hover
                Rectangle {
                    anchors.fill: parent
                    color: "#468f35"
                    opacity: mouseArea.containsMouse ? 0.2 : 0
                    radius: 8
                }

                Row {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 20

                    // Mode indicator
                    Rectangle {
                        width: 80
                        height: 80
                        anchors.verticalCenter: parent.verticalCenter
                        color: model.mode === "BOOK" ? "#5a8a4a" : "#8a6a4a"
                        radius: 8

                        Text {
                            anchors.centerIn: parent
                            text: model.mode === "BOOK" ? "📖" : "📝"
                            font.pixelSize: 40
                        }
                    }

                    Column {
                        width: parent.width - 120
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 8

                        Text {
                            text: model.title
                            font.family: "Tahoma"
                            font.pointSize: 18
                            font.bold: true
                            color: "#ffffff"
                            elide: Text.ElideRight
                            width: parent.width
                        }

                        Row {
                            spacing: 15

                            Text {
                                text: "Created: " + model.createdAt
                                font.family: "Tahoma"
                                font.pointSize: 11
                                color: "#b0a0a0"
                            }

                            Text {
                                text: model.mode === "BOOK" ?
                                      (model.pageCount + " pages") :
                                      "Note"
                                font.family: "Tahoma"
                                font.pointSize: 11
                                color: "#b0a0a0"
                            }

                            Text {
                                text: model.tags !== "" ? ("Tags: " + model.tags) : ""
                                font.family: "Tahoma"
                                font.pointSize: 11
                                color: "#90c080"
                                visible: model.tags !== ""
                            }
                        }
                    }

                    // Delete button
                    Button {
                        width: 40
                        height: 40
                        anchors.verticalCenter: parent.verticalCenter
                        text: "🗑"
                        font.pixelSize: 20

                        onClicked: {
                            console.log("Deleting entry:", model.title)
                            entriesModel.remove(index)
                        }
                    }
                }
            }

            // Empty state
            Label {
                anchors.centerIn: parent
                visible: entriesListView.count === 0
                text: "No entries yet.\nClick '+ New Entry' to create one."
                font.family: "Tahoma"
                font.pointSize: 18
                color: "#808080"
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
