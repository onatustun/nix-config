pragma ComponentBehavior: Bound

import QtQuick.Layouts
import QtQuick
import Quickshell.Hyprland

RowLayout {
    id: wsRoot

    spacing: 0
    Layout.alignment: Qt.AlignVCenter

    property color activeColor
    property color inactiveColor
    property color textColor
    property color activeTextColor
    property int fontSize
    property string fontFamily

    Repeater {
        model: 10

        Rectangle {
            required property int index
            readonly property int wsId: index + 1

            implicitWidth: 23
            implicitHeight: 25

            color: "transparent"

            property var workspace: Hyprland.workspaces.values.find(ws => ws.id === wsId) ?? null
            property bool isActive: Hyprland.focusedWorkspace?.id === wsId
            property bool hasWindows: workspace !== null

            visible: hasWindows

            Rectangle {
                anchors.fill: parent
                color: parent.isActive ? wsRoot.activeColor : "transparent"
            }

            Text {
                text: parent.wsId
                color: parent.isActive ? wsRoot.activeTextColor : wsRoot.textColor

                font {
                    pixelSize: wsRoot.fontSize
                    family: wsRoot.fontFamily
                    bold: true
                }

                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + parent.wsId)
            }
        }
    }
}
