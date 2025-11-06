import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Item {
    height: 128
    width: 675

    // 定义数据
    property var orderData: ({
    orderNumber: "",
    trainNumber: "",
    date: "",
    seatLevel: "",
    carriageNumber: "",
    seatRow: "",
    seatCol: "",
    price: 0.0,
    status: "",
    passengerName: "",
    type: "",
    startStationName: "",
    startTime: "",
    endStationName: "",
    endTime: "",
    interval: ""
    })

    RowLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 15
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
                spacing: 6

                //头部
                RowLayout{
                    Layout.topMargin: 6
                    Layout.leftMargin: 11
                    Layout.rightMargin: 11

                    Text{
                        text:"订单号：" + orderData.orderNumber
                        color: "#606060"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text{
                        text: "车票当日当次有效"
                        color: "#606060"
                    }
                }

                //分隔线
                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 2
                    Layout.rightMargin: 2
                    Layout.topMargin: -4
                    width: 2
                    height: 2
                    color: "#ccc"
                    radius: 1
                }

                //下部主内容
                RowLayout{
                    Layout.topMargin: -8
                    Layout.fillWidth: true

                    Item {
                        Layout.fillWidth: true
                    }


                    //左侧
                    ColumnLayout{
                        Layout.alignment: Qt.AlignTop
                        spacing:3
                        //车票信息，时间
                        // Item {
                        //     Layout.preferredHeight: 0
                        // }

                        RowLayout {
                            Layout.alignment: Qt.AlignLeft
                            // Layout.leftMargin: 36
                            Layout.topMargin: -2
                            spacing: 30
                            // 出发时间
                            ColumnLayout {
                                Layout.alignment: Qt.AlignTop

                                Text {
                                    Layout.alignment: Qt.AlignLeft
                                    text: orderData.startTime; font.bold: true;
                                    font.pixelSize: 21; color: "#222";
                                }
                                Text {
                                    Layout.alignment: Qt.AlignLeft
                                    text: orderData.startStationName;
                                    font.pixelSize: 9; color: "#222";
                                }
                            }
                            // 车次、箭头
                            ColumnLayout {
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    text: orderData.trainNumber; font.bold: true;
                                    font.pixelSize: 18; color: "#222";
                                }
                                Image {
                                    Layout.preferredWidth: 90
                                    Layout.preferredHeight: 4
                                    Layout.topMargin: -8
                                    source: "qrc:/resources/icon/arrow.svg"
                                    fillMode: Image.Stretch
                                }
                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    Layout.topMargin: -2
                                    text: orderData.interval;
                                    font.pixelSize: 8; color: "#888"; }
                            }
                            // 到达时间
                            ColumnLayout {
                                Text {
                                    Layout.alignment: Qt.AlignRight
                                    text: orderData.endTime; font.bold: true;
                                    font.pixelSize: 21; color: "#222"
                                }
                                Text {
                                    Layout.alignment: Qt.AlignRight
                                    text: orderData.endStationName;
                                    font.pixelSize: 9; color: "#222";
                                }
                            }

                            //间隔
                            Item{
                                Layout.preferredWidth: 3
                            }

                            //日期
                            Text{
                                text: orderData.date
                                font.pixelSize: 27
                                font.bold: true
                            }

                            //间隔
                            Item{
                                Layout.preferredWidth: 30
                            }
                        }


                        //车票乘车人，车票信息
                        RowLayout{
                            // Layout.leftMargin: 42

                            //票价
                            Text{
                                Layout.topMargin: 6
                                text:"¥ "
                                font.pixelSize: 18
                                font.bold: true
                                color: "#EE8732"
                            }

                            //票价
                            Text{
                                Layout.leftMargin: -5
                                text: orderData.price
                                font.pixelSize: 30
                                color: "#EE8732"
                            }

                            //间隔
                            Item{
                                Layout.preferredWidth: 23
                            }

                            //乘车人
                            Text{
                                text: "乘车人：" + orderData.passengerName
                                font.pixelSize: 17
                            }

                            //间隔
                            Item{
                                Layout.preferredWidth: 20
                            }

                            //票价类型
                            Rectangle{
                                Layout.preferredWidth: textItem.implicitWidth + 12   // 可加一些 padding
                                Layout.preferredHeight: textItem.implicitHeight + 8  // 可加一些 padding
                                color: "transparent"
                                border.color: "#666"
                                border.width: 2
                                radius: 6


                                Text{
                                    anchors.centerIn: parent
                                    id: textItem
                                    text: orderData.type
                                    font.pixelSize: 11
                                    color: "#666"
                                }
                            }

                            //间隔
                            Item{
                                Layout.preferredWidth: 26
                            }

                            //座位号
                            Text{
                                text: orderData.seatLevel + "   " + orderData.carriageNumber + orderData.seatRow + orderData.seatCol
                                font.pixelSize: 17
                            }

                            //间隔
                            Item{
                                Layout.preferredWidth: 8
                            }

                            CustomButton{
                                Layout.preferredHeight: 18
                                Layout.preferredWidth: 53
                                fontSize: 12
                                text: "时刻表"
                                customColor: "#fff"
                                textColor: "#666"
                                pressedColor: "#666"
                                pressedTextColor: "#fff"
                                borderRadius: 5
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
                        Layout.preferredHeight: 83
                        color: "#ccc"
                        radius: 1
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    //右侧状态

                    ColumnLayout {
                        Layout.fillHeight: true
                        spacing: 0
                        Text { text: orderData.status[0]; color: "#00cc00"; font.pixelSize: 21 }
                        Text { text: orderData.status[1]; color: "#00cc00"; font.pixelSize: 21 }
                        Text { text: orderData.status[2]; color: "#00cc00"; font.pixelSize: 21 }
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                }

            }
        }

    }
}
