import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Item {
    id: root
    height: 50
    width: 100

    property alias text: label.text
    property alias textx: label.x
    property alias iconSource: icon.source
    property bool selected: false

    property color normalColor: "#8ec9ff"
    property color selectedColor: "#007fff"
    property color normalTextColor: "#5D7FA9"
    property color selectedTextColor: "#fff"

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
            onClicked: {
                root.selected = !root.selected
                root.selectedChanged(root.selected)
            }
            cursorShape: Qt.PointingHandCursor
        }
        Item {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height

            Image {
                id: icon
                width: root.iconSource !== "" ? 22 : 0
                height: root.iconSource !== "" ? 22 : 0
                fillMode: Image.PreserveAspectFit
                source: root.iconSource
                anchors.verticalCenter: parent.verticalCenter
                x: 0
            }
            Text {
                id: label
                text: "按钮"
                color: root.selected ? root.selectedTextColor : root.normalTextColor
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
                x: root.iconSource !== "" ? icon.width : (parent.width - width) / 2
            }
        }
    }
}
