import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Page {
    width: parent ? parent.width : 960
    height: parent ? parent.height : 720
    id:trainManagementPage
    objectName: "qrc:/qml/pages/TrainManagement.qml"
    visible: true

    property var trainList: []
    property string warningMessage: ""
    property string notificationMessage: ""
    property string pendingCancelOrderNumber: ""

    Component.onCompleted: {
        refreshTrains()
    }

    RowLayout {
        anchors.fill: parent

        // 主内容区
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.topMargin: 20
                spacing: 0

                // 车次卡片区（ListView放在Rectangle里）
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: trainManagementPage.height - 120

                    ListView {
                        id: trainListView
                        anchors.fill: parent
                        model: trainList
                        spacing: 15
                        clip: true

                        // 完全自定义滚动条样式
                        ScrollBar.vertical: BasicScrollBar {
                            width: 8
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            height: parent.height - 8
                            policy: ScrollBar.AlwaysOn
                            handleNormalColor: "#a0a0a0"
                            handleLength: 60 // 这里设置想要的长度
                        }

                        delegate: RowLayout {
                            width: trainListView.width

                            // 左侧按钮区
                            ColumnLayout {
                                width: 100
                                spacing: 10
                                Layout.leftMargin: 2
                                // verticalCenter: parent.verticalCenter

                                CustomButton {
                                    text: "时刻表"
                                    width: 90
                                    height: 26
                                    fontSize: 15
                                    borderRadius: 7
                                    buttonType: "confirm"
                                }
                                CustomButton {
                                    text: "座位模板"
                                    width: 90
                                    height: 26
                                    fontSize: 15
                                    borderRadius: 7
                                    buttonType: "confirm"
                                }
                            }

                            Item{
                                Layout.preferredWidth: 2
                            }

                            // 车次卡片内容
                            TrainCard {
                                Layout.fillWidth: true
                                trainData: modelData
                            }

                            Item{
                                Layout.preferredWidth: 10
                            }

                            Rectangle {
                                Layout.rightMargin: 30
                                width: 30
                                height: 30
                                radius: 18
                                color: "transparent"
                                border.color: "transparent"
                                MouseArea {
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        trainList.splice(index, 1)
                                    }
                                    Image {
                                        source: "qrc:/resources/icon/Delete.png"
                                        anchors.centerIn: parent
                                        width: 60
                                        height: 60
                                    }
                                }
                            }
                        }
                    }
                }

                // 分割线
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    Layout.rightMargin: 30
                    Layout.topMargin: 0
                    color: "#cce5ff"
                }

                // 搜索框和添加按钮区
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

                    // 添加按钮
                    Rectangle {
                        width: 38
                        height: 38
                        Layout.alignment: Qt.AlignRight
                        Layout.rightMargin: 30
                        Layout.topMargin: 4

                        Image {
                            source: "qrc:/resources/icon/Add.png" // 换成你的加号图标资源路径
                            anchors.centerIn: parent
                            width: 50
                            height: 50
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
        }
    }

    function refreshTrains() {
        trainList = trainManager.getTrains_api();
    }

    // function cancelOrder(orderNumber) {
    //     refreshOrders()
    //     notificationMessage = "订单取消成功！"
    //     notification.source = "qrc:/qml/components/ConfirmDialog.qml"
    //     notification.active = true
    // }
}
