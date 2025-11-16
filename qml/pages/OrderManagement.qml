import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyApp 1.0
import "../components"

Page {
    width: parent ? parent.width : 960
    height: parent ? parent.height : 720
    // width: 960
    // height: 720
    id: orderManagementPage
    objectName: "qrc:/qml/pages/OrderManagement.qml"
    visible: true

    property var mainWindow
    property var rawOrderList: []
    property var orderList: []
    property var timetable: []
    property var onWarningConfirmed: null
    property string warningMessage: ""
    property string notificationMessage: ""

    Component.onCompleted: {
        refreshOrders()
    }

    Rectangle {
        anchors.fill: parent

        ColumnLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 20
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: orderManagementPage.height - 110
                Layout.alignment: Qt.AlignTop

                // 滚动卡片区
                ListView {
                    id: orderListView
                    model: orderList
                    clip: true
                    spacing: 15
                    anchors.fill: parent
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20

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
                        width: orderListView.width - 30

                        RowLayout {
                            Layout.fillWidth: true

                            OrderCard {
                                Layout.preferredWidth: 675
                                orderData: modelData
                                onShowTimetable: function() {
                                    timetable = orderManager.getTimetableInfo_api(modelData.orderNumber)
                                    timetableLoader.source = "Timetable.qml"
                                    timetableLoader.active = true
                                    console.log(timetable[0]["stationName"])
                                }
                            }

                            Item {
                                Layout.fillWidth: true
                            }

                            ColumnLayout {
                                CustomButton {
                                    Layout.preferredWidth: 110
                                    Layout.preferredHeight: 35
                                    text: "改签"
                                    activeFocusOnTab: true
                                    onClicked: {
                                        // 改签逻辑
                                    }
                                }
                                Item{
                                    Layout.preferredHeight: 20
                                }
                                CustomButton {
                                    Layout.preferredWidth: 110
                                    Layout.preferredHeight: 35
                                    text: "退票"
                                    activeFocusOnTab: true
                                    mouseAreaEnabled: modelData.status === "待乘坐"
                                    customColor: modelData.status === "待乘坐" ? "#409CFC" : "#808080"
                                    pressedColor: modelData.status === "待乘坐" ? "#174a73" : "#808080"
                                    hoverColor: modelData.status === "待乘坐" ? "#1f5f99" : "#808080"
                                    onClicked: {
                                        onWarningConfirmed = function() {
                                            warning.active = false
                                            cancelOrder(modelData.orderNumber)
                                        }
                                        warningMessage = "确认取消该订单？"
                                        warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                                        warning.active = true
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // 分割线
            Rectangle {
                id: rectangle
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                Layout.rightMargin: 30
                color: "#cce5ff"
            }

            // 搜索框
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.topMargin: 10
                spacing: 15

                // 搜索框
                SearchBar{
                    id: searchOrderNumber
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找订单号"
                    onTextChanged: filterOrderList()
                }
                SearchBar{
                    id: searchTrainNumber
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找车次"
                    onTextChanged: filterOrderList()
                }
                SearchBar{
                    id: searchDate
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找日期（yyyymmdd)"
                    onTextChanged: filterOrderList()
                }
                SearchBar{
                    id: searchPassengerName
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找乘车人"
                    onTextChanged: filterOrderList()
                }

                Item { Layout.fillWidth: true }
            }

            // 搜索框
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                spacing: 15

                // 搜索框
                SearchBar{
                    id: searchStartStationName
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找出发站"
                    onTextChanged: filterOrderList()
                }
                SearchBar{
                    id: searchEndStationName
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找终点站"
                    onTextChanged: filterOrderList()
                }
                Item { Layout.fillWidth: true }
            }
        }
    }

    //警告
    Loader {
        id: warning
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接关闭信号
                item.canceled.connect(function() {
                    warning.active = false
                })
                // 连接确认信号
                if (item && typeof onWarningConfirmed === "function")
                    item.confirmed.connect(onWarningConfirmed)
                // 初始化参数
                item.contentText = warningMessage
                item.visible = true
            }
        }
    }

    //通知
    Loader {
        id: notification
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接关闭信号
                item.closed.connect(function() {
                    notification.active = false
                })
                // 初始化参数
                item.contentText = notificationMessage
                item.visible = true
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
                    console.log("!!!!!!!!!!!!!!!!!!!!")
                    timetableLoader.active = false
                })
                // 初始化参数
                item.transientParent = mainWindow
                item.timetable = timetable
                item.visible = true
            }
        }
    }

    function refreshOrders() {
        // 记录当前滚动条位置
        var savedContentY = orderListView.contentY
        rawOrderList = orderManager.getOrders_api()
        filterOrderList()
        // 回到之前记录的位置
        orderListView.contentY = savedContentY
    }

    function cancelOrder(orderNumber) {
        orderManager.cancelOrder_api(orderNumber)
        refreshOrders()
        notificationMessage = "订单取消成功！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }

    function filterOrderList() {
        orderList = rawOrderList.filter(function(order) {
            // 日期判断，yyyyMMdd格式
            var dateOk = true;
            if (searchDate.text !== "") {
                var mm = order.month < 10 ? "0" + order.month : "" + order.month;
                var dd = order.day < 10 ? "0" + order.day : "" + order.day;
                var orderDateStr = "" + order.year + mm + dd;
                dateOk = (orderDateStr === searchDate.text);
            }
            return (searchOrderNumber.text === "" || (order.orderNumber && order.orderNumber.indexOf(searchOrderNumber.text) !== -1))
                && (searchTrainNumber.text === "" || (order.trainNumber && order.trainNumber.indexOf(searchTrainNumber.text) !== -1))
                && (searchPassengerName.text === "" || (order.passengerName && order.passengerName.indexOf(searchPassengerName.text) !== -1))
                && (searchStartStationName.text === "" || (order.startStationName && order.startStationName.indexOf(searchStartStationName.text) !== -1))
                && (searchEndStationName.text === "" || (order.endStationName && order.endStationName.indexOf(searchEndStationName.text) !== -1))
                && dateOk;
        });
    }
}
