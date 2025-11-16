import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: timetable
    width: 370
    height: 320

    property var stationList: [
        { stationName: "乌鲁木齐北", arriveHour: -1, arriveMinute: -1, departureHour: 9, departureMinute: 30, stopInterval: -1, passInfo: "起末站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "中间站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "中间站" },
        { stationName: "呼和浩特北", arriveHour: 19, arriveMinute: 30, departureHour: -1, departureMinute: -1, stopInterval: -1, passInfo: "起末站" },
        { stationName: "其他站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "其他站" },
        { stationName: "其他站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "其他站" },
        { stationName: "其他站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "其他站" },
        { stationName: "其他站", arriveHour: 12, arriveMinute: 30, departureHour: 13, departureMinute: 0, stopInterval: 30, passInfo: "其他站" },
    ]

    property bool showButtons: true

    // 新增：外部可控边框宽度
    property int borderWidth: 1

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
                    ColumnLayout{
                        Layout.fillWidth: true
                        RowLayout {
                            Layout.topMargin: -5
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40

                            property color textColor: modelData.passInfo === "起末站"
                                                      ? "#0080FF"
                                                      : (modelData.passInfo === "其他站"
                                                         ? "#808080"
                                                         : "#000")

                            // 编辑按钮
                            Item {
                                Layout.preferredWidth: 36
                                Layout.preferredHeight: 40
                                visible: showButtons
                                Button {
                                    anchors.centerIn: parent
                                    width: 24; height: 24
                                    icon.source: "qrc:/resources/icon/Edit.png"
                                    background: Rectangle { color: "transparent" }
                                    onClicked: {
                                        // 编辑逻辑
                                    }
                                }
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            Text {
                                text: modelData.stationName
                                color: parent.textColor
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

                            Text {
                                text: (modelData.arriveHour === -1 || modelData.arriveMinute === -1)
                                      ? "---"
                                      : ("0" + modelData.arriveHour).slice(-2) + ":" + ("0" + modelData.arriveMinute).slice(-2)
                                color: parent.textColor
                                Layout.preferredWidth: 55
                                Layout.preferredHeight: 40
                                verticalAlignment: Text.AlignVCenter
                                // font.pixelSize: 16
                                horizontalAlignment: Text.AlignHCenter
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            Text {
                                text: (modelData.departureHour === -1 || modelData.departureMinute === -1)
                                      ? "---"
                                      : ("0" + modelData.departureHour).slice(-2) + ":" + ("0" + modelData.departureMinute).slice(-2)
                                color: parent.textColor
                                Layout.preferredWidth: 55
                                Layout.preferredHeight: 40
                                verticalAlignment: Text.AlignVCenter
                                // font.pixelSize: 16
                                horizontalAlignment: Text.AlignHCenter
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            Text {
                                text: modelData.stopInterval === -1
                                      ? "---"
                                      : modelData.stopInterval + "分"
                                color: parent.textColor
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
                            Item {
                                Layout.preferredWidth: 36
                                Layout.preferredHeight: 40
                                visible: showButtons
                                Button {
                                    anchors.centerIn: parent
                                    width: 36; height: 36
                                    icon.source: "qrc:/resources/icon/Delete.png"
                                    background: Rectangle { color: "transparent" }
                                    onClicked: {
                                        timetable.stations.splice(index, 1)
                                    }
                                }
                            }
                        }

                        // 行分割线
                        Rectangle {
                            Layout.topMargin: -10
                            Layout.leftMargin: 30
                            Layout.rightMargin: 30
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
    }
}
