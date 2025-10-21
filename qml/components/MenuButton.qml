import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item {
    id: root
    height: 80
    width: 200

    property alias text: label.text
    property alias textColor: label.color
    property alias textSize: label.font.pixelSize
    property alias iconSource: icon.source
    property bool selected: false

    property color normalColor: "#70B9FF"
    property color hoverColor: "#2379FF"
    property color pressColor: "#1359FF"
    property color selectedColor: "#3399FF"
    property color normalTextColor: "white"

    // 阴影层
    DropShadow {
        anchors.fill: menubutton
        source: menubutton
        color: "#8B8989"
        radius: 12
        samples: 17
        horizontalOffset: 2
        verticalOffset: 2
    }

    Rectangle {
        id: menubutton
        anchors.fill: parent
        radius: 8
        color: root.selected ? root.selectedColor : root.normalColor

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onEntered: {
                menubutton.color = root.hoverColor
            }
            onExited: {
                menubutton.color = root.normalColor
            }
            onPressed: {
                menubutton.color = root.pressColor
            }
            onReleased: {
                menubutton.color = root.hoverColor
            }
            onClicked: {
                // 登录逻辑
            }
        }
        RowLayout {
            anchors.fill: parent

            Item {
                Layout.preferredWidth: 50
                Layout.preferredHeight: 50
                // id: icon
                Image {
                    id: icon
                    width: parent.width
                    height: parent.height
                    fillMode: Image.PreserveAspectFit
                    source: root.iconSource
                }
            }

            Text {
                id: label
                Layout.fillWidth: true
                Layout.leftMargin: -10
                Layout.rightMargin: 10
                horizontalAlignment: Text.AlignHCenter
                text: "按钮"
                color: root.normalTextColor
                font.pixelSize: 22
            }
        }

        // Item {
        //     anchors.centerIn: parent
        //     width: parent.width
        //     height: parent.height

        //     Image {
        //         id: icon
        //         fillMode: Image.PreserveAspectFit
        //         source: root.iconSource
        //         anchors.verticalCenter: parent.verticalCenter
        //         x: 0
        //     }
        //     Text {
        //         id: label
        //         text: "按钮"
        //         color: root.selected ? root.selectedTextColor : root.normalTextColor
        //         font.pixelSize: 16
        //         anchors.verticalCenter: parent.verticalCenter
        //         anchors.horizontalCenter: parent.horizontalCenter
        //     }
        // }
    }
}
