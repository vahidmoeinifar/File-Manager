import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    height: 70
    width: parent.width



  Row{
  height: 70
  width: parent.width - 40
  anchors.centerIn: parent
  spacing: 20
  ToolButton {
      id: copyIcon
      text: "\uF0C5"
      font.family:"fontawesome"
      font.pixelSize: 40
      anchors.verticalCenter: parent.verticalCenter
      enabled: selectMode
      contentItem: Text {
          text: copyIcon.text
          font: copyIcon.font
          opacity: enabled ? 1.0 : 0.3
          color: copyIcon.down ? Qt.lighter("deepskyblue") : "deepskyblue"
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          elide: Text.ElideRight
      }
      background: Rectangle{
          anchors.fill: parent
          color: "transparent"
      }
      onClicked: {
          fileEditMode = "copy"
          selectMode = false
      }
  }
  ToolButton {
      id: cutIcon
      text: "\uF0C4"
      font.family:"fontawesome"
      font.pixelSize: 40
      enabled: selectMode
      anchors.verticalCenter: parent.verticalCenter
      contentItem: Text {
          text: cutIcon.text
          font: cutIcon.font
          opacity: enabled ? 1.0 : 0.3
          color: cutIcon.down ?  Qt.lighter("deepskyblue") : "deepskyblue"
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          elide: Text.ElideRight
      }
      background: Rectangle{
          anchors.fill: parent
          color: "transparent"
      }
      onClicked: {
          fileEditMode = "cut"
          selectMode = false

      }
  }
  ToolButton {
      id: pasteIcon
      text: "\uF133"
      font.family:"fontawesome"
      font.pixelSize: 40
      anchors.verticalCenter: parent.verticalCenter
      contentItem: Text {
          text: pasteIcon.text
          font: pasteIcon.font
          opacity: enabled ? 1.0 : 0.3
          color: pasteIcon.down ?  Qt.lighter("deepskyblue") : "deepskyblue"
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          elide: Text.ElideRight
      }
      background: Rectangle{
          anchors.fill: parent
          color: "transparent"
      }
      onClicked: {
              for (var i = 0; i < selectedItemList.length; i++) {
                  if (fileEditMode === "copy" ) {
                      fileManager.copyFile(selectedItemList[i], folderModel.folder + "/" + selectedFileList[i])
                  }
                   else if (fileEditMode === "cut"){
                      fileManager.cutFile(selectedItemList[i], folderModel.folder + "/" + selectedFileList[i], "cut")
                  }
          }
      }
  }

  Rectangle {width: 1; height: 100; color: Qt.lighter(mainColor) }

  ToolButton {
      id: newFolderIcon
      text: "\uF07B"
      font.family:"fontawesome"
      font.pixelSize: 40
      anchors.verticalCenter: parent.verticalCenter
      contentItem: Text {
          text: newFolderIcon.text
          font: newFolderIcon.font
          opacity: enabled ? 1.0 : 0.3
          color: newFolderIcon.down ?  Qt.lighter("gold") : "gold"
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          elide: Text.ElideRight
      }
      background: Rectangle{
          anchors.fill: parent
          color: "transparent"
      }
      onClicked: {
           dialogNewFolder.mode = "newfolder"
          dialogNewFolder.open()
      }
  }
  ToolButton {
      id: renameIcon
      text: "\uF040"
      font.family:"fontawesome"
      font.pixelSize: 40
      enabled: selectMode

      anchors.verticalCenter: parent.verticalCenter
      contentItem: Text {
          text: renameIcon.text
          font: renameIcon.font
          opacity: enabled ? 1.0 : 0.3
          color: renameIcon.down ?  Qt.lighter("gold") : "gold"
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          elide: Text.ElideRight
      }
      background: Rectangle{
          anchors.fill: parent
          color: "transparent"
      }
      onClicked: {
          dialogNewFolder.mode = "rename"
          dialogNewFolder.open()


      }
  }

   Rectangle {width: 1; height: 100; color: Qt.lighter(mainColor) }
   ToolButton {
       id: selectAllIcon
       text: "\uF009"
       font.family:"fontawesome"
       font.pixelSize: 30
       anchors.verticalCenter: parent.verticalCenter
       contentItem: Text {
           text: selectAllIcon.text
           font: selectAllIcon.font
           opacity: enabled ? 1.0 : 0.3
           color: selectAllIcon.down ?  Qt.lighter("cadetblue") : "cadetblue"
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
           elide: Text.ElideRight
       }
       background: Rectangle{
           anchors.fill: parent
           color: "transparent"
       }
       onClicked: {
          saveDialog.open()

       }
   }

   ToolButton {
       id: selectNoneIcon
       text: "\uF009"
       font.family:"fontawesome"
       font.pixelSize: 30
       anchors.verticalCenter: parent.verticalCenter
       contentItem: Text {
           text: selectNoneIcon.text
           font: selectNoneIcon.font
           opacity: enabled ? 1.0 : 0.3
           color: selectNoneIcon.down ?  Qt.lighter("darkgrey") : "darkgrey"
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
           elide: Text.ElideRight
       }
       background: Rectangle{
           anchors.fill: parent
           color: "transparent"
       }
       onClicked: {
          saveDialog.open()

       }
   }

   Rectangle {width: 1; height: 100; color: Qt.lighter(mainColor) }


  ToolButton {
      id: removeIcon
      text: "\uF014"
      font.family:"fontawesome"
      font.pixelSize: 40
      anchors.verticalCenter: parent.verticalCenter


      contentItem: Text {
          text: removeIcon.text
          font: removeIcon.font
          opacity: enabled ? 1.0 : 0.3
          color: removeIcon.down ? Qt.lighter("orangered") : "orangered"
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          elide: Text.ElideRight
      }
      background: Rectangle{
          anchors.fill: parent
          color: "transparent"


      }
      onClicked: {
          for (var i = 0; i < selectedItemList.length; ++i) {
              fileManager.removeFile(selectedItemList[i])
          }
      }
  }


  }



}



