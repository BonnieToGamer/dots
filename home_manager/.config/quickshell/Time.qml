pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton{
    property var date: new Date()
    property string time: (date.getHours().toString().padStart(2, '0') + ':' + date.getMinutes().toString().padStart(2, '0'))

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: date = new Date()
    }
}