import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Page {
    width: parent ? parent.width : 740
    height: parent ? parent.height : 640
    id:userManagementPage
    objectName: "qrc:/qml/pages/UserManagement.qml"
    visible: true

    property var userList: [
        { username: "17816936112", password: "12345678987654321", isAdmin: true, locked: false },
        { username: "17816936112", password: "12345678987654321", isAdmin: true, locked: false },
        { username: "17816936112", password: "12345678987654321", isAdmin: true, locked: false },
        { username: "17816936112", password: "12345678987654321", isAdmin: false, locked: false },
        { username: "17816936112", password: "12345678987654321", isAdmin: true, locked: false },
        { username: "17816936112", password: "12345678987654321", isAdmin: false, locked: false },
        { username: "17816936112", password: "12345678987654321", isAdmin: true, locked: false }
    ]

    // 主内容区
    Rectangle {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.leftMargin: 20

            // 用户列表区（改为ListView）
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: userManagementPage.height - 50
                Layout.alignment: Qt.AlignTop

                ListView {
                    id: userListView
                    anchors.fill: parent
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                    model: userList
                    spacing: 30
                    clip: true

                    // 完全自定义滚动条样式
                    ScrollBar.vertical: BasicScrollBar {
                        width: 8
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height - 8
                        policy: ScrollBar.AlwaysOn
                        handleNormalColor: "#a0a0a0"
                        handleLength: 60 // 这里设置想要的长度
                    }

                    delegate: ColumnLayout {
                        width: userListView.width - 20
                        height: userList.height


                        // 用户卡片
                        Rectangle {
                            id: card
                            width: parent.width
                            height: 79
                            radius: 16
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "#cce5ff" }
                                GradientStop { position: 1.0; color: "#8ec9ff" }
                            }

                            //卡片区
                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 20
                                anchors.rightMargin: 40

                                // 左侧信息
                                ColumnLayout {
                                    spacing: 0

                                    // 第一行
                                    RowLayout {
                                        Layout.topMargin: 12
                                        Text {
                                            text: "用户名：" + modelData.username
                                            font.pixelSize: 18
                                            color: "#222"
                                        }
                                    }

                                    // 间隔
                                    Item { Layout.fillHeight: true }

                                    // 第二行
                                    RowLayout {
                                        Layout.bottomMargin: 12
                                        Text {
                                            text: "密码：" + modelData.password
                                            font.pixelSize: 18
                                            color: "#222"
                                        }
                                    }
                                }

                                Item{
                                    Layout.fillWidth: true
                                }

                                Rectangle{
                                    width: 70
                                    height: 30
                                    radius: 4
                                    border.color: "green"
                                    color: "transparent"
                                    visible: modelData.isAdmin   // 只在 isAdmin 为 true 时显示
                                    Text {
                                        text: "管理员"
                                        font.pixelSize: 16
                                        color: "green"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }
                            }
                        }

                        // 操作按钮区
                        RowLayout {
                            Layout.topMargin: 10
                            Layout.leftMargin: 20
                            id: buttonRow
                            Layout.fillWidth: true
                            height: 40
                            spacing: 40

                            CustomButton {
                                text: "重置密码"
                                width: 90
                                height:24
                                fontSize: 15
                                borderRadius: 7
                                buttonType: "confirm"
                            }
                            CustomButton {
                                text: "锁定"
                                width: 70
                                height:24
                                fontSize: 15
                                borderRadius: 7
                                buttonType: "confirm"
                                enabled: !model.locked
                            }
                            CustomButton {
                                text: "解锁"
                                width: 70
                                height:24
                                fontSize: 15
                                borderRadius: 7
                                buttonType: "cancel"
                                enabled: model.locked
                            }

                                Item { Layout.fillWidth: true } // 占位，按钮靠右

                            }


                        //分隔线
                        Rectangle{
                            Layout.topMargin: 10
                            Layout.fillWidth: true
                            Layout.preferredHeight: 2
                            color: "#ccc"
                        }
                    }
                }
            }

            // 搜索框和添加按钮区
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 48
                Layout.topMargin: -15
                spacing: 0

                // 搜索框
                SearchBar{
                    inputHeight: 30
                    width: 300
                    fontSize: 14
                }

                Item { Layout.fillWidth: true }

                // 添加按钮
                Rectangle {
                    width: 38
                    height: 38
                    Layout.alignment: Qt.AlignRight
                    Layout.rightMargin: 30
                    Layout.topMargin: 4

                    Image {
                        source: "qrc:/resources/icon/Add.png" // 换成你的加号图标资源路径
                        anchors.centerIn: parent
                        width: 50
                        height: 50
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
