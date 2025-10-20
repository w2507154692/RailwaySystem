import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 400; height: 260
    minimumWidth: 400; minimumHeight: 260;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    Rectangle {
        id:root
        width: parent.width
        height: parent.height
        radius: 14
        color: "#ffffff"
        border.color: "#666"
        border.width: 2

        // 顶部渐变标题栏
        Header{
            titleFontSize: 18
            id:titleBar
            width: parent.width - 4
            height: 45
            anchors.top: parent.top
            anchors.topMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            title: "重置密码"

        }

        // 内容区
        ColumnLayout {
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.top: titleBar.bottom
            anchors.topMargin: 28
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 28

            // 用户名
            RowLayout {
                Layout.fillWidth: true
                spacing: 16
                Label {
                    text: "输入新密码："
                    font.pixelSize: 14
                    Layout.preferredWidth: 70
                    color: "#666"
                    horizontalAlignment: Text.AlignRight
                }

                TextField {
                    id: usernameField
                    Layout.fillWidth: true
                    height: 32
                    font.pixelSize: 14
                    background: Rectangle {
                        radius: 5
                        border.color: "#999"
                        border.width: 1
                        color: "#fff"
                    }
                }
            }

            // 密码
            RowLayout {
                Layout.fillWidth: true
                spacing: 16
                Label {
                    text: "确认密码："
                    font.pixelSize: 14
                    color: "#444"
                    Layout.preferredWidth: 70
                    horizontalAlignment: Text.AlignRight
                }
                TextField {
                    id: passwordField
                    Layout.fillWidth: true
                    height: 32
                    echoMode: TextInput.Password
                    font.pixelSize: 14
                    background: Rectangle {
                        radius: 5
                        border.color: "#999"
                        border.width: 1
                        color: "#fff"
                    }
                }
            }

            // 按钮区
            RowLayout {
                Layout.fillWidth: true
                Item { Layout.preferredWidth: 22}
                // 确认按钮
                CustomButton{
                    text: "确认"
                    height: 26
                    width:100
                    fontSize:14
                }

                Item { Layout.fillWidth: true }

                // 取消按钮
                CustomButton{
                    text: "取消"
                    height: 26
                    width:100
                    fontSize:14
                    customColor: "#e6e6e6"
                    textColor: "#666"
                    pressedTextColor: "#000"
                    pressedColor: "#b3b3b3"

                }

                Item { Layout.preferredWidth: 22}
            }
        }
    }
}
