import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import MyApp 1.0

Window{
    id: submitWin
    signal closed()
    onVisibleChanged: if (!visible) closed()
    
    width: 740; height: 580
    minimumWidth: 480; minimumHeight: 360
    maximumWidth: 1920; maximumHeight: 1440
    
    visible: true
    color: "transparent"
    flags: Qt.FramelessWindowHint
    modality: Qt.ApplicationModal

    property var submitList: []
    property var timetable: []
    property string mode: "query"
    property string originalOrderNumber: ""

    Rectangle {
        id:root
        anchors.fill: parent
        color: "#ffffff"
        radius: 16
        border.color: "#808080"

        MouseArea {
           anchors.fill: parent
           // 定义拖动
           property real clickX: 0
           property real clickY: 0

           onPressed: function(mouse) {
               clickX = mouse.x;
               clickY = mouse.y;
           }
           onPositionChanged: function(mouse) {
               // 拖动窗口
               submitWin.x += mouse.x - clickX;
               submitWin.y += mouse.y - clickY;
           }
       }

        //标题
        Header {
            id: header
            anchors.top: parent.top
            anchors.topMargin: 1
            width: parent.width - 5
            title: "提交订单"
            onCloseClicked: {
                submitWin.visible = false
            }
        }

        //下部
        Rectangle {
            width: parent.width
            height: parent.height - header.height - 20 // 可根据内容调整高度
            anchors.top: parent.top
            anchors.topMargin: header.height + 20
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5

            ColumnLayout {
                anchors.fill: parent
                // anchors.topMargin: 8
                // anchors.leftMargin: 5
                // anchors.rightMargin: 8
                // 滚动卡片区
                ListView {
                    id: submitListView
                    model: submitList
                    clip: true
                    spacing: 15
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

                    delegate: ColumnLayout {
                    width: submitListView.width - 30

                        RowLayout {
                            Layout.fillWidth: true

                            OrderCard {
                                Layout.preferredWidth: 675
                                orderData: modelData
                                onShowTimetable: function() {
                                    // 根据车次号、起始站和终点站查询时刻表
                                    timetable = trainManager.getTimetableInfo_api(modelData.trainNumber, modelData.startStationName, modelData.endStationName)
                                    timetableLoader.source = "Timetable.qml"
                                    timetableLoader.active = true
                                }
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
                        onClicked: {
                            console.log("提交订单,共", submitList.length, "张")
                            // TODO: 调用后端API提交订单
                            // 这里假设提交成功
                            var submitSuccess = true // 实际应该从后端API获取结果
                            
                            if (submitSuccess) {
                                // 如果是改签模式且提交成功,删除原订单
                                if (mode === "reschedule" && originalOrderNumber !== "") {
                                    console.log("改签成功,删除原订单:", originalOrderNumber)
                                    var cancelResult = orderManager.cancelOrder_api(originalOrderNumber)
                                    if (cancelResult) {
                                        console.log("原订单删除成功")
                                    } else {
                                        console.log("原订单删除失败")
                                    }
                                }
                                submitWin.visible = false
                            }
                        }
                    }
                    CustomButton {
                        text: "返回"
                        customColor: "#e6e6e6"
                        textColor: "#666"
                        pressedColor: "#666"
                        pressedTextColor: "#fff"
                        width: 250
                        height: 30
                        onClicked: {
                            submitWin.visible = false
                        }
                    }
                }
            }
        }
    }

    //时刻表页面
    Loader {
        id: timetableLoader
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接关闭信号
                item.closed.connect(function() {
                    timetableLoader.active = false
                })
                // 初始化参数
                item.transientParent = submitWin
                item.timetable = timetable
                item.visible = true
            }
        }
    }
}
