import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    id: mainWindow
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"
    flags: Qt.FramelessWindowHint

    Rectangle {
        width: parent.width
        height: parent.height
        // color: "pink"

        MouseArea {
           anchors.fill: parent
           // 定义拖动
           property real clickX: 0
           property real clickY: 0

           onPressed: {
               clickX = mouse.x;
               clickY = mouse.y;
           }
           onPositionChanged: {
               // 拖动窗口
               mainWindow.x += mouse.x - clickX;
               mainWindow.y += mouse.y - clickY;
           }
       }

        // 头部组件
        Header {
            id: header
            width: parent.width
            title: "修改个人信息"
            onCloseClicked: {
                // 关闭逻辑，例如 parent.visible = false
            }
        }

        // 表单内容
        ColumnLayout {
            id: column
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 22

            // 姓名
            Row {
                spacing: 16
                height: 40
                Text {
                    text: "姓名："
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignRight
                    color: "#666"
                    width: 80 // 统一宽度
                    verticalAlignment: Text.AlignVCenter
                }
                TextField {
                    id: nameField
                    width: 320
                    height: 36
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    placeholderText: "请输入姓名"
                    padding: 5
                    background: Rectangle {
                        color: "transparent"
                        border.color: "#999"
                        border.width: 1
                        radius: 6
                    }
                }
            }

            // 联系方式
            Row {
                spacing: 16
                height: 40
                Text {
                    text: "联系方式："
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignRight
                    color: "#666"
                    width: 80 // 统一宽度
                    verticalAlignment: Text.AlignVCenter
                }
                TextField {
                    id: contactField
                    width: 320
                    height: 36
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    placeholderText: "请输入联系方式"
                    background: Rectangle {
                        color: "transparent"
                        border.color: "#999"
                        border.width: 1
                        radius: 6
                    }
                }
            }

            // 身份证号
            Row {
                spacing: 16
                height: 40
                Text {
                    text: "身份证号："
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignRight
                    color: "#666"
                    width: 80 // 统一宽度
                    verticalAlignment: Text.AlignVCenter
                }
                TextField {
                    id: idField
                    width: 320
                    height: 36
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    placeholderText: "请输入身份证号"
                    background: Rectangle {
                        color: "transparent"
                        border.color: "#999"
                        border.width: 1
                        radius: 6
                    }
                }
            }
        }

        // 底部按钮区
        Row {
            id: row
            anchors.bottom: column.bottom
            anchors.bottomMargin: -90
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 150

            CustomButton {
                width: 120
                height: 40
                text: "确认"
                anchors.top: parent.top
                anchors.topMargin: 0
                activeFocusOnTab: true
                onClicked: {
                    // 提交逻辑
                }
            }

            CustomButton {
                width: 120
                height: 40
                text: "取消"
                activeFocusOnTab: true
                customColor: "#e6e6e6"
                pressedColor: "#b3b3b3"
                textColor: "#666"
                pressedTextColor: "#000"
                onClicked: {
                    // 取消逻辑
                }
            }
        }

    }
}
