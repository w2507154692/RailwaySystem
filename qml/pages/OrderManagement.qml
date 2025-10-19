import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 1220; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    RowLayout {
        height: parent.height
        width: parent.width


        // 侧边栏
        SideBar {
            Layout.preferredWidth: 150
            Layout.fillHeight: true

            showBottomLine: false
            showBottomButton: false

            menuModel: [
                   { text: "车次管理", iconSource: "qrc:/resources/icon/TrainManagement.png" },
                   { text: "订单管理", iconSource: "qrc:/resources/icon/OrderManagement.png" },
                   { text: "用户管理", iconSource: "qrc:/resources/icon/UserManagement.png" },
               ]

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            // 滚动卡片区
            ColumnLayout{
                anchors.fill: parent

                Rectangle{
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    ScrollView {
                        id: scrollview
                        anchors.fill: parent
                        anchors.topMargin: 20
                        anchors.bottomMargin: 20

                        // 完全自定义滚动条样式
                        ScrollBar.vertical: BasicScrollBar {
                            width: 8
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            height: parent.height - 8
                            policy: ScrollBar.AlwaysOn
                            handleNormalColor: "#a0a0a0"
                            handleLength: 60 // 这里设置你想要的长度
                        }

                        ColumnLayout {
                            width: scrollview.width - 30
                            spacing: 15

                            RowLayout {
                                Layout.fillWidth: true

                                OrderCard {
                                }

                                Item {
                                    Layout.fillWidth: true
                                }

                                ColumnLayout {
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "改签"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 改签逻辑
                                        }
                                    }
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "退票"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 退票逻辑
                                        }
                                    }
                                }
                            }
                            RowLayout {
                                Layout.fillWidth: true
                                OrderCard {
                                }
                                Item {
                                    Layout.fillWidth: true
                                }
                                ColumnLayout {
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "改签"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 改签逻辑
                                        }
                                    }
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "退票"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 退票逻辑
                                        }
                                    }
                                }
                            }
                            RowLayout {
                                Layout.fillWidth: true
                                OrderCard {
                                }
                                Item {
                                    Layout.fillWidth: true
                                }
                                ColumnLayout {
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "改签"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 改签逻辑
                                        }
                                    }
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "退票"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 退票逻辑
                                        }
                                    }
                                }
                            }
                            RowLayout {
                                Layout.fillWidth: true
                                OrderCard {
                                }
                                Item {
                                    Layout.fillWidth: true
                                }
                                ColumnLayout {
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "改签"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 改签逻辑
                                        }
                                    }
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "退票"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 退票逻辑
                                        }
                                    }
                                }
                            }
                            RowLayout {
                                Layout.fillWidth: true
                                OrderCard {
                                }
                                Item {
                                    Layout.fillWidth: true
                                }
                                ColumnLayout {
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "改签"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 改签逻辑
                                        }
                                    }
                                    CustomButton {
                                        Layout.preferredWidth: 120
                                        Layout.preferredHeight: 40
                                        text: "退票"
                                        activeFocusOnTab: true
                                        onClicked: {
                                            // 退票逻辑
                                        }
                                    }
                                }
                            }
                        }
                    }

                }

                SearchBar{
                    Layout.bottomMargin: 20
                }

            }



        }
    }
}
