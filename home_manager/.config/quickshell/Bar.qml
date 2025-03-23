import Quickshell
import Quickshell.Io
import QtQuick

Scope {    
    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            height: 32

            color: Colors.bg_dim

            ClockWidget {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 40
            }
        }
    }
}