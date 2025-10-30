import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    id: mainWindow
    width: 600; height: 410
    minimumWidth: 600; minimumHeight: 410
    visible: true
    color: "#ffffff"
    flags:Qt.FramelessWindowHint

    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        radius: 14
        color: "#ffffff"
        border.color: "#666"
        border.width: 2

        MouseArea {
           anchors.fill: parent
           // 定义拖动
           property real clickX: 0
           property real clickY: 0

           onPressed: {
               clickX = mouse.x;
               clickY = mouse.y;
           }
           onPositionChanged: {
               // 拖动窗口
               mainWindow.x += mouse.x - clickX;
               mainWindow.y += mouse.y - clickY;
           }
       }

        // 顶部渐变标题栏
        Header{
            titleFontSize: 18
            id: titleBar
            width: parent.width - 4
            height: 45
            anchors.top: parent.top
            anchors.topMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 2
            title: "用户注册"
        }

        // 内容区
        ColumnLayout{
            anchors.left: parent.left
            anchors.leftMargin: 36
            anchors.right: parent.right
            anchors.rightMargin: 36
            anchors.top: titleBar.bottom
            anchors.topMargin: 16
            anchors.bottom: parent.bottom
            spacing: 0

            Label {
                text: "注册"
                font.pixelSize: 14
                color: "#4282e6"
                Layout.topMargin: 10
            }

            // 分割线
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 5
                height: 1
                color: "#e0e6ef"
                opacity: 0.9
            }

            RowLayout {
                Layout.topMargin: 15
                spacing: 10
                Label {
                    text: "用户名："
                    font.pixelSize: 13
                    color: "#444"
                    Layout.preferredWidth: 70
                    horizontalAlignment: Text.AlignRight
                }
                TextField {
                    id: firstStart
                    Layout.preferredWidth: 200
                    height: 24
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    background: Rectangle {
                        radius: 5
                        border.color: "#888"
                        border.width: 1
                        color: "#fff"
                    }
                }
            }

            RowLayout {
                Layout.topMargin: 15
                spacing: 10
                Label {
                    text: "密码："
                    font.pixelSize: 13
                    color: "#444"
                    Layout.preferredWidth: 70
                    horizontalAlignment: Text.AlignRight
                }
                TextField {
                    id: password
                    Layout.preferredWidth: 200
                    height: 24
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    background: Rectangle {
                        radius: 5
                        border.color: "#888"
                        border.width: 1
                        color: "#fff"
                    }
                }
            }

            RowLayout {
                Layout.topMargin: 15
                spacing: 10
                Label {
                    text: "确认密码："
                    font.pixelSize: 13
                    color: "#444"
                    Layout.preferredWidth: 70
                    horizontalAlignment: Text.AlignRight
                }
                TextField {
                    id: passwordAgain
                    Layout.preferredWidth: 200
                    height: 24
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    background: Rectangle {
                        radius: 5
                        border.color: "#888"
                        border.width: 1
                        color: "#fff"
                    }
                }
            }

            Label {
                Layout.topMargin: 20
                text: "个人信息"
                font.pixelSize: 14
                color: "#4282e6"
            }

            // 分割线
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 5
                height: 1
                color: "#e0e6ef"
                opacity: 0.9
            }

            RowLayout {
                Layout.topMargin: 15
                spacing: 10
                Label {
                    text: "姓名："
                    font.pixelSize: 13
                    color: "#444"
                    Layout.preferredWidth: 70
                    horizontalAlignment: Text.AlignRight
                }
                TextField {
                    id: name
                    Layout.preferredWidth: 100
                    height: 24
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    background: Rectangle {
                        radius: 5
                        border.color: "#888"
                        border.width: 1
                        color: "#fff"
                    }
                }
                Label {
                    Layout.preferredWidth: 70
                    Layout.leftMargin: 40
                    text: "联系方式："
                    font.pixelSize: 13
                    color: "#444"
                    horizontalAlignment: Text.AlignRight
                }
                TextField {
                    id: phoneNumber
                    Layout.preferredWidth: 150
                    height: 24
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    background: Rectangle {
                        radius: 5
                        border.color: "#888"
                        border.width: 1
                        color: "#fff"
                    }
                }
            }

            RowLayout {
                Layout.topMargin: 15
                spacing: 10
                Label {
                    text: "身份证号："
                    font.pixelSize: 13
                    color: "#444"
                    Layout.preferredWidth: 70
                    horizontalAlignment: Text.AlignRight
                }
                TextField {
                    id: identity
                    Layout.preferredWidth: 200
                    height: 24
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    background: Rectangle {
                        radius: 5
                        border.color: "#888"
                        border.width: 1
                        color: "#fff"
                    }
                }
            }

            Item{
                Layout.fillHeight: true
            }

            // 按钮区
            RowLayout {
                Layout.fillWidth: true
                Layout.bottomMargin: 30
                Item { Layout.preferredWidth: 80 }
                // 确认按钮
                CustomButton{
                    buttonType: "confirm"
                    text: "确认"
                    height: 26
                    width: 100
                    fontSize: 14
                }
                Item { Layout.fillWidth: true }
                // 取消按钮
                CustomButton{
                    buttonType: "cancel"
                    text: "取消"
                    height: 26
                    width: 100
                    fontSize: 14
                }
                Item { Layout.preferredWidth: 80 }
            }

        }

        // 内容区
    //     ColumnLayout {
    //         anchors.left: parent.left
    //         anchors.leftMargin: 36
    //         anchors.right: parent.right
    //         anchors.rightMargin: 36
    //         anchors.top: titleBar.bottom
    //         anchors.topMargin: 16
    //         anchors.bottom: parent.bottom
    //         anchors.bottomMargin: 42
    //         spacing: 0

    //         // // 车厢数
    //         // RowLayout {
    //         //     Layout.fillWidth: true
    //         //     spacing: 8
    //         //     Label {
    //         //         text: "车厢数："
    //         //         font.pixelSize: 14
    //         //         color: "#444"
    //         //         Layout.preferredWidth: 70
    //         //         // horizontalAlignment: Text.AlignRight
    //         //     }
    //         //     TextField {
    //         //         id: totalCarriage
    //         //         Layout.preferredWidth: 60
    //         //         height: 26
    //         //         font.pixelSize: 13
    //         //         text: "16"
    //         //         horizontalAlignment: Text.AlignHCenter
    //         //         verticalAlignment: Text.AlignVCenter
    //         //         background: Rectangle {
    //         //             radius: 5
    //         //             border.color: "#888"
    //         //             border.width: 1
    //         //             color: "#fff"
    //         //         }
    //         //     }
    //         //     Item { Layout.fillWidth: true }
    //         // }



    //         // 注册
    //         ColumnLayout {
    //             Layout.fillWidth: true
    //             spacing: 0

                // Label {
                //     text: "注册"
                //     font.pixelSize: 14
                //     color: "#4282e6"
                //     Layout.topMargin: 10
                //     Layout.bottomMargin: 2
                // }

                // Item{
                //     Layout.preferredHeight: 2
                // }

                // // 分割线
                // Rectangle {
                //     Layout.fillWidth: true
                //     height: 1
                //     color: "#e0e6ef"
                //     opacity: 0.9
                // }

                // Item{
                //     Layout.fillHeight: true
                // }

                // RowLayout {
                //     Layout.fillWidth: true
                //     spacing: 10
                //     Label {
                //         text: "车厢："
                //         font.pixelSize: 13
                //         color: "#444"
                //         Layout.preferredWidth: 45
                //         horizontalAlignment: Text.AlignRight
                //     }
                //     TextField {
                //         id: firstStart
                //         Layout.preferredWidth: 40
                //         height: 24
                //         font.pixelSize: 12
                //         text: "1"
                //         horizontalAlignment: Text.AlignHCenter
                //         verticalAlignment: Text.AlignVCenter
                //         background: Rectangle {
                //             radius: 5
                //             border.color: "#888"
                //             border.width: 1
                //             color: "#fff"
                //         }
                //     }
                //     Label { text: "到"; font.pixelSize: 13; color: "#444" }
                //     TextField {
                //         id: firstEnd
                //         Layout.preferredWidth: 40
                //         height: 24
                //         font.pixelSize: 12
                //         text: "2"
                //         horizontalAlignment: Text.AlignHCenter
                //         verticalAlignment: Text.AlignVCenter
                //         background: Rectangle {
                //             radius: 5
                //             border.color: "#888"
                //             border.width: 1
                //             color: "#fff"
                //         }
                //     }
                //     Label { text: "车厢"; font.pixelSize: 13; color: "#444" }

                //     Item{
                //         Layout.fillWidth: true
                //     }

                //     Label { text: "行数："; font.pixelSize: 13; color: "#444" }
                //     TextField {
                //         id: firstRows
                //         Layout.preferredWidth: 40
                //         height: 24
                //         font.pixelSize: 12
                //         text: "10"
                //         horizontalAlignment: Text.AlignHCenter
                //         verticalAlignment: Text.AlignVCenter
                //         background: Rectangle {
                //             radius: 5
                //             border.color: "#888"
                //             border.width: 1
                //             color: "#fff"
                //         }
                //     }

                //     Item{
                //         Layout.fillWidth: true
                //     }

                //     Label { text: "列数："; font.pixelSize: 13; color: "#444" }
                //     TextField {
                //         id: firstCols
                //         Layout.preferredWidth: 40
                //         height: 24
                //         font.pixelSize: 12
                //         text: "2"
                //         horizontalAlignment: Text.AlignHCenter
                //         verticalAlignment: Text.AlignVCenter
                //         background: Rectangle {
                //             radius: 5
                //             border.color: "#888"
                //             border.width: 1
                //             color: "#fff"
                //         }
                //     }
                //     Item { Layout.fillWidth: true }
                // }

                // Item{
                //     Layout.fillHeight: true
                // }

    //         }



    //         // 二等座
    //         ColumnLayout {
    //             Layout.fillWidth: true
    //             spacing: 0

    //             Label {
    //                 text: "二等座"
    //                 font.pixelSize: 14
    //                 color: "#4282e6"
    //                 Layout.topMargin: 10
    //                 Layout.bottomMargin: 2
    //             }

    //             Item{
    //                 Layout.preferredHeight: 2
    //             }

    //             // 分割线
    //             Rectangle {
    //                 Layout.fillWidth: true
    //                 height: 1
    //                 color: "#e0e6ef"
    //                 opacity: 0.9
    //             }

    //             Item{
    //                 Layout.fillHeight: true
    //             }

    //             RowLayout {
    //                 Layout.fillWidth: true
    //                 spacing: 10
    //                 Label {
    //                     text: "车厢："
    //                     font.pixelSize: 13
    //                     color: "#444"
    //                     Layout.preferredWidth: 45
    //                     horizontalAlignment: Text.AlignRight
    //                 }
    //                 TextField {
    //                     id: secondStart
    //                     Layout.preferredWidth: 40
    //                     height: 24
    //                     font.pixelSize: 12
    //                     text: "3"
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     background: Rectangle {
    //                         radius: 5
    //                         border.color: "#888"
    //                         border.width: 1
    //                         color: "#fff"
    //                     }
    //                 }
    //                 Label { text: "到"; font.pixelSize: 13; color: "#444" }
    //                 TextField {
    //                     id: secondEnd
    //                     Layout.preferredWidth: 40
    //                     height: 24
    //                     font.pixelSize: 12
    //                     text: "14"
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     background: Rectangle {
    //                         radius: 5
    //                         border.color: "#888"
    //                         border.width: 1
    //                         color: "#fff"
    //                     }
    //                 }
    //                 Label { text: "车厢"; font.pixelSize: 13; color: "#444" }

    //                 Item{
    //                     Layout.fillWidth: true
    //                 }

    //                 Label { text: "行数："; font.pixelSize: 13; color: "#444" }
    //                 TextField {
    //                     id: secondRows
    //                     Layout.preferredWidth: 40
    //                     height: 24
    //                     font.pixelSize: 12
    //                     text: "21"
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     background: Rectangle {
    //                         radius: 5
    //                         border.color: "#888"
    //                         border.width: 1
    //                         color: "#fff"
    //                     }
    //                 }

    //                 Item{
    //                     Layout.fillWidth: true
    //                 }

    //                 Label { text: "列数："; font.pixelSize: 13; color: "#444" }
    //                 TextField {
    //                     id: secondCols
    //                     Layout.preferredWidth: 40
    //                     height: 24
    //                     font.pixelSize: 12
    //                     text: "5"
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     background: Rectangle {
    //                         radius: 5
    //                         border.color: "#888"
    //                         border.width: 1
    //                         color: "#fff"
    //                     }
    //                 }
    //                 Item { Layout.fillWidth: true }
    //             }

    //             Item{
    //                 Layout.fillHeight: true
    //             }

    //         }


    //         // 商务座
    //         ColumnLayout {
    //             Layout.fillWidth: true
    //             spacing: 0

    //             Label {
    //                 text: "商务座"
    //                 font.pixelSize: 14
    //                 color: "#4282e6"
    //                 Layout.topMargin: 10
    //                 Layout.bottomMargin: 2
    //             }

    //             Item{
    //                 Layout.preferredHeight: 2
    //             }

    //             // 分割线
    //             Rectangle {
    //                 Layout.fillWidth: true
    //                 height: 1
    //                 color: "#e0e6ef"
    //                 opacity: 0.9
    //             }

    //             Item{
    //                 Layout.fillHeight: true
    //             }

    //             RowLayout {
    //                 Layout.fillWidth: true
    //                 spacing: 10
    //                 Label {
    //                     text: "车厢："
    //                     font.pixelSize: 13
    //                     color: "#444"
    //                     Layout.preferredWidth: 45
    //                     horizontalAlignment: Text.AlignRight
    //                 }
    //                 TextField {
    //                     id: businessStart
    //                     Layout.preferredWidth: 40
    //                     height: 24
    //                     font.pixelSize: 12
    //                     text: "15"
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     background: Rectangle {
    //                         radius: 5
    //                         border.color: "#888"
    //                         border.width: 1
    //                         color: "#fff"
    //                     }
    //                 }
    //                 Label { text: "到"; font.pixelSize: 13; color: "#444" }
    //                 TextField {
    //                     id: businessEnd
    //                     Layout.preferredWidth: 40
    //                     height: 24
    //                     font.pixelSize: 12
    //                     text: "16"
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     background: Rectangle {
    //                         radius: 5
    //                         border.color: "#888"
    //                         border.width: 1
    //                         color: "#fff"
    //                     }
    //                 }
    //                 Label { text: "车厢"; font.pixelSize: 13; color: "#444" }

    //                 Item{
    //                     Layout.fillWidth: true
    //                 }

    //                 Label { text: "行数："; font.pixelSize: 13; color: "#444" }
    //                 TextField {
    //                     id: businessRows
    //                     Layout.preferredWidth: 40
    //                     height: 24
    //                     font.pixelSize: 12
    //                     text: "10"
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     background: Rectangle {
    //                         radius: 5
    //                         border.color: "#888"
    //                         border.width: 1
    //                         color: "#fff"
    //                     }
    //                 }

    //                 Item{
    //                     Layout.fillWidth: true
    //                 }

    //                 Label { text: "列数："; font.pixelSize: 13; color: "#444" }
    //                 TextField {
    //                     id: businessCols
    //                     Layout.preferredWidth: 40
    //                     height: 24
    //                     font.pixelSize: 12
    //                     text: "2"
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                     background: Rectangle {
    //                         radius: 5
    //                         border.color: "#888"
    //                         border.width: 1
    //                         color: "#fff"
    //                     }
    //                 }
    //                 Item { Layout.fillWidth: true }
    //             }

    //             Item{
    //                 Layout.fillHeight: true
    //             }

    //         }

            // // 按钮区
            // RowLayout {
            //     Layout.fillWidth: true
            //     Layout.topMargin: 20
            //     Item { Layout.preferredWidth: 80 }
            //     // 确认按钮
            //     CustomButton{
            //         buttonType: "confirm"
            //         text: "确认"
            //         height: 26
            //         width: 100
            //         fontSize: 14
            //     }
            //     Item { Layout.fillWidth: true }
            //     // 取消按钮
            //     CustomButton{
            //         buttonType: "cancel"
            //         text: "取消"
            //         height: 26
            //         width: 100
            //         fontSize: 14
            //     }
            //     Item { Layout.preferredWidth: 80 }
            // }
    //     }
    }
}
