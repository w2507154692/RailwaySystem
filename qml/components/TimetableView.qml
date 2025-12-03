import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: timetable
    width: 370
    height: 320

    property var stationList: [
        { stationName: "乌鲁木齐北", arriveHour: -1, arriveMinute: -1, arriveDay: -1, departureHour: 9, departureMinute: 30, departureDay: 0, stopInterval: -1, passInfo: "起末站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, arriveDay: 0, departureHour: 13, departureMinute: 0, departureDay: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, arriveDay: 0, departureHour: 13, departureMinute: 0, departureDay: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, arriveDay: 0, departureHour: 13, departureMinute: 0, departureDay: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, arriveDay: 1, departureHour: 13, departureMinute: 0, departureDay: 1, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, arriveDay: 1, departureHour: 13, departureMinute: 0, departureDay: 1, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, arriveDay: 1, departureHour: 13, departureMinute: 0, departureDay: 1, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, arriveDay: 1, departureHour: 13, departureMinute: 0, departureDay: 1, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, arriveDay: 2, departureHour: 13, departureMinute: 0, departureDay: 2, stopInterval: 30, passInfo: "中间站" },
        { stationName: "呼和浩特北", arriveHour: 19, arriveMinute: 30, arriveDay: 2, departureHour: -1, departureMinute: -1, departureDay: -1, stopInterval: -1, passInfo: "起末站" },
        { stationName: "其他站", arriveHour: 12, arriveMinute: 30, arriveDay: 0, departureHour: 13, departureMinute: 0, departureDay: 0, stopInterval: 30, passInfo: "其他站" },
        { stationName: "其他站", arriveHour: 12, arriveMinute: 30, arriveDay: 0, departureHour: 13, departureMinute: 0, departureDay: 0, stopInterval: 30, passInfo: "其他站" },
        { stationName: "其他站", arriveHour: 12, arriveMinute: 30, arriveDay: 0, departureHour: 13, departureMinute: 0, departureDay: 0, stopInterval: 30, passInfo: "其他站" },
        { stationName: "其他站", arriveHour: 12, arriveMinute: 30, arriveDay: 0, departureHour: 13, departureMinute: 0, departureDay: 0, stopInterval: 30, passInfo: "其他站" },
    ]

    property bool showButtons: true

    // 新增：外部可控边框宽度
    property int borderWidth: 1

    // 格式化停留时间的函数
    // 一小时以内显示多少分，一天内显示几小时几分，超过一天显示几天几小时（不显示分了）
    function formatStopInterval(minutes) {
        if (minutes === -1) {
            return "---"
        } else if (minutes < 60) {
            // 一小时以内：显示分钟
            return minutes + "分"
        } else if (minutes < 1440) {
            // 一天内（24小时）：显示几小时几分
            var hours = Math.floor(minutes / 60)
            var mins = minutes % 60
            if (mins === 0) {
                return hours + "小时"
            } else {
                return hours + "小时" + mins + "分"
            }
        } else {
            // 超过一天：显示几天几小时（不显示分）
            var days = Math.floor(minutes / 1440)
            var remainingMinutes = minutes % 1440
            var hours = Math.floor(remainingMinutes / 60)
            if (hours === 0) {
                return days + "天"
            } else {
                return days + "天" + hours + "小时"
            }
        }
    }

    //背景
    Rectangle {
        anchors.fill: parent
        radius: 8
        color: "#fff"
        border.color: "#dde"
        border.width: borderWidth   // 这里引用属性
    }

    ColumnLayout{
        width: parent.width - 4
        height: parent.height

        // 表头
        Rectangle {
            Layout.topMargin: 2
            // Layout.leftMargin: 2
            // Layout.rightMargin: 2
            radius: 8
            Layout.fillWidth: true
            Layout.preferredHeight: 32
            color: "#f4f9ff"
            RowLayout {
                width: parent.width
                height: parent.height
                // 左侧编辑图标占位
                Item { Layout.preferredWidth: 36; visible: showButtons }

                //间隔
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                Text {
                    text: "站名"
                    color: "#4D4D4D"
                    Layout.preferredWidth: 60
                    horizontalAlignment: Text.AlignHCenter
                }

                //间隔
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                Text {
                    text: "到时"
                    color: "#4D4D4D"
                    Layout.preferredWidth: 55
                    horizontalAlignment: Text.AlignHCenter
                }

                //间隔
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                Text {
                    text: "发时"
                    color: "#4D4D4D"
                    Layout.preferredWidth: 55
                    horizontalAlignment: Text.AlignHCenter
                }

                //间隔
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                Text {
                    text: "停留"
                    color: "#4D4D4D"
                    Layout.preferredWidth: 48
                    horizontalAlignment: Text.AlignHCenter
                }

                //间隔
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                // 右侧删除图标占位
                Item { Layout.preferredWidth: 36; visible: showButtons }
            }
        }

        // // 表头下的分割线
        // Rectangle {
        //     width: parent.width
        //     height: 1
        //     color: "#cce5ff"
        // }


        //表格背景
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.leftMargin: 2
            Layout.rightMargin: 2
            Layout.bottomMargin: 2
            radius:8
            // 表格内容
            ListView {
                id: stationListView
                clip: true
                model: stationList
                anchors.fill: parent

                // 完全自定义滚动条样式
                ScrollBar.vertical: BasicScrollBar {
                    width: 4
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height - 8
                    policy: ScrollBar.AlwaysOn
                    handleNormalColor: "#a0a0a0"
                    handleLength: 60 // 这里设置你想要的长度
                }

                delegate: ColumnLayout {
                    width: stationListView.width
                        Rectangle {
                            Layout.topMargin: -5
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            radius: 6
                            gradient: Gradient {
                                orientation: Gradient.Horizontal   // 横向渐变
                                GradientStop { position: 0.0; color: "#fff"}
                                GradientStop { position: 0.2; color: mouseArea.containsMouse ? "#F0F8FF" : "#fff"}
                                GradientStop { position: 0.8; color: mouseArea.containsMouse ? "#F0F8FF" : "#fff"}
                                GradientStop { position: 1.0; color: "#fff"}
                            }

                            MouseArea {
                                id: mouseArea
                                enabled: showButtons
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                acceptedButtons: Qt.RightButton
                                onClicked: {
                                    menu.popup()
                                }
                            }

                            // 新增菜单
                            Menu {
                                id: menu
                                background: Rectangle {
                                    implicitWidth: 50
                                    implicitHeight: 20
                                    color: "#409CFC"
                                    radius: 3
                                }
                                MenuItem {
                                    implicitWidth: 50
                                    implicitHeight: 20
                                    background: Rectangle {
                                        anchors.fill: parent
                                        radius: 2
                                        color: "#409CFC"
                                    }
                                    contentItem: Text {
                                        text: "新增"
                                        color: "#fff"
                                        font.pixelSize: 12
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    onTriggered: console.log("点击了新增")
                                }
                            }

                            RowLayout {
                                id: rowinfo
                                anchors.fill: parent
                                spacing: 0

                                property color textColor: modelData.passInfo === "起末站"
                                                          ? "#0080FF"
                                                          : (modelData.passInfo === "其他站"
                                                          ? "#808080"
                                                          : "#000")

                                // 编辑按钮
                                Rectangle {
                                    visible: showButtons
                                    Layout.preferredWidth: 36
                                    Layout.preferredHeight: 40
                                    color: "transparent"
                                    Image {
                                        source: "qrc:/resources/icon/Edit.png"
                                        anchors.fill: parent
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            editPassingStationDialog.onConfirmedFunction = function(info) {

                                            }

                                            editPassingStationDialog.active = true
                                        }
                                    }
                                }

                                //间隔
                                Item{
                                    Layout.fillWidth: true
                                }

                                //站名
                                Text {
                                    text: modelData.stationName
                                    color: rowinfo.textColor
                                    Layout.preferredWidth: 60
                                    Layout.preferredHeight: 40
                                    verticalAlignment: Text.AlignVCenter
                                    // font.pixelSize: 16
                                    horizontalAlignment: Text.AlignHCenter
                                }

                                //间隔
                                Item{
                                    Layout.fillWidth: true
                                }

                                //到时
                                Rectangle{
                                    Layout.preferredWidth: 55
                                    Layout.preferredHeight: 38
                                    color: "transparent"

                                    Text {
                                        id: arrivetime
                                        text: (modelData.arriveHour === -1 || modelData.arriveMinute === -1)
                                              ? "---"
                                              : ("0" + modelData.arriveHour).slice(-2) + ":" + ("0" + modelData.arriveMinute).slice(-2)
                                        color: rowinfo.textColor
                                        // Layout.preferredWidth: 55
                                        // Layout.preferredHeight: 40
                                        anchors.centerIn: parent
                                        // verticalAlignment: Text.AlignVCenter
                                        // font.pixelSize: 16
                                        // horizontalAlignment: Text.AlignHCenter
                                    }

                                    Text{
                                        text: "+" + modelData.arriveDay
                                        visible: modelData.arriveDay > 0
                                        color: "#0080FF"
                                        // Layout.preferredWidth: 25
                                        // Layout.preferredHeight: 10
                                        font.pixelSize: 8
                                        anchors.left: arrivetime.right
                                        anchors.top: arrivetime.top
                                    }
                                }



                                //间隔
                                Item{
                                    Layout.fillWidth: true
                                }

                                //发时
                                Rectangle{
                                    Layout.preferredWidth: 55
                                    Layout.preferredHeight: 38
                                    color: "transparent"

                                    Text {
                                        id: departuretime
                                        text: (modelData.departureHour === -1 || modelData.departureMinute === -1)
                                              ? "---"
                                              : ("0" + modelData.departureHour).slice(-2) + ":" + ("0" + modelData.departureMinute).slice(-2)
                                        color: rowinfo.textColor
                                        anchors.centerIn: parent
                                        // verticalAlignment: Text.AlignVCenter
                                        // font.pixelSize: 16
                                        // horizontalAlignment: Text.AlignHCenter
                                    }

                                    Text{
                                        text: "+" + modelData.departureDay
                                        visible: modelData.departureDay > 0
                                        color: "#0080FF"
                                        // Layout.preferredWidth: 25
                                        // Layout.preferredHeight: 10
                                        font.pixelSize: 8
                                        anchors.left: departuretime.right
                                        anchors.top: departuretime.top
                                    }
                                }

                                //间隔
                                Item{
                                    Layout.fillWidth: true
                                }

                                //停留
                                Text {
                                    text: modelData.stopInterval === -1
                                          ? "---"
                                          : modelData.stopInterval + "分"
                                    color: rowinfo.textColor
                                    Layout.preferredWidth: 48
                                    Layout.preferredHeight: 40
                                    verticalAlignment: Text.AlignVCenter
                                    // font.pixelSize: 16
                                    horizontalAlignment: Text.AlignHCenter
                                }

                                //间隔
                                Item{
                                    Layout.fillWidth: true
                                }

                                // 删除按钮
                                Rectangle {
                                    visible: showButtons
                                    Layout.preferredWidth: 36
                                    Layout.preferredHeight: 40
                                    color: "transparent"
                                    Image {
                                        source: "qrc:/resources/icon/Delete.png"
                                        anchors.fill: parent
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

                        // 行分割线
                        Rectangle {
                            Layout.topMargin: -12
                            Layout.leftMargin: 35
                            Layout.rightMargin: 35
                            Layout.fillWidth: true
                            Layout.preferredHeight: 2
                            // Layout.leftMargin: 36
                            // Layout.columnSpan: 6
                            color: "#b3b3b3"
                        }
                    }
            }
        }
    }

    // 修改
    Loader {
        property var initialInfo: ({})
        property var onConfirmedFunction: function() {}
        id: editPassingStationDialog
        source: "qrc:/qml/pages/EditPassingStationDialog.qml"
        active: false
        onLoaded: {
            if (item) {
                // 连接取消信号
                item.canceled.connect(function() {
                    editPassingStationDialog.active = false
                })
                // 连接确认信号
                item.confirmed.connect(onConfirmedFunction)
                //初始化参数
                item.initialInfo = initialInfo
                item.visible = true
            }
        }
    }

    // function
}
