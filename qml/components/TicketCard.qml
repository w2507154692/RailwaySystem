import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    width: 920
    height: 140

    Rectangle {
        anchors.fill: parent
        // width: parent.width - 40
        // height: 140
        radius: 20
        // 使用渐变背景
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#ffffff" }
            GradientStop { position: 1.0; color: "#cce5ff" }
        }
        border.color: "#999"
        border.width: 2
        // anchors.horizontalCenter: parent.horizontalCenter
        // anchors.top: parent.top
        // anchors.topMargin: 15

        // 左侧时间、车次、票价 + 座次 + 座次票价
        RowLayout {
            anchors.fill: parent
            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.leftMargin: 40
            anchors.rightMargin: 20
            height: parent.height - 20

            // 发车时间、车次号、时刻表、到达时间 + 票价
            ColumnLayout {

                // 发车时间 + 车次号 + 时刻表 + 到达时间
                RowLayout {
                    Layout.fillHeight: true
                    spacing: 40
                    // 出发时间
                    ColumnLayout {
                        anchors.top: parent.top

                        // 间隔
                        Item {
                            Layout.preferredHeight: 5
                        }

                        Text {
                            anchors.left: parent.left
                            text: "09:10"; font.bold: true;
                            font.pixelSize: 28; color: "#222";
                        }
                        Text {
                            anchors.left: parent.left
                            text: "北京南（始）";
                            font.pixelSize: 14; color: "#222";
                        }
                    }
                    // 车次、箭头、时刻表
                    ColumnLayout {
                        anchors.top: parent.top
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: "G115"; font.bold: true;
                            font.pixelSize: 30; color: "#222";
                        }
                        Image {
                            Layout.topMargin: -5
                            source: "qrc:/resources/icon/arrow.svg"
                            Layout.preferredWidth: 150
                            height: 20
                            fillMode: Image.Stretch
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: "6小时7分";
                            font.pixelSize: 10; color: "#888"; }
                        CustomButton {
                            text: "时刻表"
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 28
                            fontSize: 14
                            customColor: "#e0e8f8"
                            pressedColor: "#b3d1ff"
                            textColor: "#888"
                            pressedTextColor: "#222"
                            onClicked: {
                                // TODO: 打开时刻表
                            }
                        }
                    }
                    // 到达时间
                    ColumnLayout {
                        anchors.top: parent.top

                        // 间隔
                        Item {
                            Layout.preferredHeight: 5
                        }

                        Text {
                            anchors.right: parent.right
                            text: "15:17"; font.bold: true;
                            font.pixelSize: 28; color: "#222"
                        }
                        Text {
                            anchors.right: parent.right
                            text: "（过）上海虹桥";
                            font.pixelSize: 14; color: "#222";
                        }
                    }

                }
                // 票价
                Text {
                    text: "￥708起"
                    font.pixelSize: 28
                    color: "#e88a3d"
                    font.bold: true
                    anchors.right: parent.right
                    Layout.topMargin: -25
                }

            }

            // 间隔
            Item {
                Layout.fillWidth: true
            }

            // 中间分隔线
            Rectangle {
                width: 2
                Layout.preferredHeight: 110
                // Layout.fillHeight: true
                color: "#ccc"
                radius: 1
            }

            // 间隔
            Item {
                Layout.fillWidth: true
            }

            // 二等 + 一等 + 商务
            RowLayout {
                Layout.fillHeight: true

                // 座位等级
                ColumnLayout {
                    spacing: 15
                    Text {
                        text: "二等";
                        font.pixelSize: 18; color: "#222";
                    }
                    Text {
                        text: "一等";
                        font.pixelSize: 18; color: "#222";
                    }
                    Text {
                        text: "商务";
                        font.pixelSize: 18; color: "#222";
                    }
                }

                // 间隔
                Item {
                    Layout.preferredWidth: 40
                }

                // 票价
                ColumnLayout {
                    spacing: 15
                    Text {
                        text: "￥708";
                        font.pixelSize: 18; color: "#e88a3d";
                    }
                    Text {
                        text: "￥1134";
                        font.pixelSize: 18; color: "#e88a3d";
                    }
                    Text {
                        text: "￥2457";
                        font.pixelSize: 18; color: "#e88a3d";
                    }
                }

                // 间隔
                Item {
                    Layout.preferredWidth: 40
                }

                // 余票
                ColumnLayout {
                    spacing: 15
                    Text {
                        text: "有票";
                        font.pixelSize: 18; color: "#4ec37e";
                    }
                    Text {
                        text: "有票";
                        font.pixelSize: 18; color: "#4ec37e";
                    }
                    Text {
                        text: "无票";
                        font.pixelSize: 18; color: "#bbb";
                    }
                }

                // 间隔
                Item {
                    Layout.preferredWidth: 40
                }

                ColumnLayout {
                    spacing: 10
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
                }

            }

            // Item{
            //     anchors.margins: 20
            //     visible: true
            //     height: 100
            //     width:100
            //     // 右侧票种、价格、余票、预定按钮
            //     GridLayout {
            //         columns: 4
            //         rowSpacing: 10
            //         columnSpacing: 80
            //         Layout.preferredWidth: parent.width * 0.5

            //         // 第一行：二等
            //         Text { text: "二等"; font.pixelSize: 18; color: "#222"; Layout.row: 0; Layout.column: 0 }
            //         Text { text: "￥708"; font.pixelSize: 18; color: "#e88a3d"; Layout.row: 0; Layout.column: 1 }
            //         Text { text: "有票"; font.pixelSize: 18; color: "#4ec37e"; Layout.row: 0; Layout.column: 2 }
            //         CustomButton {
            //             text: "预定"
            //             customColor: "#5d7fa9"
            //             pressedColor: "#3B99Fb"
            //             textColor: "#fff"
            //             pressedTextColor: "#fff"
            //             fontSize: 16
            //             fontBold: false
            //             width: 56
            //             height: 28
            //             enabled: true
            //             Layout.row: 0; Layout.column: 3
            //             onClicked: {
            //                 // TODO: 预定操作
            //             }
            //         }

            //         // 第二行：一等
            //         Text { text: "一等"; font.pixelSize: 18; color: "#222"; Layout.row: 1; Layout.column: 0 }
            //         Text { text: "￥1134"; font.pixelSize: 18; color: "#e88a3d"; Layout.row: 1; Layout.column: 1 }
            //         Text { text: "有票"; font.pixelSize: 18; color: "#4ec37e"; Layout.row: 1; Layout.column: 2 }
            //         CustomButton {
            //             text: "预定"
            //             customColor: "#5d7fa9"
            //             pressedColor: "#3B99Fb"
            //             textColor: "#fff"
            //             pressedTextColor: "#fff"
            //             fontSize: 16
            //             fontBold: false
            //             width: 56
            //             height: 28
            //             enabled: true
            //             Layout.row: 1; Layout.column: 3
            //             onClicked: {
            //                 // TODO: 预定操作
            //             }
            //         }

            //         // 第三行：商务
            //         Text { text: "商务"; font.pixelSize: 18; color: "#222"; Layout.row: 2; Layout.column: 0 }
            //         Text { text: "￥2457"; font.pixelSize: 18; color: "#e88a3d"; Layout.row: 2; Layout.column: 1 }
            //         Text { text: "无票"; font.pixelSize: 18; color: "#bbb"; Layout.row: 2; Layout.column: 2 }
            //         CustomButton {
            //             text: "预定"
            //             customColor: "#bbb"
            //             pressedColor: "#bbb"
            //             textColor: "#fff"
            //             pressedTextColor: "#fff"
            //             fontSize: 16
            //             fontBold: false
            //             width: 56
            //             height: 28
            //             enabled: false
            //             Layout.row: 2; Layout.column: 3
            //             onClicked: {
            //                 // TODO: 预定操作
            //             }
            //         }
            //     }
            // }


        }
    }


}
