import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    //上部
    Rectangle{
        width: parent.width
        height: 170
        color: "#3B99Fb"

        //取消按钮
        Image {
            source: "qrc:/resources/icon/Cancel.png"
            width: 40
            height: 40
            fillMode: Image.PreserveAspectFit
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 10
            MouseArea {
                anchors.fill: parent
                onClicked: infoHeader.closeClicked()
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
            }
        }

        //主内容
        ColumnLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 20   // 顶部留20像素空隙
            spacing: 20

            RowLayout {
                Layout.preferredHeight: 35
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                spacing: 40
                Text { color: "#ffffff"; text: "北京"; font.bold: false; font.pointSize: 20 }
                Text { color: "#ffffff"; text: "<>"; horizontalAlignment: Text.AlignLeft; font.bold: true; font.pointSize: 20 }
                Text { color: "#ffffff"; text: "上海"; font.bold: false; font.pointSize: 20 }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 90
                color: "#3B99Fb"
                anchors.top: parent.top
                anchors.topMargin: 40

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    // 左侧日期和日历
                    Row {
                        spacing: 8
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        Layout.leftMargin: 30

                        Text {
                            text: "日期：2025年6月4日"
                            color: "#fff"
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter

                        }
                        Image {
                            source: "qrc:/resources/icon/Calendar.png"
                            width: 80
                            height: 80
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    // 右侧筛选项
                    GridLayout {
                        columns: 3
                        rowSpacing: 10
                        columnSpacing: 32
                        Layout.rightMargin: 30

                        // 第一行
                        RowLayout {
                            spacing: 4
                            Layout.row: 0; Layout.column: 0
                            height: cb1.height
                            CheckBox {
                                id: cb1
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: "只看商务座"
                                color: "#ffffff"
                                font.pixelSize: 16
                                verticalAlignment: Text.AlignVCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        RowLayout {
                            spacing: 4
                            Layout.row: 0; Layout.column: 1
                            height: cb2.height
                            CheckBox {
                                id: cb2
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: "只看一等座"
                                color: "#ffffff"
                                font.pixelSize: 16
                                verticalAlignment: Text.AlignVCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        RowLayout {
                            spacing: 4
                            Layout.row: 0; Layout.column: 2
                            height: cb3.height
                            CheckBox {
                                id: cb3
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: "只看二等座"
                                color: "#ffffff"
                                font.pixelSize: 16
                                verticalAlignment: Text.AlignVCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        // 第二行
                        RowLayout {
                            spacing: 4
                            Layout.row: 1; Layout.column: 0
                            height: cb4.height
                            CheckBox {
                                id: cb4
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: "只看高铁"
                                color: "#ffffff"
                                font.pixelSize: 16
                                verticalAlignment: Text.AlignVCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        RowLayout {
                            spacing: 4
                            Layout.row: 1; Layout.column: 1
                            height: cb5.height
                            CheckBox {
                                id: cb5
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: "上午出发"
                                color: "#ffffff"
                                font.pixelSize: 16
                                verticalAlignment: Text.AlignVCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        RowLayout {
                            spacing: 4
                            Layout.row: 1; Layout.column: 2
                            height: cb6.height
                            CheckBox {
                                id: cb6
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                text: "下午出发"
                                color: "#ffffff"
                                font.pixelSize: 16
                                verticalAlignment: Text.AlignVCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }
        }
    }

    //票务查询结果卡片区和底部按钮区的白色背景
    Rectangle {
        width: parent.width
        height: parent.height - 145 // 可根据内容调整高度
        radius: 20
        color: "#f8fbff"
        border.color: "#999"
        border.width: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 145
        anchors.horizontalCenterOffset: 0 // 头部+筛选区高度

        // 票务查询结果卡片区
        TicketCard {
            width: parent.width - 40
            height: 140
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 15
            visible: true
        }

        //底部分割线
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 70
            anchors.leftMargin: 20
            width: parent.width - 40
            height: 2
            color: "#808080"
            radius: 1
        }

        // 底部按钮区
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            spacing: 32

            MenuButton {
                text: "耗时最短"
                width: 160
                height: 30
                textx: width / 4 + 10
            }
            MenuButton {
                text: "发时最早"
                width: 160
                height: 30
                textx: width / 4 + 10
            }
            MenuButton {
                text: "到时最早"
                width: 160
                height: 30
                textx: width / 4 + 10
            }
            MenuButton {
                text: "价格最低"
                width: 160
                height: 30
                textx: width / 4 + 10
            }
        }
    }
}
