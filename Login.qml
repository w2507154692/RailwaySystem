import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640; height: 480
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1280; maximumHeight: 960
    visible: true
    color: "#f8f8f8"
    title: "欢迎登录"

    property bool isAdminLogin: false  // 登录类型：false=用户登录, true=管理员登录

    Rectangle {
        anchors.fill: parent
        color: "#f8f8f8"
        // 可加背景图片以实现毛玻璃效果
        Image {
            anchors.fill: parent
            source: ":/new/prefix1/images/Login-background.png"
            fillMode: Image.PreserveAspectCrop
            opacity: 0.2
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 24

            // 欢迎登录
            Text {
                text: "欢迎登录"
                font.pixelSize: 36
                color: "#2c3e50"
                font.bold: true
                font.family: "Microsoft YaHei"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.DemiBold
            }

            // 切换登录方式
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20

                Text {
                    text: "用户登录"
                    color: isAdminLogin ? "#7f8c8d" : "#3498db"
                    font.pixelSize: 16
                    font.family: "Microsoft YaHei"
                    font.weight: isAdminLogin ? Font.Normal : Font.Medium
                    
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            isAdminLogin = false
                        }
                        // hoverEnabled: isAdminLogin ? true : false
                        hoverEnabled: true
                        onEntered: parent.color = "black"
                        onExited: parent.color = "#7f8c8d"
                    }
                }
                Rectangle {
                    width: 1; height: 18
                    color: "#bdc3c7"
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "管理员登录"
                    color: isAdminLogin ? "#3498db" : "#7f8c8d"
                    font.pixelSize: 16
                    font.family: "Microsoft YaHei"
                    font.weight: isAdminLogin ? Font.Medium : Font.Normal
                    
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
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
                    width: 360
                    height: 56
                    radius: 8
                    color: "#ffffff"
                    border.color: "#e0e6ed"
                    border.width: 1

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
                    width: 360
                    height: 56
                    radius: 8
                    color: "#ffffff"
                    border.color: "#e0e6ed"
                    border.width: 1

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
                width: 360
                height: 52
                radius: 8
                color: "#3498db"
                anchors.horizontalCenter: parent.horizontalCenter
                
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
                        loginButton.color = "#2980b9"
                    }
                    onExited: {
                        loginButton.color = "#3498db"
                    }
                    onPressed: {
                        loginButton.color = "#1f5499"
                    }
                    onReleased: {
                        loginButton.color = "#2980b9"
                    }
                    onClicked: {
                        // 登录逻辑
                    }
                }
            }

            // 注册按钮
            Rectangle {
                id: registerButton
                width: 360
                height: 52
                radius: 8
                color: "#ffffff"
                border.color: "#e0e6ed"
                border.width: 1
                visible: !isAdminLogin  // 管理员登录时隐藏注册按钮
                anchors.horizontalCenter: parent.horizontalCenter
                
                Text {
                    text: "注册"
                    color: "#5a6c7d"
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
                        registerButton.color = "#f8f9fa"
                        registerButton.border.color = "#bdc3c7"
                    }
                    onExited: {
                        registerButton.color = "#ffffff"
                        registerButton.border.color = "#e0e6ed"
                    }
                    onPressed: {
                        registerButton.color = "#ecf0f1"
                        registerButton.border.color = "#95a5a6"
                    }
                    onReleased: {
                        registerButton.color = "#f8f9fa"
                        registerButton.border.color = "#bdc3c7"
                    }
                    onClicked: {
                        // 注册逻辑
                    }
                }
            }
        }
    }
}
