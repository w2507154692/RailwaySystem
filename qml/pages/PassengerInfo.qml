import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Page {
    id: passengerInfoPage
    objectName:"qrc:/qml/pages/PassengerInfo.qml"
    width: parent ? parent.width :640
    height: parent ? parent.height : 400

    // 主内容区
    Rectangle {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.leftMargin: 20

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: passengerInfoPage.height - 70
                Layout.alignment: Qt.AlignTop

                // 滚动卡片区
                ScrollView {
                    id: scrollView
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
                        width: scrollView.width - 15

                        // 卡片列表
                        RowLayout{
                            Layout.fillWidth: true
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
                            Layout.fillWidth: true
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
                            Layout.fillWidth: true
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
                            Layout.fillWidth: true
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
                            Layout.fillWidth: true
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
                            Layout.fillWidth: true
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
                            Layout.fillWidth: true
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
                            Layout.fillWidth: true
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
                Layout.rightMargin: 30
                Layout.topMargin: -20
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

    // 示例乘车人模型
    ListModel {
        id: passengerModel
        ListElement { name: "张三"; idCard: "123456"; phone: "13800000000" }
        ListElement { name: "李四"; idCard: "223456"; phone: "13900000000" }
        ListElement { name: "王五"; idCard: "323456"; phone: "13700000000" }
    }
}
