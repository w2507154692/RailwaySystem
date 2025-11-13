import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import MyApp 1.0

Page{
    width: parent ? parent.width : 1080
    height: parent ? parent.height : 720
    id:profilePage
    objectName: "qrc:/qml/pages/Profile.qml"
    visible: true

    property var profileData: ({
        name: "张三张三张三",
        phoneNumber: "17816936112",
        id: "412828200507112111",
        })

    Component.onCompleted: {
        getProfile(SessionState.username)
    }

    RowLayout {
        anchors.fill: parent

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true


            Item {
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.rightMargin: 150
                anchors.topMargin: 30
                anchors.bottomMargin: 86

                ColumnLayout {
                    width: parent.width
                    spacing: 36

                    // 个人信息标题
                    Text {
                        text: "个人信息"
                        font.pixelSize: 28
                        font.bold: true
                        color: "#007FFF"
                    }

                    RowLayout {
                        ColumnLayout {
                            spacing: 25

                            RowLayout{
                                Text {
                                    text: "姓名："
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    text: profileData.name
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    Layout.leftMargin: 80
                                    text: "联系方式："
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    text: profileData.phoneNumber
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                            }
                            RowLayout {
                                Text {
                                    text: "身份证号："
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    text: profileData.id
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                            }
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        // 编辑按钮
                        Rectangle {
                            Layout.preferredWidth: 32
                            Layout.preferredHeight: 32
                            Layout.leftMargin: 50
                            radius: 6
                            color: "#fff"
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
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                }
                            }
                        }
                    }

                    // 分割线
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 2
                        color: "#cce5ff"
                        radius: 1
                    }

                    // 账号管理标题
                    Text {
                        text: "账号管理"
                        font.pixelSize: 26
                        font.bold: true
                        color: "#007FFF"
                    }

                    // 按钮区
                    Column {
                        spacing: 24

                        CustomButton{
                            Layout.preferredWidth: 180
                            Layout.preferredHeight: 42
                            text: "退出登录"
                            activeFocusOnTab: true
                            focus: true
                        }

                        CustomButton{
                            Layout.preferredWidth: 180
                            Layout.preferredHeight: 42
                            text: "注销账号"
                        }
                    }
                }
            }
        }
    }

    function getProfile(username) {
        var result = accountManager.getUserProfile_api(username)
        profileData = result
    }
}
