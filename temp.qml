Rectangle {
    id: titleRec
    width: parent.width
    height: 50
    color: "#4b626c"
    visible: selectMode
    MyMenu{id: menu; visible: selectMode}
    NumberAnimation on height {
        running: selectMode
        from: 0; to: 50
        duration: 200
    }
    Text {
        id: titletxt
        text: "Test items"
        visible: !menu.visible
        anchors.verticalCenter: parent.verticalCenter
        leftPadding: 20
        font.bold: true
        font.pixelSize: 20
        color: "white"

    }

}
