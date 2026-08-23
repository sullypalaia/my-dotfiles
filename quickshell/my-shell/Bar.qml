import Quickshell
import QtQuick
import QtQuick.Layouts

Variants {
  model: Quickshell.screens

  PanelWindow {
    required property var modelData    

    screen: modelData

    color: "transparent"

    anchors {
      top: true
      left: true
      right: true
    }

    implicitHeight: 30

    margins {
      left: 20
      right: 20
    }

    Workspaces {
      spacing: 5
      workspace_width: 50
    }

    Time {}

    RowLayout {
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter

      BatteryIndicator {}
      AudioIndicator {}
      NetworkIndicator {}
    }
  }
}
