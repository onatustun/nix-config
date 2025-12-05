import QtQuick
import Quickshell.Io

Item {
    id: stats

    property string kernelVersion: "Linux"
    property int cpuUsage: 0
    property int memUsage: 0
    property int diskUsage: 0
    property int volumeLevel: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0

    Process {
        id: kernelProc
        command: ["uname", "-r"]

        stdout: SplitParser {
            onRead: data => {
                if (data)
                    stats.kernelVersion = data.trim();
            }
        }

        Component.onCompleted: running = true
    }

    Process {
        id: cpuProc

        command: ["sh", "-c", "head -1 /proc/stat"]

        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var parts = data.trim().split(/\s+/);
                var total = (parseInt(parts[1]) || 0) + (parseInt(parts[2]) || 0) + (parseInt(parts[3]) || 0) + (parseInt(parts[4]) || 0) + (parseInt(parts[5]) || 0) + (parseInt(parts[6]) || 0) + (parseInt(parts[7]) || 0);
                var idleTime = (parseInt(parts[4]) || 0) + (parseInt(parts[5]) || 0);

                if (stats.lastCpuTotal > 0) {
                    var totalDiff = total - stats.lastCpuTotal;
                    var idleDiff = idleTime - stats.lastCpuIdle;

                    if (totalDiff > 0)
                        stats.cpuUsage = Math.round(100 * (totalDiff - idleDiff) / totalDiff);
                }

                stats.lastCpuTotal = total;
                stats.lastCpuIdle = idleTime;
            }
        }

        Component.onCompleted: running = true
    }

    Process {
        id: memProc

        command: ["sh", "-c", "free | grep Mem"]

        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var parts = data.trim().split(/\s+/);
                var total = parseInt(parts[1]) || 1;
                var used = parseInt(parts[2]) || 0;
                stats.memUsage = Math.round(100 * used / total);
            }
        }

        Component.onCompleted: running = true
    }

    Process {
        id: diskProc

        command: ["sh", "-c", "df / | tail -1"]

        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var parts = data.trim().split(/\s+/);
                stats.diskUsage = parseInt((parts[4] || "0%").replace('%', '')) || 0;
            }
        }

        Component.onCompleted: running = true
    }

    Process {
        id: volProc

        command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]

        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var match = data.match(/Volume:\s*([\d.]+)/);

                if (match)
                    stats.volumeLevel = Math.round(parseFloat(match[1]) * 100);
            }
        }

        Component.onCompleted: running = true
    }

    Timer {
        interval: 2000
        running: true
        repeat: true

        onTriggered: {
            cpuProc.running = true;
            memProc.running = true;
            diskProc.running = true;
            volProc.running = true;
        }
    }
}
