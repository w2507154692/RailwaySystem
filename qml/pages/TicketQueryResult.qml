import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    id:resultWin
    width: 740; height: 640
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    modality: Qt.ApplicationModal
    visible: false

    property string fromCity: ""
    property string toCity: ""
    property string date: ""
    // 三组互斥：座位、时间、高铁
    property int seatSelected: -1        // 0: 商务座, 1: 一等座, 2: 二等座, -1:未选
    property int timeSelected: -1        // 0: 上午, 1: 下午, -1:未选
    property int typeSelected: -1        // 0: 高铁, -1:未选

    property var ticketList: []

    Component.onCompleted: {
        // queryTickets();
        console.log("fromCity:", fromCity, "toCity:", toCity, "date:", date)
    }

    color: "#ffffff"

    ColumnLayout{
    anchors.fill: parent
        //上部
        Rectangle{
            Layout.fillWidth: true
            height: 170
            color: "#6399f4"

            //主内容
            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: 20   // 顶部留20像素空隙
                spacing: 15

                //标题
                RowLayout {
                    Layout.preferredHeight: 35
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 40
                    Text { color: "#ffffff"; text: "北京"; font.bold: false; font.pointSize: 20 }
                    Text { color: "#ffffff"; text: "<>"; horizontalAlignment: Text.AlignLeft; font.bold: true; font.pointSize: 20 }
                    Text { color: "#ffffff"; text: "上海"; font.bold: false; font.pointSize: 20 }
                }

                //下部
                RowLayout {

                    // 左侧日期和日历
                    RowLayout {
                        spacing: 8
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        Layout.leftMargin: 30

                        Text {
                            text: "日期：2025年6月4日"
                            color: "#fff"
                            font.pixelSize: 18

                        }
                        Image {
                            source: "qrc:/resources/icon/Calendar.png"
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                    Item{
                        Layout.fillWidth: true
                    }

                    // 右侧筛选项
                    GridLayout {
                        Layout.rightMargin: 40
                        Layout.fillWidth: true
                        columns: 3
                        rowSpacing: 4
                        columnSpacing: 4

                        // 第一列
                        MyCheckBox {
                            text: "只看商务座"
                            checked: seatSelected === 0
                            onClicked: seatSelected = checked ? 0 : -1
                            Layout.row: 0
                            Layout.column: 0
                        }
                        MyCheckBox {
                            text: "上午出发"
                            checked: timeSelected === 0
                            onClicked: timeSelected = checked ? 0 : -1
                            Layout.row: 1
                            Layout.column: 0
                        }
                        // 第二列
                        MyCheckBox {
                            text: "只看一等座"
                            checked: seatSelected === 1
                            onClicked: seatSelected = checked ? 1 : -1
                            Layout.row: 0
                            Layout.column: 1
                        }
                        MyCheckBox {
                            text: "下午出发"
                            checked: timeSelected === 1
                            onClicked: timeSelected = checked ? 1 : -1
                            Layout.row: 1
                            Layout.column: 1
                        }
                        // 第三列
                        MyCheckBox {
                            text: "只看二等座"
                            checked: seatSelected === 2
                            onClicked: seatSelected = checked ? 2 : -1
                            Layout.row: 0
                            Layout.column: 2
                        }
                        MyCheckBox {
                            text: "只看高铁"
                            checked: typeSelected === 0
                            onClicked: typeSelected = checked ? 0 : -1
                            Layout.row: 1
                            Layout.column: 2
                        }
                    }
                }

                Item{
                    Layout.fillHeight: true
                }
            }
        }

        //票务查询结果卡片区和底部按钮区的白色背景
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.topMargin: -20
            radius: 20
            color: "#f8fbff"
            border.color: "#999"
            border.width: 2

            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: 8
                anchors.leftMargin: 5
                // anchors.rightMargin: 8
                // 滚动卡片区
                ListView {
                    id: ticketListView
                    model: ticketList
                    clip: true
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.leftMargin: 15
                    // Layout.rightMargin: 10
                    // contentWidth: parent.width

                    // 完全自定义滚动条样式
                    ScrollBar.vertical: BasicScrollBar {
                        width: 8
                        anchors.right: parent.right
                        height: parent.height - 8
                        policy: ScrollBar.AlwaysOn
                        handleNormalColor: "#a0a0a0"
                        handleLength: 60 // 这里设置你想要的长度
                    }

                    delegate: ColumnLayout {
                        width: ticketListView.width - 20

                        // 票务查询结果卡片区
                        TicketCard {
                            Layout.fillWidth: true
                            Layout.topMargin: 15
                            visible: true
                            ticketData: modelData
                        }
                    }
                }


                //底部分割线
                Rectangle {
                    Layout.topMargin: 10
                    Layout.leftMargin: 25
                    Layout.rightMargin: 25
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
                    Layout.fillWidth: true
                    Layout.topMargin: 10
                    Layout.bottomMargin: 30
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 50

                    property int selectedIndex: 0

                    SelectButton {
                        Layout.preferredWidth: 120
                        Layout.preferredHeight: 30
                        text: "耗时最短"
                        index: 0
                        selected: parent.selectedIndex == index
                        onClicked: parent.selectedIndex = index
                        fontSize: 16
                    }
                    SelectButton {
                        Layout.preferredWidth: 120
                        Layout.preferredHeight: 30
                        text: "发时最早"
                        index: 1
                        selected: parent.selectedIndex == index
                        onClicked: parent.selectedIndex = index
                        fontSize: 16
                    }
                    SelectButton {
                        Layout.preferredWidth: 120
                        Layout.preferredHeight: 30
                        text: "到时最早"
                        index: 2
                        selected: parent.selectedIndex == index
                        onClicked: parent.selectedIndex = index
                        fontSize: 16
                    }
                    SelectButton {
                        Layout.preferredWidth: 120
                        Layout.preferredHeight: 30
                        text: "价格最低"
                        index: 3
                        selected: parent.selectedIndex == index
                        onClicked: parent.selectedIndex = index
                        fontSize: 16
                    }
                }
            }
        }
    }

    function queryTickets() {
        var dateInt = date.match(/(\d+)年(\d+)月(\d+)日/);
        var year = parseInt(dateInt[1]);
        var month = parseInt(dateInt[2]);
        var day = parseInt(dateInt[3]);
        console.log("year:", year, "month:", month, "day:", day);
        ticketList = bookingSystem.queryTickets_api(fromCity, toCity, year, month, day);
    }

}
