import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window{
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        SideBar {
            Layout.preferredWidth: 150
            Layout.fillHeight: true
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            // color: "red"


            Rectangle{
                anchors.topMargin: 18
                anchors.rightMargin: 68
                anchors.bottomMargin: 86
                anchors.fill: parent
                // color: "blue"



                Column {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 32
                    spacing: 36

                    // 个人信息标题
                    Text {
                        text: "个人信息"
                        font.pixelSize: 28
                        font.bold: true
                        color: "#007FFF"
                        anchors.left: parent.left
                        // anchors.leftMargin: 12
                    }

                    // 信息卡片区
                    Item {
                        width: 600
                        height: 60

                        // 编辑按钮
                        Rectangle {
                            width: 32; height: 32; radius: 6
                            color: "#fff"
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: 10
                            anchors.topMargin:16
                            // 阴影
                            Rectangle {
                                color: "#b3d1ff"
                                opacity: 0.15
                                anchors.fill: parent
                                x: 2; y: 2; z: -1
                                radius: 6
                            }
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width:60; height:60
                            }
                        }

                        Column {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            // anchors.leftMargin: 18
                            anchors.rightMargin: 64 // 留编辑按钮空间
                            spacing: 20

                            Row {
                                spacing: 100
                                Text {
                                    text: "姓名： 王宇豪"
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    text: "联系方式：17816936112"
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                            }
                            Text {
                                text: "身份证号： 412828200507112111"
                                font.pixelSize: 20
                                color: "#222"
                            }
                        }
                    }

                    // 分割线
                    Rectangle {
                        y: 0
                        width: parent.width - 32
                        height: 2
                        color: "#cce5ff"
                        anchors.left: parent.left
                        // anchors.leftMargin: 16
                        radius: 1
                    }

                    // 账号管理标题
                    Text {
                        text: "账号管理"
                        font.pixelSize: 26
                        font.bold: true
                        color: "#007FFF"
                        anchors.left: parent.left
                        // anchors.leftMargin: 12
                        // anchors.topMargin: 18
                    }

                    // 按钮区
                    Column {
                        spacing: 24
                        anchors.left: parent.left
                        // anchors.leftMargin: 32

                        CustomButton{
                            width: 180;height: 42
                            text: "退出登录"
                            activeFocusOnTab: true
                            focus: true

                        }

                        CustomButton{
                            width: 180;height: 42
                            text: "注销账号"
                        }
                    }
                }
            }
        }
    }
}
