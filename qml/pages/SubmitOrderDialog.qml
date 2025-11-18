import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window{
    id: mainWindow
    width: 740; height: 640
    minimumWidth: 480; minimumHeight: 360
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "transparent"
    flags: Qt.FramelessWindowHint

    Rectangle {
        id:root
        width: parent.width
        height: parent.height
        color: "#ffffff"
        radius: 16

        MouseArea {
           anchors.fill: parent
           // 定义拖动
           property real clickX: 0
           property real clickY: 0

           onPressed: {
               clickX = mouse.x;
               clickY = mouse.y;
           }
           onPositionChanged: {
               // 拖动窗口
               mainWindow.x += mouse.x - clickX;
               mainWindow.y += mouse.y - clickY;
           }
       }

        //标题
        Header {
            id: header
            width: parent.width
            title: "提交订单"
            onCloseClicked: {
                submitOrderDialog.visible = false
            }
        }

        //下部
        Rectangle {
            width: parent.width
            height: parent.height - header.height - 20 // 可根据内容调整高度
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: header.height + 20
            anchors.left: parent.left
            // anchors.leftMargin: 30
            anchors.right: parent.right
            // anchors.rightMargin: 30



            ColumnLayout {
                anchors.fill: parent
                // anchors.topMargin: 8
                // anchors.leftMargin: 5
                // anchors.rightMargin: 8
                // 滚动卡片区
                ScrollView {
                    id: scrollview
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    // Layout.leftMargin: 10
                    // Layout.rightMargin: 10
                    // contentWidth: parent.width

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
                        width: scrollview.width - 20
                        spacing: 15

                        // 票务查询结果卡片区
                        OrderCard {
                            Layout.fillWidth: true
                            visible: true
                            // context: "submitOrder"
                            orderData: modelData
                            onShowTimetable: function(param) {
                                // param.trainNumber, param.startStation, param.endStation
                                showTimetableByTrainAndStations(param.trainNumber, param.startStation, param.endStation)
                            }
                        }
                        OrderCard {
                            Layout.fillWidth: true
                            visible: true
                            // context: "submitOrder"
                            orderData: modelData
                            onShowTimetable: function(param) {
                                // param.trainNumber, param.startStation, param.endStation
                                showTimetableByTrainAndStations(param.trainNumber, param.startStation, param.endStation)
                            }
                        }
                        OrderCard {
                            Layout.fillWidth: true
                            visible: true
                            // context: "submitOrder"
                            orderData: modelData
                            onShowTimetable: function(param) {
                                // param.trainNumber, param.startStation, param.endStation
                                showTimetableByTrainAndStations(param.trainNumber, param.startStation, param.endStation)
                            }
                        }
                        OrderCard {
                            Layout.fillWidth: true
                            visible: true
                            // context: "submitOrder"
                            orderData: modelData
                            onShowTimetable: function(param) {
                                // param.trainNumber, param.startStation, param.endStation
                                showTimetableByTrainAndStations(param.trainNumber, param.startStation, param.endStation)
                            }
                        }
                    }
                }

                //底部分割线
                Rectangle {
                    Layout.topMargin: 10
                    Layout.leftMargin: 40
                    Layout.rightMargin: 40
                    Layout.preferredHeight: 2
                    Layout.fillWidth: true
                    // anchors.horizontalCenter: parent.horizontalCenter
                    // anchors.bottom: parent.bottom
                    // anchors.bottomMargin: 70
                    // anchors.leftMargin: 20
                    // width: parent.width - 40
                    // height: 2
                    // color: 'pink'
                    color: "#ccc"
                    radius: 1
                }

                // 底部按钮区
                RowLayout {
                    Layout.topMargin: 10
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter
                    // anchors.horizontalCenter: parent.horizontalCenter
                    // anchors.bottom: parent.bottom
                    // anchors.bottomMargin: 30
                    spacing: 80
                    Layout.bottomMargin: 30

                    CustomButton {
                        text: "提交订单"
                        width: 250
                        height: 30

                    }
                    CustomButton {
                        text: "返回"
                        customColor: "#e6e6e6"
                        textColor: "#666"
                        pressedColor: "#666"
                        pressedTextColor: "#fff"
                        width: 250
                        height: 30

                    }
                }
            }
        }
    }
}
