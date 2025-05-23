import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

import uk.co.piggz.amazfish 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {

        Row {
            spacing: 10
            Button { text: "Play"; onClicked: controller.play() }
            Button { text: "Pause"; onClicked: controller.pause() }
            Button { text: "Play/Pause"; onClicked: controller.playPause() }
            Button { text: "Next"; onClicked: controller.next() }
            Button { text: "Previous"; onClicked: controller.previous() }
            Button { text: "Vol+"; onClicked: controller.volumeUp() }
            Button { text: "Vol-"; onClicked: controller.volumeDown() }
        }

        Label { id: statusLabel; }
        Label { id: titleLabel; text: controller.title }
        Label { id: albumLabel; text: controller.album }
        Label { id: albumArtLabel; text: controller.albumArt }
        Label { id: artistLabel; text: controller.artist }
        Label { id: volumeLabel }
        Label { id: serviceLabel }
        Label { id: durationLabel; text: controller.duration }
        Label { id: shuffleLabel }
        Label { id: repeatLabel }

    }


    MusicControler {
        id: controller;

        function translateStatus(st) {
            var arr = [];
            arr[MusicControler.StatusNoPlayer] = "No player";
            arr[MusicControler.StatusStopped] = "Stopped";
            arr[MusicControler.StatusPaused] = "Paused";
            arr[MusicControler.StatusPlaying] = "Playing";
            return arr[st] || "Unknown";
        }

        onStatusChanged: statusLabel.text = translateStatus(status())
        onServiceChanged: serviceLabel.text = "Service: " + service()
        onRepeatChanged: repeatLabel.text = "Repeat: " + repeat()



        onMetadataChanged: {
            console.log(JSON.stringify(metadata(),0, 2))
        }


    }
}
