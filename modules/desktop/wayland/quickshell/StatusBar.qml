pragma ComponentBehavior: Bound

import QtQuick.Layouts
import QtQuick

RowLayout {
    id: bar

    spacing: 8

    property var stats
    property color textColor
    property int fontSize
    property string fontFamily

    component StatusText: Text {
        color: bar.textColor

        font {
            pixelSize: bar.fontSize
            family: bar.fontFamily
        }
    }

    StatusText {
        text: bar.stats.kernelVersion
    }

    Divider {
        colorFg: bar.textColor
    }

    StatusText {
        text: "CPU " + bar.stats.cpuUsage + "%"
    }

    Divider {
        colorFg: bar.textColor
    }

    StatusText {
        text: "MEM " + bar.stats.memUsage + "%"
    }

    Divider {
        colorFg: bar.textColor
    }

    StatusText {
        text: "DISK " + bar.stats.diskUsage + "%"
    }

    Divider {
        colorFg: bar.textColor
    }

    StatusText {
        text: "VOL " + bar.stats.volumeLevel + "%"
    }

    Divider {
        colorFg: bar.textColor
    }

    StatusText {
        id: clockText

        text: Qt.formatDateTime(new Date(), "ddd dd hh:mm")

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: clockText.text = Qt.formatDateTime(new Date(), "ddd dd hh:mm")
        }
    }
}
