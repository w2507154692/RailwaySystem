import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 960; height: 720
    color: "#ffffff"

    RowLayout {
        anchors.fill: parent

        // 侧边栏
        SideBar {
            Layout.preferredWidth: 150
            Layout.fillHeight: true
        }

        // 主内容区
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "red"

            // 滚动卡片区
            ScrollView {
                anchors.fill: parent
                contentWidth: parent.width

                ColumnLayout {
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 30

                    // 卡片列表
                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }


                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }

                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }

                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }

                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }

                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }

                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }

                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }

                    RowLayout{
                        PassengerCard { Layout.fillWidth: true }
                        // 按钮
                        Rectangle {
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            radius: 16
                            color: "#fff"
                            x: mainContent.cardWidth - 60
                            y: (parent.height - height) / 2
                            z: 1
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width: 60
                                height: 60
                            }
                        }
                    }
                    // ...更多卡片
                }
            }
        }
    }
}
