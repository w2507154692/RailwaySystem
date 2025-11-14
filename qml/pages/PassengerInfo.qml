import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import MyApp 1.0

Page {
    id: passengerInfoPage
    objectName:"qrc:/qml/pages/PassengerInfo.qml"
    width: parent ? parent.width :640
    height: parent ? parent.height : 400

    property var passengerList: []
    property var onWarningConfirmed: null
    property string warningMessage: ""
    property string notificationMessage: ""

    Component.onCompleted: {
        refreshPassengers(SessionState.username)
    }

    // 主内容区
    Rectangle {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.leftMargin: 20

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: passengerInfoPage.height - 70
                Layout.alignment: Qt.AlignTop

                // 滚动卡片区
                ListView {
                    id: passengerListView
                    model: passengerList
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
                        width: passengerListView.width - 15

                        // 卡片列表
                        RowLayout{
                            Layout.fillWidth: true
                            // 删除按钮
                            Rectangle {
                                Layout.rightMargin: 15
                                Layout.preferredWidth: 30
                                Layout.preferredHeight: 30
                                radius: 18
                                border.color: "transparent"
                                MouseArea {
                                    id: mouseAreaDelete
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        onWarningConfirmed = function() {
                                            warning.active = false
                                            deletePassenger(SessionState.username, modelData.id)
                                        }
                                        warningMessage = "确认删除该乘车人？"
                                        warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                                        warning.active = true
                                    }
                                }
                                Image {
                                    source: "qrc:/resources/icon/Delete.png"
                                    anchors.centerIn: parent
                                    width: 70
                                    height: 70
                                }
                            }

                            PassengerCard {
                                Layout.fillWidth: true
                                passengerData: modelData
                            }
                            // 按钮
                            Rectangle {
                                Layout.preferredWidth: 60
                                Layout.preferredHeight: 60
                                radius: 16
                                color: "#fff"
                                MouseArea {
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        trainList.splice(index, 1)
                                    }
                                }
                                Image {
                                    anchors.centerIn: parent
                                    source: "qrc:/resources/icon/Edit.png"
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
                Layout.topMargin: -20
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

    function refreshPassengers(username) {
        passengerList = passengerManager.getPassengersByUsername_api(username)
    }

    function deletePassenger(username, id) {
        passengerManager.deletePassenger_api(username, id)
        refreshPassengers(username)
        notificationMessage = "乘车人删除成功！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }
}
