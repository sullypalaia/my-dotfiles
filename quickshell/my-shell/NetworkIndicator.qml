import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
  id: network_indicator
  property string network_status_text

  color: Qt.rgba(0, 0, 0, 0.5)

  implicitWidth: 120
  implicitHeight: 20

  radius: 5

  function set_network_status(state: string) {
    if (state == "up\n")
      network_indicator.network_status_text = "Connected "
    else
      network_indicator.network_status_text = "Disconnected 󰖪"
  }

  FileView {
    id: file_view

    watchChanges: true
    path: "/sys/class/net/wlan0/operstate"

    onLoaded: network_indicator.set_network_status(text())
  }

  Timer {
    interval: 2000
    running: true
    repeat: true

    onTriggered: {
      file_view.path = ""
      file_view.path = "/sys/class/net/wlan0/operstate"
    }
  }

  Text {
    anchors.centerIn: parent

    color: "white"

    text: network_indicator.network_status_text
  }
}
