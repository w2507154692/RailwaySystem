import QtQuick 2.15
import QtQuick.Controls 2.15
import MyApp 1.0

// 嵌入式登录页面，不再是窗口，交由外层主窗口控制显示与销毁
Item {
    id: loginPage
    width: parent ? parent.width : 960
    height: parent ? parent.height : 720
    width: 960
    height: 720

    property bool isAdminLogin: false
    signal loginSuccess(string role)
    // 外部传入主窗口对象以便调用其方法（可选）
    property var hostWindow: null

    AccountManager { id: accountManager }

    Rectangle {
        anchors.fill: parent
        color: "#f8f8f8"
        Image {
            anchors.fill: parent
            source: "qrc:/images/resources/images/logbackground.png"
            fillMode: Image.PreserveAspectCrop
            opacity: 0.15
        }
        Rectangle { anchors.fill: parent; color: "#ffffff"; opacity: 0.1 }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 24
            Text {
                text: "欢迎登录"
                font.pixelSize: 38
                color: "#1a252f"
                font.bold: true
                font.family: "Microsoft YaHei"
                horizontalAlignment: Text.AlignHCenter
                style: Text.Raised
                styleColor: "#ffffff"
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                Text {
                    id: userLoginText
                    text: "用户登录"
                    color: {
                        if (userLoginMouseArea.containsMouse && isAdminLogin) return "#2c3e50"
                        return isAdminLogin ? "#7f8c8d" : "#3498db"
                    }
                    font.pixelSize: 16
                    font.family: "Microsoft YaHei"
                    font.weight: isAdminLogin ? Font.Normal : Font.Medium
                    MouseArea { id: userLoginMouseArea; anchors.fill: parent; cursorShape: Qt.PointingHandCursor; hoverEnabled: true; onClicked: isAdminLogin = false }
                }
                Rectangle { width: 1; height: 18; color: "#bdc3c7"; anchors.verticalCenter: parent.verticalCenter }
                Text {
                    id: adminLoginText
                    text: "管理员登录"
                    color: {
                        if (adminLoginMouseArea.containsMouse && !isAdminLogin) return "#2c3e50"
                        return isAdminLogin ? "#3498db" : "#7f8c8d"
                    }
                    font.pixelSize: 16
                    font.family: "Microsoft YaHei"
                    font.weight: isAdminLogin ? Font.Medium : Font.Normal
                    MouseArea { id: adminLoginMouseArea; anchors.fill: parent; cursorShape: Qt.PointingHandCursor; hoverEnabled: true; onClicked: isAdminLogin = true }
                }
            }

            Column {
                spacing: 10
                // 用户名
                Rectangle {
                    width: 380; height: 58; radius: 10; color: "#ffffff"; border.color: "#d5d5d5"; border.width: 1
                    Rectangle { anchors.fill: parent; anchors.topMargin: 2; radius: 10; color: "#f5f5f5"; opacity: 0.3; z: -1 }
                    Row {
                        anchors.fill: parent; anchors.margins: 16; spacing: 12
                        Text { text: isAdminLogin ? "管理员" : "用户"; anchors.verticalCenter: parent.verticalCenter; color: "#5a6c7d"; font.pixelSize: 16; font.family: "Microsoft YaHei"; width: isAdminLogin ? 56 : 40; horizontalAlignment: Text.AlignRight }
                        Rectangle { width: 1; height: 24; color: "#e0e6ed"; anchors.verticalCenter: parent.verticalCenter }
                        TextField { id: username; anchors.verticalCenter: parent.verticalCenter; width: isAdminLogin ? 240 : 256; font.pixelSize: 16; font.family: "Microsoft YaHei"; color: "#2c3e50"; placeholderText: isAdminLogin ? "请输入管理员账号" : "请输入用户账号"; placeholderTextColor: "#95a5a6"; background: null; selectByMouse: true }
                    }
                }
                // 密码
                Rectangle {
                    width: 380; height: 58; radius: 10; color: "#ffffff"; border.color: "#d5d5d5"; border.width: 1
                    Rectangle { anchors.fill: parent; anchors.topMargin: 2; radius: 10; color: "#f5f5f5"; opacity: 0.3; z: -1 }
                    Row {
                        anchors.fill: parent; anchors.margins: 16; spacing: 12
                        Text { text: "密码"; anchors.verticalCenter: parent.verticalCenter; color: "#5a6c7d"; font.pixelSize: 16; font.family: "Microsoft YaHei"; width: 40; horizontalAlignment: Text.AlignRight }
                        Rectangle { width: 1; height: 24; color: "#e0e6ed"; anchors.verticalCenter: parent.verticalCenter }
                        TextField { id: password; anchors.verticalCenter: parent.verticalCenter; width: 256; font.pixelSize: 16; font.family: "Microsoft YaHei"; color: "#2c3e50"; placeholderText: "请输入登录密码"; placeholderTextColor: "#95a5a6"; echoMode: TextInput.Password; background: null; selectByMouse: true }
                    }
                }
            }

            // 登录按钮
            Rectangle {
                id: loginButton
                width: 380; height: 54; radius: 10; color: "#409CFC"
                Rectangle { anchors.fill: parent; anchors.topMargin: 3; radius: 10; color: "#1c5a85"; opacity: 0.4; z: -1 }
                Text { text: "登录"; color: "white"; font.pixelSize: 18; font.family: "Microsoft YaHei"; font.weight: Font.Medium; anchors.centerIn: parent }
                MouseArea {
                    anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor
                    onEntered: loginButton.color = "#1f5f99"
                    onExited: loginButton.color = "#409CFC"
                    onPressed: loginButton.color = "#174a73"
                    onReleased: loginButton.color = "#1f5f99"
                    onClicked: {
                        console.log("Login clicked, isAdminLogin:", isAdminLogin)
                        if (isAdminLogin) {
                            loginSuccess("admin")
                        } else {
                            var ok = accountManager.login(username.text, password.text)
                            console.log("Login result:", ok)
                            if (ok) {
                                loginSuccess("user")
                            } else {
                                console.log("密码错误！")
                            }
                        }
                    }
                }
            }

            // 注册按钮（仅普通用户）
            Rectangle {
                id: registerButton
                width: 380; height: 54; radius: 10; color: "#ffffff"; border.color: "#c5c5c5"; border.width: 1.5; visible: !isAdminLogin
                Rectangle { anchors.fill: parent; anchors.topMargin: 2; radius: 10; color: "#e8e8e8"; opacity: 0.3; z: -1 }
                Text { text: "注册"; color: "#4a4a4a"; font.pixelSize: 18; font.family: "Microsoft YaHei"; font.weight: Font.Medium; anchors.centerIn: parent }
                MouseArea {
                    anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor
                    onEntered: { registerButton.color = "#f8f8f8"; registerButton.border.color = "#aaa" }
                    onExited: { registerButton.color = "#ffffff"; registerButton.border.color = "#c5c5c5" }
                    onPressed: { registerButton.color = "#e8e8e8"; registerButton.border.color = "#999" }
                    onReleased: { registerButton.color = "#f8f8f8"; registerButton.border.color = "#aaa" }
                    onClicked: {
                        // TODO: 注册逻辑
                    }
                }
            }
        }
    }
}
