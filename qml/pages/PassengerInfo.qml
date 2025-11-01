import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 1280; height: 720
    color: "#ffffff"

    RowLayout {
        anchors.fill: parent

        // 侧边栏
        SideBar {
            Layout.preferredWidth: 220
            Layout.fillHeight: true
        }

        // 主内容区
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 650
                    Layout.alignment: Qt.AlignTop

                    // 滚动卡片区
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
                            width: scrollview.width - 15

                            // 卡片列表
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/resources/icon/Edit.png"
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/resources/icon/Edit.png"
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/resources/icon/Edit.png"
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/resources/icon/Edit.png"
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/resources/icon/Edit.png"
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/resources/icon/Edit.png"
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/resources/icon/Edit.png"
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/resources/icon/Edit.png"
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                            RowLayout{
                                // 删除按钮
                                Rectangle {
                                    Layout.rightMargin: 15
                                    Layout.preferredWidth: 30
                                    Layout.preferredHeight: 30
                                    radius: 18
                                    color: "transparent"
                                    border.color: "transparent"
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            trainList.splice(index, 1)
                                        }
                                        Image {
                                            source: "qrc:/resources/icon/Delete.png"
                                            anchors.centerIn: parent
                                            width: 70
                                            height: 70
                                        }
                                    }
                                }

                                PassengerCard { Layout.fillWidth: true }
                                // 按钮
                                Rectangle {
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 60
                                    radius: 16
                                    color: "#fff"
                                    // x: mainContent.cardWidth - 60
                                    // y: (parent.height - height) / 2
                                    // z: 1
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

                // 分割线
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: "#cce5ff"
                }

                // 搜索框和添加按钮区
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 48
                    Layout.bottomMargin: 20
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
           }
        }
    }
}
