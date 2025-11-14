import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import MyApp 1.0

Page {
    width: parent ? parent.width : 740
    height: parent ? parent.height : 640
    id:userManagementPage
    objectName: "qrc:/qml/pages/UserManagement.qml"
    visible: true

    property var accountList: []
    property var onWarningConfirmed: null
    property string warningMessage: ""
    property string notificationMessage: ""

    Component.onCompleted: {
        refreshAccounts()
    }

    // 主内容区
    Rectangle {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.leftMargin: 20

            // 用户列表区（改为ListView）
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: userManagementPage.height - 50
                Layout.alignment: Qt.AlignTop

                ListView {
                    id: accountListView
                    anchors.fill: parent
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20
                    model: accountList
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

                    delegate: ColumnLayout {
                        width: accountListView.width - 20

                        // 用户卡片
                        AccountCard {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 60
                            accountData: modelData
                        }

                        // 操作按钮区
                        RowLayout {
                            Layout.topMargin: 25
                            Layout.leftMargin: 5
                            id: buttonRow
                            Layout.fillWidth: true
                            height: 40
                            spacing: 40

                            CustomButton {
                                text: "重置密码"
                                width: 90
                                height:24
                                fontSize: 15
                                borderRadius: 7
                                buttonType: "confirm"
                            }
                            CustomButton {
                                text: "锁定"
                                width: 70
                                height:24
                                fontSize: 15
                                borderRadius: 7
                                buttonType: modelData.isLocked ? "cancel" : "confirm"
                                enabled: !modelData.isLocked
                                onClicked: {
                                    if (SessionState.username === modelData.username) {
                                        notificationMessage = "管理员不能锁定自身！"
                                        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
                                        notification.active = true
                                        return
                                    }

                                    onWarningConfirmed = function() {
                                        warning.active = false
                                        if (modelData.type === "user")
                                            lockUser(modelData.username)
                                        else
                                            lockAdmin(modelData.username)
                                    }
                                    warningMessage = "确认锁定该账户？"
                                    warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                                    warning.active = true
                                }
                            }
                            CustomButton {
                                text: "解锁"
                                width: 70
                                height:24
                                fontSize: 15
                                borderRadius: 7
                                buttonType: modelData.isLocked ? "confirm" : "cancel"
                                enabled: modelData.isLocked
                                onClicked: {
                                    onWarningConfirmed = function() {
                                        warning.active = false
                                        if (modelData.type === "user")
                                            unlockUser(modelData.username)
                                        else
                                            unlockAdmin(modelData.username)
                                    }
                                    warningMessage = "确认解锁该账户？"
                                    warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                                    warning.active = true
                                }
                            }

                                Item { Layout.fillWidth: true } // 占位，按钮靠右

                            }


                        //分隔线
                        Rectangle{
                            Layout.topMargin: 10
                            Layout.fillWidth: true
                            Layout.preferredHeight: 2
                            color: "#ccc"
                        }
                    }
                }
            }

            // 搜索框和添加按钮区
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 48
                Layout.topMargin: -15
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

            Item {
                Layout.fillHeight: true
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

    function refreshAccounts() {
        var savedContentY = accountListView.contentY
        accountList = accountManager.getAccounts_api()
        accountListView.contentY = savedContentY
    }

    function lockUser(username) {
        var result = accountManager.lockUser_api(username)
        refreshAccounts()
        notificationMessage = result["success"] ? "用户锁定成功！" : "用户锁定失败！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }

    function lockAdmin(username) {
        var result = accountManager.lockAdmin_api(username)
        refreshAccounts()
        notificationMessage = result["success"] ? "管理员锁定成功！" : "管理员锁定失败！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }

    function unlockUser(username) {
        var result = accountManager.unlockUser_api(username)
        refreshAccounts()
        notificationMessage = result["success"] ? "用户解锁成功！" : "用户解锁失败！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }

    function unlockAdmin(username) {
        var result = accountManager.unlockAdmin_api(username)
        refreshAccounts()
        notificationMessage = result["success"] ? "管理员解锁成功！" : "管理员解锁失败！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }

}
