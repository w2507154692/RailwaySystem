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

            Row {
                Layout.preferredHeight: 35
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                spacing: 40
                Text { color: "#ffffff"; text: "北京"; font.bold: false; font.pointSize: 20 }
                Text { color: "#ffffff"; text: "<>"; horizontalAlignment: Text.AlignLeft; font.bold: true; font.pointSize: 20 }
                Text { color: "#ffffff"; text: "上海"; font.bold: false; font.pointSize: 20 }
            }

            Rectangle {
                width: parent.width
                height: 90
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
                        anchors.left: parent.left
                        anchors.leftMargin: 30

                        Text {
                            text: "日期: 2025年6月4日"
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

                    // 右侧筛选项
                    GridLayout {
                        columns: 3
                        rowSpacing: 10
                        columnSpacing: 32
                        anchors.right: parent.right
                        anchors.rightMargin: 100
                        Layout.alignment: Qt.AlignRight

                        // 第一行
                        Row {
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
                        Row {
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
                        Row {
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
                        Row {
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
                        Row {
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
                        Row {
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
        Rectangle {
            width: parent.width - 40
            height: 140
            radius: 20
            // 使用渐变背景
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#ffffff" }
                GradientStop { position: 1.0; color: "#cce5ff" }
            }
            border.color: "#999"
            border.width: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 15

            Row {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 50

                // 左侧时间、车次、票价

                Item {
                    width: parent.width * 0.36
                    height: parent.height
                    anchors.bottomMargin: 20
                    Column {
                        spacing: 8

                        Row {
                            height: 60
                            spacing: 32
                            // 出发时间
                            Column {
                                spacing: 2
                                Text { text: "09:10"; font.bold: true; font.pixelSize: 24; color: "#222" }
                                Text { text: "北京南（始）"; font.pixelSize: 14; color: "#222"; horizontalAlignment: Text.AlignHCenter }
                            }
                            // 车次、箭头、时刻表
                            Column {
                                spacing: 2
                                anchors.verticalCenter: parent.verticalCenter
                                Text { text: "G115"; font.bold: true; font.pixelSize: 25; color: "#222"; horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter}
                                Image {
                                    source: "qrc:/resources/icon/arrow.svg"
                                    Layout.preferredWidth: 90
                                    Layout.preferredHeight: 10
                                    fillMode: Image.PreserveAspectFit
                                }
                                Text { text: "6小时7分"; font.pixelSize: 10; color: "#888"; horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter}
                                CustomButton {
                                    text: "时刻表"
                                    width: 60
                                    height: 28
                                    fontSize: 14
                                    customColor: "#e0e8f8"
                                    pressedColor: "#b3d1ff"
                                    textColor: "#888"
                                    pressedTextColor: "#222"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    onClicked: {
                                        // TODO: 打开时刻表
                                    }
                                }
                            }
                            // 到达时间
                            Column {
                                spacing: 2
                                Text { text: "15:17"; font.bold: true; font.pixelSize: 24; color: "#222" }
                                Text { text: "上海虹桥（过）"; font.pixelSize: 14; color: "#222"; horizontalAlignment: Text.AlignHCenter }
                            }

                        }
                        // 票价
                        Text {
                            text: "￥708起"
                            font.pixelSize: 28
                            color: "#e88a3d"
                            font.bold: true
                            anchors.right: parent.right
                        }
                    }
                }

                // 中间分隔线
                Rectangle {
                    width: 2
                    height: parent.height
                    color: "#ccc"
                    radius: 1
                    Layout.alignment: Qt.AlignVCenter
                }

                Item{
                    anchors.margins: 20
                    visible: true
                    height: 100
                    width:100
                    // 右侧票种、价格、余票、预定按钮
                    Grid {
                        columns: 4
                        rowSpacing: 10
                        columnSpacing: 80
                        Layout.preferredWidth: parent.width * 0.5

                        // 第一行：二等
                        Text { text: "二等"; font.pixelSize: 18; color: "#222"; Layout.row: 0; Layout.column: 0 }
                        Text { text: "￥708"; font.pixelSize: 18; color: "#e88a3d"; Layout.row: 0; Layout.column: 1 }
                        Text { text: "有票"; font.pixelSize: 18; color: "#4ec37e"; Layout.row: 0; Layout.column: 2 }
                        CustomButton {
                            text: "预定"
                            customColor: "#5d7fa9"
                            pressedColor: "#3B99Fb"
                            textColor: "#fff"
                            pressedTextColor: "#fff"
                            fontSize: 16
                            fontBold: false
                            width: 56
                            height: 28
                            enabled: true
                            Layout.row: 0; Layout.column: 3
                            onClicked: {
                                // TODO: 预定操作
                            }
                        }

                        // 第二行：一等
                        Text { text: "一等"; font.pixelSize: 18; color: "#222"; Layout.row: 1; Layout.column: 0 }
                        Text { text: "￥1134"; font.pixelSize: 18; color: "#e88a3d"; Layout.row: 1; Layout.column: 1 }
                        Text { text: "有票"; font.pixelSize: 18; color: "#4ec37e"; Layout.row: 1; Layout.column: 2 }
                        CustomButton {
                            text: "预定"
                            customColor: "#5d7fa9"
                            pressedColor: "#3B99Fb"
                            textColor: "#fff"
                            pressedTextColor: "#fff"
                            fontSize: 16
                            fontBold: false
                            width: 56
                            height: 28
                            enabled: true
                            Layout.row: 1; Layout.column: 3
                            onClicked: {
                                // TODO: 预定操作
                            }
                        }

                        // 第三行：商务
                        Text { text: "商务"; font.pixelSize: 18; color: "#222"; Layout.row: 2; Layout.column: 0 }
                        Text { text: "￥2457"; font.pixelSize: 18; color: "#e88a3d"; Layout.row: 2; Layout.column: 1 }
                        Text { text: "无票"; font.pixelSize: 18; color: "#bbb"; Layout.row: 2; Layout.column: 2 }
                        CustomButton {
                            text: "预定"
                            customColor: "#bbb"
                            pressedColor: "#bbb"
                            textColor: "#fff"
                            pressedTextColor: "#fff"
                            fontSize: 16
                            fontBold: false
                            width: 56
                            height: 28
                            enabled: false
                            Layout.row: 2; Layout.column: 3
                            onClicked: {
                                // TODO: 预定操作
                            }
                        }
                    }
                }


            }
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
