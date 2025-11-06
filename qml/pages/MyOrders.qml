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

    Component.onCompleted: {
        orderList = orderManager.getOrders_api(SessionState.username)
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
                width: orderListView.width - 15
                spacing: 15

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
                            onClicked: {
                                // 退票逻辑
                            }
                        }
                    }
                }
            }
        }
    }
}
