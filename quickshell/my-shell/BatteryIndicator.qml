import Quickshell.Io
import QtQuick

Rectangle {
  id: battery_indicator
  property string battery_level

  color: Qt.rgba(0, 0, 0, 0.5)

  implicitWidth: 50
  implicitHeight: 20

  radius: 5

  FileView {
    id: file_view

    watchChanges: true
    path: "/sys/class/power_supply/BAT0/capacity"

    function set_formatted_battery_level(level: string) {
      battery_indicator.battery_level = `${level.replace(/\n/g, '')}%`
    }

    onLoaded: set_formatted_battery_level(text())
    onFileChanged: set_formatted_battery_level(text())
  }

  Text {
    anchors.centerIn: parent

    color: "white"
    text: battery_indicator.battery_level
  }

}
