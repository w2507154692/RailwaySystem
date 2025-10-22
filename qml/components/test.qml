import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
        width: 960; height: 540
        ListView{
            anchors.fill: parent
            model: Qt.fontFamilies()
            delegate: Item {
                height: 64
                width: parent.width
                Rectangle{
                    height: 48
                    width: parent.width
                    Text {
                        id: txtShow
                        anchors.centerIn: parent
                        color: "black"
                        text: "字体名称" + index + ": " + modelData
                        font.family: modelData
                    }
                }
            }

            // 间隔
            Item {
                Layout.fillWidth: true
            }

            // 中间分隔线
            Rectangle {
                width: 2
                Layout.topMargin: 8
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
                Layout.topMargin: 5
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
