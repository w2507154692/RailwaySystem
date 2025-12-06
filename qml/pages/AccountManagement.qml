import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import MyApp 1.0

Page {
    width: parent ? parent.width : 1080
    height: parent ? parent.height : 720
    id: accountPage
    objectName: "qrc:/qml/pages/AccountManagement.qml"
    visible: true

    property var mainWindow

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 36

        Text {
            text: "账号管理"
            font.pixelSize: 28
            font.bold: true
            color: "#007FFF"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        CustomButton {
            Layout.preferredWidth: 180
            Layout.preferredHeight: 42
            text: "退出登录"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                warning.onConfirmed = function() {               // 退出登录逻辑
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
                warning.message = "确认退出登录？"
                warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                warning.active = true
            }
        }
    }

    Loader {
        property string message: ""
        property var onConfirmed: null
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
                item.confirmed.connect(warning.onConfirmed)
                // 初始化参数
                item.contentText = warning.message
                item.visible = true
            }
        }
    }
}
