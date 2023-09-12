import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.folderlistmodel 2.2

Row  {
    id: tablePanel


    ListView {
        id: fileTable
        width: parent.width
        height: parent.height

        clip: true
        model: folderModel
        header: Rectangle{
            width: fileTable.width
            height: 30
            color: "#858585"
            z: 2
            Row {
                property string sortValue: "name" // includes : name, date modified and size

                id: sortButtonsSet
                height: 30
                width: fileTable.width
                leftPadding: 5
                Item{
                    id: selHeaderRec
                    width: 15
                    height: parent.height
                }

                Button{
                    property bool descendingSort: true

                    id: nameHeaderRec
                    width: nameColWidth
                    height: parent.height
                    background: Rectangle{
                        implicitWidth: nameColWidth
                        implicitHeight: parent.height
                        color: nameHeaderRec.down ? "#A6ACAF" : "#858585"

                    }
                    Text {
                        text: "Filename"
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        padding: 5
                    }
                    Text {
                        text: nameHeaderRec.descendingSort === true ? "\uF077" : "\uF078"
                        font.family:"fontawesome"
                        font.pixelSize: 7
                        color: "white"
                        visible: sortButtonsSet.sortValue === "name"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    onClicked: {
                        nameHeaderRec.descendingSort = ! nameHeaderRec.descendingSort
                        sortButtonsSet.sortValue = "name"
                        folderModel.sortField = FolderListModel.Name
                        folderModel.sortReversed = !  folderModel.sortReversed
                    }
                    Rectangle{width: 1; height: parent.height; anchors.right: parent.right}
                }

                Button{
                    property bool descendingSort: true

                    id: dateHeaderRec
                    width: dateColWidth
                    height: parent.height
                    background: Rectangle{
                        implicitWidth: dateColWidth
                        implicitHeight: parent.height
                        color: dateHeaderRec.down ? "#A6ACAF" : "#858585"

                    }
                    Text {
                        text: "Date modified"
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: 5
                    }
                    Text {
                        text: dateHeaderRec.descendingSort === true ? "\uF077" : "\uF078"
                        font.family:"fontawesome"
                        font.pixelSize: 7
                        color: "white"
                        visible: sortButtonsSet.sortValue === "date modified"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle{width: 1; height: parent.height; anchors.right: parent.right}

                    onClicked: {
                        dateHeaderRec.descendingSort = ! dateHeaderRec.descendingSort
                        sortButtonsSet.sortValue = "date modified"
                        folderModel.sortField = FolderListModel.Time
                        folderModel.sortReversed = !  folderModel.sortReversed
                    }
                }
                Button{
                    property bool descendingSort: true

                    id: sizeHeaderRec
                    width: sizeColWidth
                    height: parent.height
                    background: Rectangle{
                        implicitWidth: sizeColWidth
                        implicitHeight: parent.height
                        color: sizeHeaderRec.down ? "#A6ACAF" : "#858585"

                    }
                    Text {
                        text: "Size"
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: 5
                    }
                    Text {
                        text: sizeHeaderRec.descendingSort === true ? "\uF077" : "\uF078"
                        font.family:"fontawesome"
                        font.pixelSize: 7
                        color: "white"
                        visible: sortButtonsSet.sortValue === "size"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    onClicked: {
                        sizeHeaderRec.descendingSort = ! sizeHeaderRec.descendingSort
                        sortButtonsSet.sortValue = "size"
                        folderModel.sortField = FolderListModel.Size
                        folderModel.sortReversed = !  folderModel.sortReversed
                    }
                }

            }
        }
        headerPositioning: ListView.OverlayHeader
        delegate: MouseArea{
            id: itemDelegate
            implicitHeight: 50
            implicitWidth: fileTable.width
            onPressAndHold: {
                fileTable.currentIndex = index
                selectMode = true
            }

            onClicked: {
                if (selectMode){
                    checkBox.checked = ! checkBox.checked
                }
                else if (!selectMode && folderModel.isFolder(index)) {
                    folderModel.folder = fileURL
                    currentAddress += fileName + "/"
                    navigationModel.append({"name" : fileName})
                }

            }

           SeparatorLine{ lineColor: "gray"}


            Row {
                height: 50
                width: fileTable.width
                topPadding: 20

                CheckBox {
                    id: checkBox
                    checked: fileTable.currentIndex === index ? true : false
                    implicitWidth: 25
                    implicitHeight: 20
                    opacity: selectMode ? 1 : 0
                    indicator: Rectangle {
                        implicitWidth: 15
                        implicitHeight: 15
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: 3
                        border.color: "#4b626c"

                        Rectangle {
                            width: 7
                            height: width
                            x: 4
                            y: x
                            radius: 2
                            color: "#4b626c"
                            visible: checkBox.checked
                        }
                    }
                    onCheckStateChanged: {
                        var filePath = folderModel.folder + "/" + fileName;
                        filePath.substring(10)

                        if (checkBox.checked){
                            selectedItemList.push(filePath)
                            selectedFileList.push(fileName)
                        }
                        else{
                            selectedItemList.pop(filePath)
                            selectedFileList.pop(fileName)
                        }

                        if (!selectMode)
                            checkBox.checked = false
                    }

                }
                Rectangle {
                    id: nameRec
                    color: mainColor
                    implicitWidth: nameColWidth
                    implicitHeight: parent.height

                    Row{
                        anchors.fill: parent
                        spacing: 5
                        Text {
                            text: folderModel.isFolder(index) ? "\uF07B" : "\uF15B"
                            font.family:"fontawesome"
                            color: folderModel.isFolder(index) ? "gold" : "deepskyblue"
                            font.pixelSize: 18

                        }
                        Text {
                            text: fileName
                            color: "white"
                        }
                    }


                }

                Rectangle {
                    id: dateRec
                    color: mainColor
                    implicitWidth: dateColWidth
                    implicitHeight: parent.height
                    Text {
                        text: fileModified
                        color: "white"
                    }
                }

                Rectangle {
                    id: sizeRec
                    color: mainColor
                    implicitWidth: sizeColWidth
                    implicitHeight: parent.height
                    Text {
                        text: folderModel.isFolder(index) ? "" : fileSize/1024 + " kb"
                        color: "white"
                    }
                }
            }
        }


    }


}





