import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

import uk.co.piggz.amazfish 1.0

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Hello World")

    Column {

        Row {
            spacing: 10
            Button { text: qsTr("Play"); onClicked: controller.play() }
            Button { text: qsTr("Pause"); onClicked: controller.pause() }
            Button { text: qsTr("Play/Pause"); onClicked: controller.playPause() }
            Button { text: qsTr("Next"); onClicked: controller.next() }
            Button { text: qsTr("Previous"); onClicked: controller.previous() }
            Button { text: qsTr("Vol+"); onClicked: controller.volumeUp() }
            Button { text: qsTr("Vol-"); onClicked: controller.volumeDown() }
        }

        Grid {
            columns: 2
            columnSpacing: 20
            rowSpacing: 5

            Label { text: qsTr("Status") }
            Label { id: statusLabel; text: " " }

            Label { text: qsTr("Title") }
            Label { id: titleLabel; text: controller.title + " " }

            Label { text: qsTr("Artist") }
            Label { id: artistLabel; text: controller.artist + " " }

            Label { text: qsTr("Album") }
            Label { id: albumLabel; text: controller.album + " " }

            Label { text: qsTr("albumArt") }
            Label { id: albumArtLabel; text: controller.albumArt + " " }

            Label { text: qsTr("Volume") }
            Label { id: volumeLabel; text: controller.volume }

            Label { text: qsTr("Duration") }
            Label { id: durationLabel; text: formatDuration(controller.duration) }

            Label { text: qsTr("Shuffle") }
            Label { id: shuffleLabel; text: controller.shuffle }

            Label { text: qsTr("Repeat") }
            Label { id: repeatLabel; text: " " }

            Label { text: qsTr("Service") }
            Label { id: serviceLabel; text: " " }

        }

    }


    MusicControler {
        id: controller;

        function translateStatus(st) {
            var arr = [];
            arr[MusicControler.StatusNoPlayer] = qsTr("No player");
            arr[MusicControler.StatusStopped] = qsTr("Stopped");
            arr[MusicControler.StatusPaused] = qsTr("Paused");
            arr[MusicControler.StatusPlaying] = qsTr("Playing");
            return arr[st] || qsTr("Unknown");
        }

        function translateRepeat(r) {
            var arr = [];
            arr[MusicControler.RepeatNone] = qsTr("None");
            arr[MusicControler.RepeatTrack] = qsTr("Track");
            arr[MusicControler.RepeatPlaylist] = qsTr("Playlist");
            return arr[r] || qsTr("Unknown");
        }


        onStatusChanged: statusLabel.text = translateStatus(status()) + " "
        onServiceChanged: serviceLabel.text = service()
        onRepeatChanged: repeatLabel.text = translateRepeat(repeat()) + " "

        onMetadataChanged: {
            console.log(JSON.stringify(metadata(),0, 2))
        }

    }

    function formatDuration(d) {
        return Math.round(d/60000) + ":" + (d % 60000)/1000
    }
}
