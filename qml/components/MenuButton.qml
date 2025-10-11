import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    height: 50
    width: 100

    property alias text: label.text
    property alias textx: label.x
    property alias iconSource: icon.source
    property bool selected: false

    // 按钮颜色属性
    property color normalColor: "#8ec9ff"      // 未选中颜色
    property color selectedColor: "#007fff"    // 选中颜色

    // 文字颜色属性
    property color normalTextColor: "#5D7FA9"     // 未选中文字色
    property color selectedTextColor: "#fff"// 选中文字色

    // signal selectedChanged(bool selected)

    // 阴影层
    Rectangle {
        x: 2
        y: 2
        width: parent.width
        height: parent.height
        radius: 8
        color: "#cecece"
        opacity: 1
        z: -1
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
                x: root.iconSource !== "" ? icon.width : (parent.width - width) / 2 // 有图标时在图标后，无图标时居中
            }
        }
    }
}
