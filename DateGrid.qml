import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1


Popup {
    id: datePopUp
    width: 700
    height: 500



    Row{
        anchors.fill: parent
        spacing: 10





        Calendar {
            id: calendar
            width: parent.width - 150
            height: parent.height - applyBtn.height - 5
            frameVisible: true
            focus: true
            property var startDate: undefined //styleData.date
            property var stopDate: undefined //styleData.date

            style: CalendarStyle {
                dayDelegate: Item {
                    property color sameMonthDateTextColor: "#444"
                    property color selectedDateColor: "#3778d0"
                    property color selectedDateTextColor: "white"
                    property color differentMonthDateTextColor: "#bbb"
                    property color invalidDatecolor: "#dddddd"
                    property var dateOnFocus: styleData.date

                    Rectangle {
                        anchors.fill: parent
                        border.color: "transparent"
                        color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"
                    }

                    Rectangle{
                        id: fl
                        anchors.fill: parent
                        property bool flag: false
                        color: ((dateOnFocus>calendar.startDate) && (dateOnFocus< calendar.stopDate))?"#55555555":
                                                                                                      (calendar.startDate !==undefined && dateOnFocus.getTime()===calendar.stopDate.getTime())?"#3778d0":"transparent"
                    }


                    MouseArea{
                        anchors.fill: parent
                        propagateComposedEvents: true
                        onPressed: {
                            //calendar.startDate = styleData.date

                            if(calendar.stopDate===undefined){
                                calendar.stopDate=styleData.date
                            }
                            else if(calendar.startDate=== undefined){
                                calendar.startDate=styleData.date
                            }
                            else{
                                calendar.stopDate=styleData.date
                                calendar.startDate= undefined
                            }

                            if(calendar.stopDate<=calendar.startDate){
                                calendar.stopDate=styleData.date
                                calendar.startDate= undefined
                            }
                            mouse.accepted = false

                        }
                    }


                    Label {
                        id: dayDelegateText
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        color: "black"
                    }
                }
            }
        }


        Column{
            spacing: 5
            width: 120
            height: parent.height

            MouseArea{
                width: 120
                height: 40
                Text {
                    text: "Today"
                    anchors.centerIn: parent
                }
                onClicked: console.log(calendar.startDate)
            }
              SeparatorLine{ lineColor: "lightgray"}
              MouseArea{
                  width: 120
                  height: 40
                  Text {
                      text: "Yesterday"
                      anchors.centerIn: parent
                  }
                  onClicked: console.log(calendar.startDate)
              }
                SeparatorLine{ lineColor: "lightgray"}
                MouseArea{
                    width: 120
                    height: 40
                    Text {
                        text: "This week"
                        anchors.centerIn: parent
                    }
                    onClicked: console.log(calendar.startDate)
                }
                  SeparatorLine{ lineColor: "lightgray"}
                  MouseArea{
                      width: 120
                      height: 40
                      Text {
                          text: "Last week"
                          anchors.centerIn: parent
                      }
                      onClicked: console.log(calendar.startDate)
                  }
                    SeparatorLine{ lineColor: "lightgray"}
                    MouseArea{
                        width: 120
                        height: 40
                        Text {
                            text: "This month"
                            anchors.centerIn: parent
                        }
                        onClicked: console.log(calendar.startDate)
                    }
                      SeparatorLine{ lineColor: "lightgray"}
                      MouseArea{
                          width: 120
                          height: 40
                          Text {
                              text: "Last month"
                              anchors.centerIn: parent
                          }
                          onClicked: console.log(calendar.startDate)
                      }
                        SeparatorLine{ lineColor: "lightgray"}
                        MouseArea{
                            width: 120
                            height: 40
                            Text {
                                text: "This year"
                                anchors.centerIn: parent
                            }
                            onClicked: console.log(calendar.startDate)
                        }
                          SeparatorLine{ lineColor: "lightgray"}
                          MouseArea{
                              width: 120
                              height: 40
                              Text {
                                  text: "Last year"
                                  anchors.centerIn: parent
                              }
                              onClicked: console.log(calendar.startDate)
                          }
                            SeparatorLine{ lineColor: "lightgray"}
        }



    }



    Button{
        id: applyBtn
        width: parent.width - 150
        height: 30
        anchors.bottom: parent.bottom
        text: "Apply"
        onClicked: {
            datePopUp.close()
            console.log(calendar.startDate, calendar.stopDate)
        }
    }
}
