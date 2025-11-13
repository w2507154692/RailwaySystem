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
    id: myOrdersPage
    objectName: "qrc:/qml/pages/MyOrders.qml"
    visible: true

    property var orderList: []
    property string warningMessage: ""
    property string notificationMessage: ""
    property string pendingCancelOrderNumber: ""

    Component.onCompleted: {
        refreshOrders()
        var myMap = orderList[0]
        for (var k in myMap) {
            console.log(k + ": " + myMap[k])
        }
    }

    Rectangle {
        anchors.fill: parent

        // 滚动卡片区
        ListView {
            id: orderListView
            model: orderList
            clip: true
            spacing: 15
            anchors.fill: parent
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            anchors.leftMargin: 20

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
                                pendingCancelOrderNumber = modelData.orderNumber
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
                item.confirmed.connect(function() {
                    warning.active = false
                    cancelOrder(pendingCancelOrderNumber)
                })
                // 初始化参数
                item.contentText = warningMessage
                item.visible = true
            }
        }
    }

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

    function refreshOrders() {
        orderList = orderManager.getOrders_api(SessionState.username);
    }

    function cancelOrder(orderNumber) {
        orderManager.cancelOrder_api(orderNumber)
        refreshOrders()
        notificationMessage = "订单取消成功！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }
}
