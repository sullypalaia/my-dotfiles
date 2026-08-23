pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Hyprland

RowLayout {
  id: row

  anchors.left: parent.left
  anchors.verticalCenter: parent.verticalCenter
  anchors.leftMargin: 5

  required property int workspace_width

  Repeater {
    model: Hyprland.workspaces

    Rectangle {
      id: rect

      required property var modelData
      required property int index

      implicitWidth: row.workspace_width
      implicitHeight: 20

      color: modelData.active ? Qt.rgba(0, 0, 0, 0.5) : Qt.rgba(0, 0, 0, 0.2)

      Text {
        id: workspace_nums
        anchors.centerIn: parent
        color: "white"
        text: rect.modelData.id
      }

      radius: 5
    }
  }
}
