import QtQuick 2.9
import QtQuick.Controls 2.1


Row{
   anchors.fill: parent
   leftPadding: 5
   spacing: 10

   ToolButton {
       id: homeIcon
       text: "\uF015"
       font.family:"fontawesome"
       font.pixelSize: 25
       anchors.verticalCenter: parent.verticalCenter
       contentItem: Text {
           text: homeIcon.text
           font: homeIcon.font
           opacity: enabled ? 1.0 : 0.3
           color: homeIcon.down ? "lightgray" : "white"
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
           elide: Text.ElideRight
       }
       background: Rectangle{
           anchors.fill: parent
           color: "transparent"

       }
       onClicked: {
           currentAddress = rootAddress

       }
   }

    ToolButton {
        id: backwardIcon
        text: "\uF060"
        font.family:"fontawesome"
        font.pixelSize: 20
        anchors.verticalCenter: parent.verticalCenter
        //enabled: folderModel.folder === "file:///d:/BESMAKCODE/build-test-Desktop_Qt_5_15_2_MinGW_32_bit-Debug/rootFolder"
        contentItem: Text {
            text: backwardIcon.text
            font: backwardIcon.font
            opacity: enabled ? 1.0 : 0.3
            color: backwardIcon.down ? "lightgray" : "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle{
            anchors.fill: parent
            color: "transparent"

        }
        onClicked: {
            if (folderModel.folder !== rootAddress){
                folderModel.folder = folderModel.parentFolder
                currentAddress = folderModel.folder
                //currentAddress = currentAddress.replace("file:///D:/BESMAKCODE/build-test-Desktop_Qt_5_15_2_MinGW_32_bit-Debug/", "")
            }
            console.log(folderModel.folder)

        }
    }

    ListView{
        height: 30
        width: parent.width - 330
        model: navigationModel
        orientation: ListView.Horizontal
        anchors.verticalCenter: parent.verticalCenter
        Rectangle{id: backgroundRecnavigationBar; anchors.fill: parent; color: "transparent"; border.color: borderColor }

        delegate: Button{
            id: navBtn
            height: 30
            implicitWidth: text.width + 10
            background: Rectangle {
                       implicitWidth: parent.width
                       implicitHeight: parent.height
                       color: navBtn.down ? "darkgrey" : "transparent"
                   }
            Row{
                spacing: 5
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: 5
                Text {
                    id: text
                    text: "  " + name
                    font.family:"fontawesome"
                    font.bold: true
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Text {
                    text: "\uF054"
                    font.family:"fontawesome"
                    color: "white"
                    font.pixelSize: 7
                    anchors.verticalCenter: parent.verticalCenter

                }
            }

            onClicked: {
                console.log("count Start " , navigationModel.count, "index " , index)
                var maxStep = navigationModel.count

                for (var i = 0; i < maxStep - (index+1); i++){
                    navigationModel.remove(navigationModel.count - 1)
                    folderModel.folder = folderModel.parentFolder
                }

                console.log("count after " , navigationModel.count)
                 console.log("step " ,  navigationModel.count - (index+1))
            }

        }
    }


//    TextField {
//        id: addressBar
//        placeholderText: currentAddress.replace("file:///", "")
//        placeholderTextColor: "white"

//        height: 30
//        width: parent.width - 330
//        anchors.verticalCenter: parent.verticalCenter


//        background: Rectangle {
//            anchors.fill: parent
//            color: "transparent"
//            border.color: "gray"
//        }
//    }
    TextField {
        id: searchFeild
        placeholderText: "Search" //currentAddress.replace("file:///D:/BESMAKCODE/build-test-Desktop_Qt_5_15_2_MinGW_32_bit-Debug/", "")
        placeholderTextColor: "white"
        color: "white"

        height: 30
        width: 220
        anchors.verticalCenter: parent.verticalCenter


        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
            //opacity: addressBar.focus ? 1 : .4
            border.color: "gray"

        }

        MouseArea{
            width: 50
            height: parent.height
            anchors.right: parent.right
            Text {
                text: "Date"
                color: "cyan"
                anchors.centerIn: parent

            }
            onClicked: datePopup.open()
        }


    }



}







