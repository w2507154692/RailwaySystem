import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    property var trainList: [
        {
            from: "北京南",
            to: "上海虹桥",
            depart: "09:10",
            arrive: "15:17",
            trainNo: "G115",
            duration: "6小时7分"
        },
        {
            from: "北京南",
            to: "上海虹桥",
            depart: "09:10",
            arrive: "15:17",
            trainNo: "G115",
            duration: "6小时7分"
        },
        {
            from: "北京南",
            to: "上海虹桥",
            depart: "09:10",
            arrive: "15:17",
            trainNo: "G115",
            duration: "6小时7分"
        },        {
            from: "北京南",
            to: "上海虹桥",
            depart: "09:10",
            arrive: "15:17",
            trainNo: "G115",
            duration: "6小时7分"
        },        {
            from: "北京南",
            to: "上海虹桥",
            depart: "09:10",
            arrive: "15:17",
            trainNo: "G115",
            duration: "6小时7分"
        },        {
            from: "北京南",
            to: "上海虹桥",
            depart: "09:10",
            arrive: "15:17",
            trainNo: "G115",
            duration: "6小时7分"
        },        {
            from: "北京南",
            to: "上海虹桥",
            depart: "09:10",
            arrive: "15:17",
            trainNo: "G115",
            duration: "6小时7分"
        },

    ]

    RowLayout {
        anchors.fill: parent

        // 侧边栏
        SideBar {
            Layout.preferredWidth: 180
            Layout.fillHeight: true
            showBottomLine: false
            showBottomButton: false
        }

        // 主内容区
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.topMargin: 20
                spacing: 0

                // 车次卡片区（ListView放在Rectangle里）
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 600

                    ListView {
                        id: trainListView
                        anchors.fill: parent
                        model: trainList
                        spacing: 10
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

                        delegate: RowLayout {
                            width: trainListView.width

                            // 左侧按钮区
                            ColumnLayout {
                                width: 100
                                spacing: 10
                                // Layout.leftMargin: 20
                                // verticalCenter: parent.verticalCenter

                                CustomButton {
                                    text: "时刻表"
                                    width: 90
                                    height: 26
                                    fontSize: 15
                                    borderRadius: 7
                                    buttonType: "confirm"
                                }
                                CustomButton {
                                    text: "座位模板"
                                    width: 90
                                    height: 26
                                    fontSize: 15
                                    borderRadius: 7
                                    buttonType: "confirm"
                                }
                            }

                            Item{
                                Layout.preferredWidth: 2
                            }

                            // 车次卡片内容
                            Rectangle {
                                Layout.fillWidth: true
                                height: 90
                                radius: 16
                                gradient: Gradient {
                                    GradientStop { position: 0.0; color: "#ffffff" }
                                    GradientStop { position: 1.0; color: "#cce5ff" }
                                }
                                border.color: "#b3d1f7"
                                border.width: 1

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 30
                                    anchors.rightMargin: 20
                                    spacing: 0

                                    Text {
                                        text: "北京南"
                                        font.pixelSize: 28
                                        font.bold: false
                                        color: "#222"
                                        verticalAlignment: Text.AlignVCenter
                                    }

                                    Item { Layout.fillWidth: true }

                                    Text {
                                        text: "09:10"
                                        font.pixelSize: 26
                                        font.bold: true
                                        color: "#222"
                                        Layout.leftMargin: 18
                                        verticalAlignment: Text.AlignVCenter
                                    }

                                    Item { Layout.fillWidth: true }

                                    ColumnLayout {

                                        Item{
                                            Layout.fillHeight: true
                                        }
                                        Text {
                                            Layout.alignment: Qt.AlignHCenter
                                            text: "G115"; font.bold: true;
                                            Layout.topMargin: -10
                                            font.pixelSize: 20; color: "#222";
                                        }
                                        Item{
                                            Layout.preferredHeight: 0
                                        }

                                        Image {
                                            Layout.preferredWidth: 120
                                            Layout.preferredHeight: 5
                                            Layout.topMargin: -20
                                            source: "qrc:/resources/icon/arrow.svg"
                                            fillMode: Image.Stretch
                                        }
                                        Item{
                                            Layout.preferredHeight: 0
                                        }
                                        Text {
                                            Layout.alignment: Qt.AlignHCenter
                                            Layout.topMargin: -18
                                            text: "6小时7分";
                                            font.pixelSize: 10; color: "#888"; }
                                        Item{
                                            Layout.fillHeight: true
                                        }

                                    }

                                    Item { Layout.fillWidth: true }

                                    Text {
                                        text: "15:17"
                                        font.pixelSize: 26
                                        font.bold: true
                                        color: "#222"
                                        verticalAlignment: Text.AlignVCenter
                                    }

                                    Item { Layout.fillWidth: true }

                                    Text {
                                        text: "上海虹桥"
                                        font.pixelSize: 28
                                        font.bold: false
                                        color: "#222"
                                        Layout.leftMargin: 18
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            }

                            Item{
                                Layout.preferredWidth: 10
                            }

                            Rectangle {
                                Layout.rightMargin: 30
                                width: 30
                                height: 30
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
                                        width: 80
                                        height: 80
                                    }
                                }
                            }
                        }
                    }
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
