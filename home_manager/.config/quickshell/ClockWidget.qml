import Quickshell
import QtQuick

Rectangle {
    id: clock
    width: 62
    height: 28
    radius: 2

    color: Colors.bg_aqua
    anchors.margins: 5
    border.width: 4

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            clock.y -= 8
            clock.border.bottom.width = 0
        }

        onExited: {
            clock.y += 8
            clock.border.bottom.width = 4
        }
    }

    Rectangle {
        id: innerRect
        width: parent.width
        height: parent.height - 4
        color: Colors.aqua
        anchors.top: parent.top
        radius: 2
    }

    Text {
        id: textItem
        text: '󰥔 ' + Time.time
        color: Colors.bg_dim
        font.pointSize: 10
        font.family: "Hack Nerd Font"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        padding: 3
    }
}

