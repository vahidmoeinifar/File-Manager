import QtQuick 2.15
import QtQml 2.12
import QtQuick.Controls 2.15

Dialog {
    id: dialogNewFolder
    width: 300

    property string dialogTitle: ""
    property string inputText: ""
    property string mode
    anchors.centerIn: parent

    onAccepted: {

         if ( mode === "newfolder") {
         fileManager.newFolder(folderModel.folder + "/" + inputField.text)
         }
         else {

                 if ( selectedItemList.length > 1) {
                     for (var i = 0; i < selectedItemList.length; i++) {
                         fileManager.cutFile(selectedItemList[i], folderModel.folder + "/" + inputField.text + "(" + (i+1) + ")", "rename")
                     }
                 }
                 else{
                     fileManager.cutFile(selectedItemList[0], folderModel.folder + "/" + inputField.text, "rename")
                 }

         }



        dialogNewFolder.close()
         selectMode = false
        inputField.text = ""
    }
    onRejected: {
        dialogNewFolder.close()
        selectMode = false
        inputField.text = ""
    }

    contentItem:
        Rectangle{
        anchors.fill: parent
        color: topBarColor
        border.color: borderColor

        Column {
            spacing: 10

            anchors.centerIn: parent
            width: parent.width

            TextField {
                id: inputField
                placeholderText: mode === "newfolder" ? "Enter new folder name..." : "Rename..."
                text: dialogNewFolder.inputText
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 20
                selectByMouse: true

                background: Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                    border.color: borderColor
                }
            }

            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: okIcon
                    text: mode === "newfolder" ? "Create" : "Rename"
                    font.family:"fontawesome"
                    font.pixelSize: 13

                    contentItem: Text {
                        text: okIcon.text
                        font: okIcon.font
                        opacity: enabled ? 1.0 : 0.3
                        color:  "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    background: Rectangle{
                        implicitWidth: 100
                        implicitHeight: 30
                        color: okIcon.down ?  topBarColor : Qt.lighter(topBarColor)
                        border.color: borderColor

                    }
                    onClicked: {

                        dialogNewFolder.accepted(inputField.text);


                    }
                }

                Button {
                    id: cancelIcon
                    text: "Cancel"
                    font.family:"fontawesome"
                    font.pixelSize: 13

                    contentItem: Text {
                        text: cancelIcon.text
                        font: cancelIcon.font
                        opacity: enabled ? 1.0 : 0.3
                        color:  "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight

                    }
                    background: Rectangle{
                        implicitWidth: 100
                        implicitHeight: 30
                        color: cancelIcon.down ?  topBarColor : Qt.lighter(topBarColor)
                        border.color: borderColor
                    }
                    onClicked: {
                        dialogNewFolder.rejected();

                    }
                }



            }
        }

    }


}


