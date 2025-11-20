import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import MyApp 1.0

Page{
    width: parent ? parent.width : 1080
    height: parent ? parent.height : 720
    id:profilePage
    objectName: "qrc:/qml/pages/Profile.qml"
    visible: true

    property string warningMessage: ""
    property string notificationMessage: ""
    property var onWarningConfirmed: null
    property var mainWindow
    property var profileData: ({
        name: "张三张三张三",
        phoneNumber: "17816936112",
        id: "412828200507112111",
        })

    Component.onCompleted: {
        getProfile()
    }

    RowLayout {
        anchors.fill: parent

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true


            Item {
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.rightMargin: 150
                anchors.topMargin: 30
                anchors.bottomMargin: 86

                ColumnLayout {
                    width: parent.width
                    spacing: 36

                    // 个人信息标题
                    Text {
                        text: "个人信息"
                        font.pixelSize: 28
                        font.bold: true
                        color: "#007FFF"
                    }

                    RowLayout {
                        ColumnLayout {
                            spacing: 25

                            RowLayout{
                                Text {
                                    text: "姓名："
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    text: profileData.name
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    Layout.leftMargin: 80
                                    text: "联系方式："
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    text: profileData.phoneNumber
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                            }
                            RowLayout {
                                Text {
                                    text: "身份证号："
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                                Text {
                                    text: profileData.id
                                    font.pixelSize: 20
                                    color: "#222"
                                }
                            }
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        // 编辑按钮
                        Rectangle {
                            Layout.preferredWidth: 32
                            Layout.preferredHeight: 32
                            Layout.leftMargin: 50
                            radius: 6
                            color: "#fff"
                            // 阴影
                            Rectangle {
                                color: "#b3d1ff"
                                opacity: 0.15
                                anchors.fill: parent
                                x: 2; y: 2; z: -1
                                radius: 6
                            }
                            Image {
                                anchors.centerIn: parent
                                source: "qrc:/resources/icon/Edit.png"
                                width:60; height:60
                            }
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    editProfileDialog.source = "qrc:/qml/pages/PersonalInfoDialog.qml"
                                    editProfileDialog.active = true
                                }
                            }
                        }
                    }

                    // 分割线
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 2
                        color: "#cce5ff"
                        radius: 1
                    }

                    // 账号管理标题
                    Text {
                        text: "账号管理"
                        font.pixelSize: 26
                        font.bold: true
                        color: "#007FFF"
                    }

                    // 按钮区
                    Column {
                        spacing: 24

                        CustomButton{
                            Layout.preferredWidth: 180
                            Layout.preferredHeight: 42
                            text: "退出登录"
                            onClicked: {
                                onWarningConfirmed = function() {               // 退出登录逻辑
                                    warning.active = false
                                    //清空参数
                                    SessionState.clear()
                                    // 清空主内容区
                                    console.log("mainWindow:", mainWindow)
                                    console.log("mainWindow.stackView:", mainWindow.stackView)
                                    if (mainWindow && mainWindow.stackView) {
                                        mainWindow.stackView.clear()
                                        console.log("mainWindow.stackView cleared")

                                    }
                                    console.log("已退出登录")
                                    console.log("appWin.loggedIn:", appWin.loggedIn)
                                    console.log("SessionState.isLoggedIn:", SessionState.isLoggedIn)
                                }
                                warningMessage = "确认退出登录？"
                                warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                                warning.active = true
                            }
                        }

                        CustomButton{
                            Layout.preferredWidth: 180
                            Layout.preferredHeight: 42
                            text: "注销账号"
                            onClicked: {
                                onWarningConfirmed = function() {
                                    deleteUser()
                                    warning.active = false
                                    //清空参数
                                    SessionState.clear()
                                    // 清空主内容区
                                    if (mainWindow && mainWindow.stackView) {
                                        mainWindow.stackView.clear()
                                    }
                                }
                                warningMessage = "确认注销账户？"
                                warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                                warning.active = true
                            }
                        }
                    }
                }
            }
        }
    }

    // 警告
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

    // 修改
    Loader {
        id: editProfileDialog
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接取消信号
                item.canceled.connect(function() {
                    editProfileDialog.active = false
                })
                // 连接确认信号
                item.confirmed.connect(editPassengerInfo)
                //初始化参数
                item.initialName = profileData.name
                item.initialPhoneNumber = profileData.phoneNumber
                item.initialId = profileData.id
                item.visible = true
            }
        }
    }

    function getProfile() {
        profileData = accountManager.getUserProfile_api(SessionState.username)
    }

    function deleteUser() {
        accountManager.deleteUser_api(SessionState.username)
        passengerManager.deletePassengersByUsername_api(SessionState.username)
        SessionState.clear()
    }

    function editPassengerInfo(name, phoneNumber, id) {
        if (name === "") {
            notificationMessage = "姓名不能为空！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }
        if (phoneNumber === "") {
            notificationMessage = "联系方式不能为空！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }
        if (phoneNumber.length !== 11) {
            notificationMessage = "联系方式不合法！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }
        if (id === "") {
            notificationMessage = "身份证号不能为空！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }
        if (id.length !== 18 || !(id.indexOf('x') === -1 || id.indexOf('x') === id.length - 1)) {
            notificationMessage = "身份证号不合法！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }

        var result = accountManager.editUserProfile_api(SessionState.username, name, phoneNumber, id);
        if (result.success) {
            notificationMessage = result.message
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            editProfileDialog.active = false
            getProfile()
        }
        else {
            notificationMessage = result.message
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
        }
    }
}
