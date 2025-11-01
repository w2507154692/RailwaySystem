import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#f8f8f8"
    title: "欢迎登录"

    property bool isAdminLogin: false  // 登录类型：false=用户登录, true=管理员登录

    signal loginSuccess(string role) // 添加登录成功信号

    Rectangle {
        anchors.fill: parent
        color: "#f8f8f8"  // 添加背景色作为底色

        // 背景图片
        Image {
            anchors.fill: parent
            source: "qrc:/images/resources/images/logbackground.png"
            fillMode: Image.PreserveAspectCrop
            opacity: 0.15  // 降低透明度，让背景更柔和
            visible: true
        }

        // 添加一个半透明遮罩，让文字更清晰
        Rectangle {
            anchors.fill: parent
            color: "#ffffff"
            opacity: 0.1
        }


        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 24

            // 欢迎登录
            Text {
                text: "欢迎登录"
                font.pixelSize: 38
                color: "#1a252f"  // 更深的颜色，增强对比度
                font.bold: true
                font.family: "Microsoft YaHei"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.DemiBold

                // 添加文字阴影效果
                style: Text.Raised
                styleColor: "#ffffff"
            }

            // 切换登录方式
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20

                Text {
                    id: userLoginText
                    text: "用户登录"
                    color: {
                        if (userLoginMouseArea.containsMouse && isAdminLogin) {
                            return "#2c3e50"  // 悬停时的深色
                        }
                        return isAdminLogin ? "#7f8c8d" : "#3498db"
                    }
                    font.pixelSize: 16
                    font.family: "Microsoft YaHei"
                    font.weight: isAdminLogin ? Font.Normal : Font.Medium

                    MouseArea {
                        id: userLoginMouseArea
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: {
                            isAdminLogin = false
                        }
                    }
                }
                Rectangle {
                    width: 1; height: 18
                    color: "#bdc3c7"
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id: adminLoginText
                    text: "管理员登录"
                    color: {
                        if (adminLoginMouseArea.containsMouse && !isAdminLogin) {
                            return "#2c3e50"  // 悬停时的深色
                        }
                        return isAdminLogin ? "#3498db" : "#7f8c8d"
                    }
                    font.pixelSize: 16
                    font.family: "Microsoft YaHei"
                    font.weight: isAdminLogin ? Font.Medium : Font.Normal

                    MouseArea {
                        id: adminLoginMouseArea
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: {
                            isAdminLogin = true
                        }
                    }
                }
            }

            // 用户输入区域
            Column {
                spacing: 10

                // 用户名输入
                Rectangle {
                    width: 380
                    height: 58
                    radius: 10
                    color: "#ffffff"
                    border.color: "#d5d5d5"
                    border.width: 1

                    // 添加轻微阴影效果
                    Rectangle {
                        anchors.fill: parent
                        anchors.topMargin: 2
                        radius: 10
                        color: "#f5f5f5"
                        opacity: 0.3
                        z: -1
                    }

                    Row {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 12

                        Text {
                            text: isAdminLogin ? "管理员" : "用户"
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#5a6c7d"
                            font.pixelSize: 16
                            font.family: "Microsoft YaHei"
                            width: isAdminLogin ? 56 : 40
                            horizontalAlignment: Text.AlignRight
                        }
                        Rectangle {
                            width: 1;
                            height: 24;
                            color: "#e0e6ed";
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        TextField {
                            id: username
                            anchors.verticalCenter: parent.verticalCenter
                            width: isAdminLogin ? 240 : 256
                            font.pixelSize: 16
                            font.family: "Microsoft YaHei"
                            color: "#2c3e50"
                            placeholderText: isAdminLogin ? "请输入管理员账号" : "请输入用户账号"
                            placeholderTextColor: "#95a5a6"
                            background: null
                            selectByMouse: true
                        }
                    }
                }

                // 密码输入
                Rectangle {
                    width: 380
                    height: 58
                    radius: 10
                    color: "#ffffff"
                    border.color: "#d5d5d5"
                    border.width: 1

                    // 添加轻微阴影效果
                    Rectangle {
                        anchors.fill: parent
                        anchors.topMargin: 2
                        radius: 10
                        color: "#f5f5f5"
                        opacity: 0.3
                        z: -1
                    }

                    Row {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 12

                        Text {
                            text: "密码"
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#5a6c7d"
                            font.pixelSize: 16
                            font.family: "Microsoft YaHei"
                            width: 40
                            horizontalAlignment: Text.AlignRight
                        }
                        Rectangle {
                            width: 1;
                            height: 24;
                            color: "#e0e6ed";
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        TextField {
                            id: password
                            anchors.verticalCenter: parent.verticalCenter
                            width: 256
                            font.pixelSize: 16
                            font.family: "Microsoft YaHei"
                            color: "#2c3e50"
                            placeholderText: "请输入登录密码"
                            placeholderTextColor: "#95a5a6"
                            echoMode: TextInput.Password
                            background: null
                            selectByMouse: true
                        }
                    }
                }
            }

            // 登录按钮
            Rectangle {
                id: loginButton
                width: 380
                height: 54
                radius: 10
                color: "#409CFC"
                anchors.horizontalCenter: parent.horizontalCenter

                // 添加轻微阴影
                Rectangle {
                    anchors.fill: parent
                    anchors.topMargin: 3
                    radius: 10
                    color: "#1c5a85"
                    opacity: 0.4
                    z: -1
                }

                Text {
                    text: "登录"
                    color: "white"
                    font.pixelSize: 18
                    font.family: "Microsoft YaHei"
                    font.weight: Font.Medium
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onEntered: {
                        loginButton.color = "#1f5f99"
                    }
                    onExited: {
                        loginButton.color = "#409CFC"
                    }
                    onPressed: {
                        loginButton.color = "#174a73"
                    }
                    onReleased: {
                        loginButton.color = "#1f5f99"
                    }
                    onClicked: {
                        // 登录验证逻辑
                        if (isAdminLogin) {
                            // 管理员登录逻辑
                            // ...验证管理员身份的代码...
                            loginSuccess("admin")
                        } else {
                            // 用户登录逻辑
                            // ...验证用户身份的代码...
                            loginSuccess("user")
                        }
                    }
                }
            }

            // 注册按钮
            Rectangle {
                id: registerButton
                width: 380
                height: 54
                radius: 10
                color: "#ffffff"
                border.color: "#c5c5c5"
                border.width: 1.5
                visible: !isAdminLogin  // 管理员登录时隐藏注册按钮
                anchors.horizontalCenter: parent.horizontalCenter

                // 添加轻微阴影
                Rectangle {
                    anchors.fill: parent
                    anchors.topMargin: 2
                    radius: 10
                    color: "#e8e8e8"
                    opacity: 0.3
                    z: -1
                }

                Text {
                    text: "注册"
                    color: "#4a4a4a"
                    font.pixelSize: 18
                    font.family: "Microsoft YaHei"
                    font.weight: Font.Medium
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onEntered: {
                        registerButton.color = "#f8f8f8"
                        registerButton.border.color = "#aaa"
                    }
                    onExited: {
                        registerButton.color = "#ffffff"
                        registerButton.border.color = "#c5c5c5"
                    }
                    onPressed: {
                        registerButton.color = "#e8e8e8"
                        registerButton.border.color = "#999"
                    }
                    onReleased: {
                        registerButton.color = "#f8f8f8"
                        registerButton.border.color = "#aaa"
                    }
                    onClicked: {
                        // 注册逻辑
                    }
                }
            }
        }
    }
}
