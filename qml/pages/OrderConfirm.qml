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

    // 来源标识: "query"(查询车票), "myOrders"(我的订单改签/订单管理改签)
    property string sourceType: "query"
    property string originalOrderNumber: ""  // 原订单号(改签时使用)

    property var rawPassengerList: []
    property ListModel passengerList: ListModel {}
    property int selectedPassengerCount: 0

    property var ticketData: ({})
    // QtObject {
    //     id: ticketData
    //     property string trainNumber: ""
    //     property string startStationName: ""
    //     property string startStationStopInfo: ""
    //     property int startYear: 0
    //     property int startMonth: 0
    //     property int startDay: 0
    //     property int startHour: 0
    //     property int startMinute: 0
    //     property string endStationName: ""
    //     property string endStationStopInfo: ""
    //     property int endYear: 0
    //     property int endMonth: 0
    //     property int endDay: 0
    //     property int endHour: 0
    //     property int endMinute: 0
    //     property int intervalHour: 0
    //     property int intervalMinute: 0
    //     property string seatType: ""
    //     property real price: 0
    //     property int count: 0  // 购票数量,默认为0
    //     property int remainingTickets: 0  // 余票数量,默认为0
    // }

    Component.onCompleted: {
        // 不在这里调用 refreshPassengers()
        // 等待 sourceType 从父窗口设置完成后再调用
        // refreshPassengers() 会在 TicketQueryResult.qml 设置完 sourceType 后手动调用
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
                        Text {
                            Layout.preferredWidth: 80
                            text: ("0" + ticketData.startHour).slice(-2) + ":" + ("0" + ticketData.startMinute).slice(-2)
                            font.bold: false; font.pixelSize: 24; color: "#222";
                            horizontalAlignment: Text.AlignLeft
                            elide: Text.ElideRight
                            wrapMode: Text.NoWrap
                            clip: true
                        }
                        Text {
                            Layout.preferredWidth: 80
                            text: ticketData.startStationName + "（" + ticketData.startStationStopInfo + "）"
                            font.pixelSize: 8; color: "#222";
                            elide: Text.ElideRight
                            wrapMode: Text.NoWrap
                            clip: true
                        }
                    }

                    // // 间隔
                    // Item {
                    //     Layout.preferredWidth: 30
                    //     Layout.alignment: Qt.AlignVCenter
                    // }

                    // 车次、箭头、时刻表
                    ColumnLayout {
                        spacing: 2
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredWidth: 80
                            text: ticketData.trainNumber
                            font.bold: false;
                            font.pixelSize: 18; color: "#222";
                            horizontalAlignment: Text.AlignHCenter
                            elide: Text.ElideMiddle
                            wrapMode: Text.NoWrap
                            clip: true
                        }
                        Image {
                            Layout.topMargin: -6
                            source: "qrc:/resources/icon/arrow.svg"
                            Layout.preferredWidth: 120
                            Layout.preferredHeight: 8
                            fillMode: Image.Stretch
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: ticketData.intervalHour + "小时" + ticketData.intervalMinute + "分"
                            font.pixelSize: 8;
                            color: "#888";
                        }
                    }

                    // // 间隔
                    // Item {
                    //     Layout.preferredWidth: 30
                    //     Layout.alignment: Qt.AlignVCenter
                    // }

                    // 到达时间
                    ColumnLayout {
                        spacing: 2
                        Text {
                            Layout.preferredWidth: 80
                            text: ("0" + ticketData.endHour).slice(-2) + ":" + ("0" + ticketData.endMinute).slice(-2)
                            font.bold: false; font.pixelSize: 24; color: "#222";
                            horizontalAlignment: Text.AlignRight
                            elide: Text.ElideLeft
                            wrapMode: Text.NoWrap
                            clip: true
                        }
                        Text {
                            Layout.preferredWidth: 80
                            text: "（" + ticketData.endStationStopInfo + "）" + ticketData.endStationName
                            font.pixelSize: 8; color: "#222";
                            horizontalAlignment: Text.AlignRight
                            elide: Text.ElideLeft
                            wrapMode: Text.NoWrap
                            clip: true
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
                        text: selectedPassengerCount
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
                        text: (ticketData.price * selectedPassengerCount).toFixed(2)
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
                    height: 10
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
                                passengerData: {
                                    "name": model.name,
                                    "id":  model.id,
                                    "type": model.type,
                                    "phoneNumber": model.phoneNumber
                                }
                                available: model.available
                            }

                            //按钮
                            CheckButton{
                                id: checkBtn
                                Layout.leftMargin: 15
                                // 改签模式下默认选中且不可点击
                                checked: model.selected
                                // 启用逻辑:
                                // 1. 改签模式(myOrders)下禁用(强制选中)
                                // 2. 乘车人不可用(available=false)时禁用
                                // 3. 达到购票数量上限(ticketData.count)且当前未选中时禁用
                                enabled: (sourceType === "query") && model.available && (model.selected || selectedPassengerCount < ticketData.remainingTickets)
                                opacity: enabled ? 1.0 : 0.5

                                onToggled: (checked) => {
                                    passengerList.setProperty(index, "selected", checked)
                                    var count = 0
                                    for (var i = 0; i < passengerList.count; i++) {
                                        if (passengerList.get(i).selected) {
                                            count++
                                        }
                                    }
                                    selectedPassengerCount = count
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
                Layout.alignment: Qt.AlignRight
                text: "确认订单"
                onClicked: {
                    if (ticketData.count === 0) {
                        notification.message = "请至少选择一位乘车人!"
                        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
                        notification.active = true
                        return
                    }
                    openSubmitOrder()
                }
            }
        }
    }

    // 通知弹窗
    Loader {
        property string message: ""
        id: notification
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 设置父窗口关系 - 使用主窗口避免模态窗口焦点竞争
                item.transientParent = ApplicationWindow.window
                // 连接关闭信号
                item.closed.connect(function() {
                    notification.active = false
                })
                // 初始化参数
                item.contentText = message
                item.visible = true
            }
        }
    }

    // Loader 用于加载提交订单页面
    Loader {
        property var pendingSubmitList: []
        id: submitOrderLoader
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接关闭信号
                item.closed.connect(function() {
                    console.log("关闭提交订单页面")
                    submitOrderLoader.active = false
                    pendingSubmitList = []
                })

                // 设置提交订单列表数据
                if (pendingSubmitList.length > 0) {
                    item.submitList = pendingSubmitList
                }

                // 设置改签相关参数
                item.rescheduleMode = (sourceType === "myOrders")
                item.originalOrderNumber = originalOrderNumber

                item.transientParent = confirmWin
                item.visible = true
            }
        }
    }

    // 刷新乘车人列表
    function refreshPassengers() {
        passengerList.clear()
        selectedPassengerCount = 0

        // 根据来源类型过滤乘车人列表
        if (sourceType === "query") {
            // 查询车票进入:显示当前用户的所有乘车人
            var list = bookingSystem.getPassengers_api({
                username: SessionState.username,
                startYear: ticketData.startYear,
                startMonth: ticketData.startMonth,
                startDay: ticketData.startDay,
                startHour: ticketData.startHour,
                startMinute: ticketData.startMinute,
                endYear: ticketData.endYear,
                endMonth: ticketData.endMonth,
                endDay: ticketData.endDay,
                endHour: ticketData.endHour,
                endMinute: ticketData.endMinute
            })

            for (var i = 0; i < list.length; i++) {
                passengerList.append(
                    Object.assign({}, list[i], {
                        selected: false,
                    })
                )
            }
        } else if (sourceType === "myOrders") {
            // 改签模式:仅显示该订单的乘车人
            var result = orderManager.getPassengerByOrderNumber_api(originalOrderNumber);
            if (result.success) {
                console.log("能够找到该订单的乘车人")
                var p = result.passenger
                passengerList.append({
                    name: p.name,
                    id: p.id,
                    type: p.type,
                    phoneNumber: p.phoneNumber,
                    available: true,
                    selected: true
                })
                passengerList.append(
                    Object.assign({}, p, {
                        available: true,
                        selected: true,
                    })
                )
                selectedPassengerCount = 1
            }
        }
        console.log("sourceType:", sourceType, "passengerList count:", passengerList.count)
    }

    // 打开提交订单页面
    function openSubmitOrder() {
        // 构建订单列表数据
        var submitOrders = []

        for (var i = 0; i < passengerList.count; i++) {
            var passenger = passengerList.get(i)
            if (passenger.selected) {
                // 构建订单数据对象
                var orderData = {
                    orderNumber: "待生成",  // 提交后才会生成订单号
                    trainNumber: ticketData.trainNumber,
                    year: new Date().getFullYear(),
                    month: new Date().getMonth() + 1,
                    day: new Date().getDate(),
                    seatLevel: ticketData.seatType,
                    carriageNumber: 0,  // 待分配
                    seatRow: 0,  // 待分配
                    seatCol: 0,  // 待分配
                    price: ticketData.price,
                    status: "待提交",
                    passengerName: passenger.name,
                    type: passenger.type || "成人",
                    startStationName: ticketData.startStationName,
                    startStationStopInfo: ticketData.startStationStopInfo,
                    startHour: ticketData.startHour,
                    startMinute: ticketData.startMinute,
                    endStationName: ticketData.endStationName,
                    endStationStopInfo: ticketData.endStationStopInfo,
                    endHour: ticketData.endHour,
                    endMinute: ticketData.endMinute,
                    intervalHour: ticketData.intervalHour,
                    intervalMinute: ticketData.intervalMinute
                }

                submitOrders.push(orderData)
            }
        }

        console.log("准备提交的订单数量:", submitOrders.length)

        // 保存待提交的订单列表
        submitOrderLoader.pendingSubmitList = submitOrders

        //订单页面
        submitOrderLoader.source = "SubmitOrderDialog.qml"
        submitOrderLoader.active = true
    }
}
