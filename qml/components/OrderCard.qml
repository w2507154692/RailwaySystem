import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Item {
    height: 170
    width: 900

    Rectangle {
        anchors.fill: parent
        radius: 20
        // 使用渐变背景
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#ffffff" }
            GradientStop { position: 1.0; color: "#cce5ff" }
        }
        border.color: "#999"
        border.width: 2

        //列排序
        ColumnLayout{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            spacing: 8

            //头部
            RowLayout{
                Layout.topMargin: 8
                Layout.leftMargin: 15
                Layout.rightMargin: 15

                Text{
                    text:"订单号： 00000002"
                }

                Item {
                    Layout.fillWidth: true
                }

                Text{
                    text: "车票当日当次有效"
                }
            }

            //分隔线
            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 2
                Layout.rightMargin: 2
                Layout.topMargin: -5
                width: 2
                height: 2
                color: "#ccc"
                radius: 1
            }

            //下部主内容
            RowLayout{
                Layout.topMargin: -10
                Layout.fillWidth: true

                Item {
                    Layout.fillWidth: true
                }


                //左侧
                ColumnLayout{
                    Layout.alignment: Qt.AlignTop
                    spacing:4
                    //车票信息，时间
                    // Item {
                    //     Layout.preferredHeight: 0
                    // }

                    RowLayout {
                        Layout.alignment: Qt.AlignLeft
                        // Layout.leftMargin: 36
                        Layout.topMargin: -2
                        spacing: 40
                        // 出发时间
                        ColumnLayout {
                            Layout.alignment: Qt.AlignTop

                            Text {
                                Layout.alignment: Qt.AlignLeft
                                text: "09:10"; font.bold: true;
                                font.pixelSize: 28; color: "#222";
                            }
                            Text {
                                Layout.alignment: Qt.AlignLeft
                                text: "北京南（始）";
                                font.pixelSize: 12; color: "#222";
                            }
                        }
                        // 车次、箭头
                        ColumnLayout {
                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: "G115"; font.bold: true;
                                font.pixelSize: 24; color: "#222";
                            }
                            Image {
                                Layout.preferredWidth: 120
                                Layout.preferredHeight: 5
                                Layout.topMargin: -10
                                source: "qrc:/resources/icon/arrow.svg"
                                fillMode: Image.Stretch
                            }
                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                Layout.topMargin: -2
                                text: "6小时7分";
                                font.pixelSize: 10; color: "#888"; }
                        }
                        // 到达时间
                        ColumnLayout {
                            Text {
                                Layout.alignment: Qt.AlignRight
                                text: "15:17"; font.bold: true;
                                font.pixelSize: 28; color: "#222"
                            }
                            Text {
                                Layout.alignment: Qt.AlignRight
                                text: "（过）上海虹桥";
                                font.pixelSize: 12; color: "#222";
                            }
                        }

                        //间隔
                        Item{
                            Layout.preferredWidth: 4
                        }

                        //日期
                        Text{
                            text:"2025年6月4日"
                            font.pixelSize: 36
                            font.bold: true
                        }

                        //间隔
                        Item{
                            Layout.preferredWidth: 40
                        }
                    }


                    //车票乘车人，车票信息
                    RowLayout{
                        // Layout.leftMargin: 42

                        //票价
                        Text{
                            Layout.topMargin: 10
                            text:"¥ "
                            font.pixelSize: 24
                            font.bold: true
                            color: "#EE8732"
                        }

                        //票价
                        Text{
                            text:"708"
                            font.pixelSize: 40
                            color: "#EE8732"
                        }

                        //间隔
                        Item{
                            Layout.preferredWidth: 30
                        }

                        //乘车人
                        Text{
                            text: "乘车人： 王宇豪"
                            font.pixelSize: 22
                        }

                        //间隔
                        Item{
                            Layout.preferredWidth: 30
                        }

                        //票价类型
                        Rectangle{
                            Layout.preferredWidth: textItem.implicitWidth + 16   // 可加一些 padding
                            Layout.preferredHeight: textItem.implicitHeight + 12  // 可加一些 padding
                            color: "transparent"
                            border.color: "#666"
                            border.width: 2
                            radius: 8


                            Text{
                                anchors.centerIn: parent
                                id: textItem
                                text:"学生票"
                                font.pixelSize: 14
                                color: "#666"
                            }
                        }

                        //间隔
                        Item{
                            Layout.preferredWidth: 34
                        }

                        //座位号
                        Text{
                            text: "二等座   02车  06F号"
                            font.pixelSize: 22
                        }

                        //间隔
                        Item{
                            Layout.preferredWidth: 10
                        }

                        CustomButton{
                            Layout.preferredHeight: 24
                            Layout.preferredWidth: 70
                            fontSize: 16
                            text: "时刻表"
                            customColor: "#fff"
                            textColor: "#666"
                            pressedColor: "#666"
                            pressedTextColor: "#fff"
                            borderRadius: 6
                            borderColor: "#666"
                            borderWidth: 2
                        }
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                //分割线
                Rectangle {
                    Layout.preferredWidth: 2
                    Layout.preferredHeight: 110
                    color: "#ccc"
                    radius: 1
                }

                Item {
                    Layout.fillWidth: true
                }

                //右侧状态

                ColumnLayout {
                    // Layout.leftMargin: 20
                    // Layout.rightMargin: 40
                    Text { text: "待"; color: "#00cc00"; font.pixelSize: 28 }
                    Text { text: "乘"; color: "#00cc00"; font.pixelSize: 28 }
                    Text { text: "坐"; color: "#00cc00"; font.pixelSize: 28 }
                }

                Item {
                    Layout.fillWidth: true
                }

            }

        }
    }
}
