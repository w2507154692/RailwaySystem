import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    height: 40
    width: 120

    //确认时，文字"#fff" : "#5D7FA9"，按钮："#007fff" : "#8ec9ff"
    //取消时，文字"#000" : "#666",按钮："#b3b3b3" : "#e6e6e6"


    property alias text: label.text
    property color customColor: "#8ec9ff"      // 默认色，可外部覆盖
    property color pressedColor: "#007fff"     // 按下时色
    property color textColor: "#5D7FA9"           // 默认文字色
    property color pressedTextColor: "#fff" // 按下时文字色
    property int fontSize: 18
    property int borderRadius: 8
    property int borderWidth: 0
    property color borderColor: "transparent"
    property bool fontBold: false
    signal clicked

    //阴影
    Rectangle {
        x: 2
        y: 2
        width: parent.width
        height: parent.height
        radius: root.borderRadius
        color: "#cecece"
        opacity: 1
        z: -1
    }

    Rectangle {
        id: menubutton
        anchors.fill: parent
        border.width: root.borderWidth
        border.color: root.borderColor
        radius: root.borderRadius
        color: mouseArea.pressed ? root.pressedColor : root.customColor

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: root.clicked()
            cursorShape: Qt.PointingHandCursor
        }

        Text {
            id: label
            text: "按钮"
            color: mouseArea.pressed ? root.pressedTextColor : root.textColor
            font.pixelSize: root.fontSize
            font.bold: root.fontBold
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
