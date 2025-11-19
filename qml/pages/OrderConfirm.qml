import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import Qt5Compat.GraphicalEffects
import MyApp 1.0

Window {
    id:confirmWin
    signal closed()
    onVisibleChanged: if (!visible) closed()

    width: 740; height: 640
    minimumWidth: 370; minimumHeight: 320;
    maximumWidth: 1480; maximumHeight: 1280

    modality: Qt.WindowModal

    // visible: true
    // color: "#ffffff"

    property var rawPassengerList: []
    property var passengerList: []

    property alias ticketData: ticketData
    QtObject {
        id: ticketData
        property string trainNumber: ""
        property string startStationName: ""
        property string startStationStopInfo: ""
        property int startHour: 0
        property int startMinute: 0
        property string endStationName: ""
        property string endStationStopInfo: ""
        property int endHour: 0
        property int endMinute: 0
        property int intervalHour: 0
        property int intervalMinute: 0
        property string seatType: ""
        property real price: 0
        property int count: 0  // 购票数量,默认为0
    }

    Component.onCompleted: {
        refreshPassengers()
    }

    //头部
    Rectangle{
        width: parent.width
        height: 120
        color: "#3B99FB"
        //文本
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 25
            text: "确定订单"
            font.pixelSize: 24
            color: "#fff"
        }
    }

    //下部
    Rectangle{
        width: parent.width
        height: parent.height - 72
        anchors.top: parent.top
        anchors.topMargin: 72
        border.color: "#4d4d4d"
        radius: 15
        ColumnLayout{
            anchors.fill: parent
            anchors.margins: 15
            spacing: 0
            //订单信息
            Rectangle {
                height: 64
                Layout.fillWidth: true
                radius: 8
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ffffff" }
                    GradientStop { position: 1.0; color: "#cce5ff" }
                }
                RowLayout {
                    anchors.fill: parent
                    spacing: 0
                    Layout.preferredWidth: 740

                    // 间隔
                    Item {
                        Layout.preferredWidth: 50
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 出发时间
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 80
                        Text {
                            width: 80; height: 30;
                            text: ("0" + ticketData.startHour).slice(-2) + ":" + ("0" + ticketData.startMinute).slice(-2)
                            font.bold: false; font.pixelSize: 24; color: "#222";
                            horizontalAlignment: Text.AlignLeft
                            Layout.alignment: Qt.AlignLeft
                        }
                        Text {
                            width: 80; height: 12;
                            text: ticketData.startStationName + "（" + ticketData.startStationStopInfo + "）"
                            font.pixelSize: 8; color: "#222";
                            horizontalAlignment: Text.AlignLeft
                            Layout.alignment: Qt.AlignLeft
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 30
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 车次、箭头、时刻表
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 56
                        Text {
                            width: 56; height: 18;
                            text: ticketData.trainNumber
                            font.bold: false;
                            font.pixelSize: 18; color: "#222";
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Image {
                            source: "qrc:/resources/icon/arrow.svg"
                            width: 48; height: 8
                            fillMode: Image.PreserveAspectFit
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Text {
                            width: 48; height: 12;
                            text: ticketData.intervalHour + "小时" + ticketData.intervalMinute + "分"
                            font.pixelSize: 8;
                            color: "#888";
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 30
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 到达时间
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 80
                        Text {
                            width: 80; height: 30;
                            text: ("0" + ticketData.endHour).slice(-2) + ":" + ("0" + ticketData.endMinute).slice(-2)
                            font.bold: false; font.pixelSize: 24; color: "#222";
                            horizontalAlignment: Text.AlignRight
                            Layout.alignment: Qt.AlignRight
                        }
                        Text {
                            width: 80; height: 12;
                            text: "（" + ticketData.endStationStopInfo + "）" + ticketData.endStationName
                            font.pixelSize: 8; color: "#222";
                            horizontalAlignment: Text.AlignRight
                            Layout.alignment: Qt.AlignRight
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 50
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 70; height: 20;
                        text: ticketData.seatType + " × "
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 20; height: 32;
                        text: ticketData.count
                        font.pixelSize: 24
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 30
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 37; height: 20;
                        text: "共计 "
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 15; height: 20;
                        text: "¥ "
                        font.pixelSize: 16
                        color: "#ee8732"
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 160; height: 48;
                        text: (ticketData.price * ticketData.count).toFixed(2)
                        font.pixelSize: 32
                        color: "#ee8732"
                        horizontalAlignment: Text.AlignLeft
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 30
                        Layout.alignment: Qt.AlignVCenter
                    }
                }

                // 间隔
                Item {
                    Layout.fillHeight: true
                }
            }

            //间距
            Item{
                Layout.preferredHeight: 15
                Layout.alignment: Qt.AlignHCenter
            }

            //选择乘车人
            Text{
                Layout.leftMargin: 17
                text: "选择乘车人"
                font.pixelSize: 14
            }

            //间距
            Item{
                Layout.preferredHeight: 2
                Layout.alignment: Qt.AlignHCenter
            }

            //乘车人信息
            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 15
                border.color: "#b3b3b3"

                //上间距
                Item{
                    id:topSpacing
                    anchors.top: parent.top
                    height: 6
                }

                //滚动卡片区
                ListView {
                    id: selectPassengerList
                    anchors.top: topSpacing.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: bottomSpacing.top
                    anchors.rightMargin: 2
                    model: passengerList
                    clip: true
                    spacing: 15

                    // 完全自定义滚动条样式
                    ScrollBar.vertical: BasicScrollBar {
                        width: 10
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height - 6
                        policy: ScrollBar.AlwaysOn
                        handleNormalColor: "#a0a0a0"
                        handleLength: 48 // 这里设置你想要的长度
                    }

                    delegate: ColumnLayout {
                        width: selectPassengerList.width - 40

                        RowLayout{
                            Layout.fillWidth: true
                            PassengerCard{
                                Layout.leftMargin: 15
                                Layout.fillWidth: true
                                passengerData: modelData
                            }

                            //按钮
                            CheckButton{
                                Layout.leftMargin: 15
                                onToggled: function(checked) {
                                    updateSelectedCount()
                                }
                            }
                        }
                    }

                }

                //下间距
                Item{
                    id:bottomSpacing
                    anchors.bottom: parent.bottom
                    height: 6
                }
            }

            //间距
            Item{
                height: 15
                width: parent.width
            }

            CustomButton{
                anchors.right: parent.right
                text: "确认订单"
            }
        }
    }

    // 刷新乘车人列表
    function refreshPassengers() {
        rawPassengerList = passengerManager.getPassengersByUsername_api(SessionState.username)
        passengerList = rawPassengerList
    }

    // 更新选中的乘车人数量
    function updateSelectedCount() {
        var count = 0
        for (var i = 0; i < selectPassengerList.count; i++) {
            var item = selectPassengerList.itemAtIndex(i)
            if (item && item.children[0] && item.children[0].children[1]) {
                var checkButton = item.children[0].children[1]
                if (checkButton.checked) {
                    count++
                }
            }
        }
        ticketData.count = count
    }
}
