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
    property var onWarningConfirmed: null
    property string warningMessage: ""
    property string notificationMessage: ""

    Component.onCompleted: {
        refreshOrders()
        var myMap = orderList[0]
        for (var k in myMap) {
            console.log(k + ": " + myMap[k])
        }
    }

    Rectangle {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.leftMargin: 20

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: myOrdersPage.height - 70
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
                        context: "myOrders"
                        orderData: modelData
                        onShowTimetable: function(param) {
                             // param.orderNumber
                             showTimetableByOrderNumber(param.orderNumber)
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
                Layout.preferredHeight: 1
                Layout.rightMargin: 30
                Layout.topMargin: -20
                color: "#cce5ff"
            }

            // 搜索框
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 48
                Layout.bottomMargin: 20
                spacing: 0

                // 搜索框
                SearchBar{
                    inputHeight: 30
                    width: 300
                    fontSize: 14
                }

                Item { Layout.fillWidth: true }
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
                if (item && typeof onWarningConfirmed === "function")
                    item.confirmed.connect(onWarningConfirmed)
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
        orderList = orderManager.getOrdersByUsername_api(SessionState.username);
    }

    function cancelOrder(orderNumber) {
        orderManager.cancelOrder_api(orderNumber)
        refreshOrders()
        notificationMessage = "订单取消成功！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }
}
