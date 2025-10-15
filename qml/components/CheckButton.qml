import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item {
    id: root
    width: 34
    height: 34

    property bool checked: false
    signal toggled(bool checked)

    // 阴影效果
    DropShadow {
        anchors.fill: circle
        source: circle
        horizontalOffset: 2
        verticalOffset: 2
        radius: 8
        color: "#B0B0B0"
        samples: 16
    }

    // 按钮主体
    Rectangle {
        id: circle
        anchors.centerIn: parent
        width: 28
        height: 28
        radius: width / 2
        color: "#F3F5F7"
        border.color: "#DDD"
        border.width: 1

        // 选中圆
        Rectangle {
            anchors.centerIn: parent
            width: 16
            height: 16
            radius: width / 2
            color: root.checked ? "#67B7FF" : "transparent"
            visible: root.checked
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                root.checked = !root.checked
                root.toggled(root.checked)
            }
        }
    }
}
