import QtQuick 2.15

Rectangle{
    width: parent.width
    height: 1
    anchors.horizontalCenter: parent.horizontalCenter

    property color lineColor
    gradient: Gradient {
        GradientStop { position: 0.0; color: "transparent" }
        GradientStop { position: 0.33; color: lineColor }
        GradientStop { position: 0.66; color: lineColor }
        GradientStop { position: 1.0; color: "transparent" }
        orientation: Gradient.Horizontal

    }
}
