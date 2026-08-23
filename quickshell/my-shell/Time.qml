import QtQuick
import Quickshell

Item {
  anchors.centerIn: parent

  SystemClock {
    id: clock
    precision: SystemClock.Minutes 
  }
  
  Rectangle {
    anchors.centerIn: parent

    color: Qt.rgba(0, 0, 0, 0.5)

    implicitWidth: 50 
    implicitHeight: 20

    radius: 5

    Text {
      anchors.centerIn: parent

      color: "white"
      text: Qt.formatDateTime(clock.date, "hh:mm")
    }
  }
}
