import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    width: 960; height: 540
    ColumnLayout{
            width: parent.width
            height: parent.height
        RowLayout {
                    Layout.fillWidth: true
                    height: 100
                    spacing: 0

                    // 左侧按钮区
                    ColumnLayout {
                        width: 100
                        spacing: 10
                        Layout.leftMargin: 20
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
                        Layout.preferredWidth: 20
                    }

                    // 车次卡片内容
                    Rectangle {
                        Layout.fillWidth: true
                        height: 100
                        radius: 16
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#ffffff" }
                            GradientStop { position: 1.0; color: "#cce5ff" }
                        }
                        border.color: "#b3d1f7"
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 60
                            anchors.rightMargin: 50
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

                                Image {
                                    Layout.preferredWidth: 120
                                    Layout.preferredHeight: 5
                                    Layout.topMargin: -10
                                    source: "qrc:/resources/icon/arrow.svg"
                                    fillMode: Image.Stretch
                                }
                                Item{
                                    Layout.preferredHeight: 0
                                }
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.topMargin: -8
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

                    Rectangle {
                        width: 80
                        height: 80
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


            // ListView{
            //     anchors.fill: parent
            //     model: Qt.fontFamilies()
            //     delegate: Item {
            //         height: 64
            //         width: parent.width
            //         Rectangle{
            //             height: 48
            //             width: parent.width
            //             Text {
            //                 id: txtShow
            //                 anchors.centerIn: parent
            //                 color: "black"
            //                 text: "字体名称" + index + ": " + modelData
            //                 font.family: modelData
            //             }
            //         }
            //     }

            //     // 间隔
            //     Item {
            //         Layout.fillWidth: true
            //     }

            //     // 中间分隔线
            //     Rectangle {
            //         width: 2
            //         Layout.topMargin: 8
            //         Layout.preferredHeight: 110
            //         // Layout.fillHeight: true
            //         color: "#ccc"
            //         radius: 1
            //     }

            //     // 间隔
            //     Item {
            //         Layout.fillWidth: true
            //     }

            //     // 二等 + 一等 + 商务
            //     RowLayout {
            //         Layout.topMargin: 5
            //         Layout.fillHeight: true

            //         // 座位等级
            //         ColumnLayout {
            //             spacing: 15
            //             Text {
            //                 text: "二等";
            //                 font.pixelSize: 18; color: "#222";
            //             }
            //             Text {
            //                 text: "一等";
            //                 font.pixelSize: 18; color: "#222";
            //             }
            //             Text {
            //                 text: "商务";
            //                 font.pixelSize: 18; color: "#222";
            //             }
            //         }

            //         // 间隔
            //         Item {
            //             Layout.preferredWidth: 40
            //         }

            //         // 票价
            //         ColumnLayout {
            //             spacing: 15
            //             Text {
            //                 text: "￥708";
            //                 font.pixelSize: 18; color: "#e88a3d";
            //             }
            //             Text {
            //                 text: "￥1134";
            //                 font.pixelSize: 18; color: "#e88a3d";
            //             }
            //             Text {
            //                 text: "￥2457";
            //                 font.pixelSize: 18; color: "#e88a3d";
            //             }
            //         }

            //         // 间隔
            //         Item {
            //             Layout.preferredWidth: 40
            //         }

            //         // 余票
            //         ColumnLayout {
            //             spacing: 15
            //             Text {
            //                 text: "有票";
            //                 font.pixelSize: 18; color: "#4ec37e";
            //             }
            //             Text {
            //                 text: "有票";
            //                 font.pixelSize: 18; color: "#4ec37e";
            //             }
            //             Text {
            //                 text: "无票";
            //                 font.pixelSize: 18; color: "#bbb";
            //             }
            //         }

            //         // 间隔
            //         Item {
            //             Layout.preferredWidth: 40
            //         }

            //         ColumnLayout {
            //             spacing: 10
            //             CustomButton {
            //                 text: "预定"
            //                 customColor: "#5d7fa9"
            //                 pressedColor: "#3B99Fb"
            //                 textColor: "#fff"
            //                 pressedTextColor: "#fff"
            //                 fontSize: 16
            //                 fontBold: false
            //                 width: 56
            //                 height: 28
            //                 enabled: true
            //                 Layout.row: 0; Layout.column: 3
            //                 onClicked: {
            //                     // TODO: 预定操作
            //                 }
            //             }
            //             CustomButton {
            //                 text: "预定"
            //                 customColor: "#5d7fa9"
            //                 pressedColor: "#3B99Fb"
            //                 textColor: "#fff"
            //                 pressedTextColor: "#fff"
            //                 fontSize: 16
            //                 fontBold: false
            //                 width: 56
            //                 height: 28
            //                 enabled: true
            //                 Layout.row: 0; Layout.column: 3
            //                 onClicked: {
            //                     // TODO: 预定操作
            //                 }
            //             }
            //             CustomButton {
            //                 text: "预定"
            //                 customColor: "#5d7fa9"
            //                 pressedColor: "#3B99Fb"
            //                 textColor: "#fff"
            //                 pressedTextColor: "#fff"
            //                 fontSize: 16
            //                 fontBold: false
            //                 width: 56
            //                 height: 28
            //                 enabled: true
            //                 Layout.row: 0; Layout.column: 3
            //                 onClicked: {
            //                     // TODO: 预定操作
            //                 }
            //             }
            //         }

            //     }
            }
    }


    }
