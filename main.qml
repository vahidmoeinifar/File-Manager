import QtQuick 2.15
import QtQml 2.12
import QtQuick.Controls 2.15
//import Qt.labs.qmlmodels 1.0
import Qt.labs.folderlistmodel 2.2
import io.besmaklab.backend 1.0
import QtQuick.Window 2.3
 import QtQuick.Layouts 1.3

Window {

    property int nameColWidth: 220
    property int dateColWidth: 220
    property int sizeColWidth: 120
    property int previewColWidth: 250
    property bool selectMode: false

    property color mainColor: "#4B4B4B"
    property color topBarColor: "#292A2A"
    property color borderColor: "#b1b1b1"

    property var selectedItemList: []
    property var selectedFileList: []
    property string currentAddress: "file:///D:/"
    property string rootAddress: "file:///D:/"

    property string fileEditMode // "copy" , "cut" , "remove"

    id: root
    width: 800
    height: 500
    minimumWidth: 600
    title: "Export"
    visible: true
    color: mainColor

    FontLoader {
        id: fontawesome
        source: "qrc:/fontawesome-webfont.ttf"
    }

    FileManager {
        id: fileManager
    }



    FolderListModel { id: folderModel
        //folder: currentAddress
        //sortReversed: false
       // showDirs: true
    }

    FolderListModel {
        id: folderModelDIR
        nameFilters: [ "" ]
        showDirs: true
        showFiles: false
    }

    ListModel{
        id: navigationModel
        ListElement {
                name: "root"//rootAddress
            }
    }

    DateGrid{
        id: datePopup
        anchors.centerIn: parent
    }

    DialogNewFolder{id: dialogNewFolder}

    Column {
        width: parent.width
        height: parent.height // - navigationBarRec.height

        Rectangle{
            id: navigationBarRec
            width: parent.width
            height: 40
            color: topBarColor
            SearchFeild { }
        }

        TopMenu{}


        Row{
            width: parent.width
            height: parent.height
            Rectangle{
                width: 200
                height: parent.height
                color: topBarColor
                ListView{
                    width: parent.width
                    height: parent.height
                    model: folderModelDIR
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    delegate: MouseArea{
                        height: 30
                        width: parent.width
                        Row{
                            spacing: 5
                            Text {
                                text: "\uF07B"
                                font.family:"fontawesome"
                                color: folderModelDIR.isFolder(index) ? "gold" : "deepskyblue"
                                font.pixelSize: 25
                            }
                            Text {
                                text: fileName
                                font.family:"fontawesome"
                                color: "white"
                                font.pixelSize: 12
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                    }
                }
            }

            SplitView {
                width: parent.width
                height: parent.height
                orientation: Qt.Horizontal

                ContentTable{
                    SplitView.preferredHeight: parent.height - navigationBarRec.height - 100
                    SplitView.minimumWidth: nameColWidth
                    SplitView.preferredWidth: parent.width - 200
                    SplitView.maximumWidth: nameColWidth + dateColWidth + sizeColWidth
                }


//                Rectangle {
//                    id: previewRec
//                    color: topBarColor
//                    SplitView.preferredWidth: 200
//                    SplitView.preferredHeight: parent.height
//                    Text {
//                        text: "Preview"
//                        anchors.centerIn: parent
//                        color: "white"
//                    }
//                }
            }



        }







    }




}
