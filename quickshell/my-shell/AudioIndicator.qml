import Quickshell.Services.Pipewire
import QtQuick

Rectangle {
  id: volume_indicator
  property real volume_level: sink.audio.volume

  color: Qt.rgba(0, 0, 0, 0.5)

  implicitWidth: 50
  implicitHeight: 20

  radius: 5

  readonly property PwNode sink: Pipewire.defaultAudioSink

  PwObjectTracker {
    objects: [volume_indicator.sink]
  }

  Text {
    anchors.centerIn: parent

    color: "white"
    text: {
      var volume_text = (volume_indicator.volume_level * 100.0).toFixed(0);

      if (volume_indicator.volume_level > 0.5)
        volume_text += " \uf028";
      else if (volume_indicator.volume_level > 0)
        volume_text += " \uf027";
      else
        volume_text += " ";

      return volume_text
    }
  }
}
