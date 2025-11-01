import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import Qt5Compat.GraphicalEffects

Window {
    width: 740; height: 640
    minimumWidth: 370; minimumHeight: 320;
    maximumWidth: 1480; maximumHeight: 1280
    visible: true
    color: "#ffffff"

    //头部
    Rectangle{
        width: parent.width
        height: 120
        color: "#3B99FB"
        //文本
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 25
            text: "确定订单"
            font.pixelSize: 24
            color: "#fff"
        }
        //取消按钮
        Image {
            id: closeBtn
            source: "qrc:/resources/icon/Cancel.png"
            width: 48
            height: 48
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 12
            MouseArea {
                anchors.fill: parent
                onClicked: infoHeader.closeClicked()
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
            }
        }
    }

    //下部
    Rectangle{
        width: parent.width
        height: parent.height - 72
        anchors.top: parent.top
        anchors.topMargin: 72
        border.color: "#4d4d4d"
        radius: 15
        ColumnLayout{
            anchors.fill: parent
            anchors.margins: 15
            spacing: 0
            //订单信息
            Rectangle {
                height: 64
                Layout.fillWidth: true
                radius: 8
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ffffff" }
                    GradientStop { position: 1.0; color: "#cce5ff" }
                }
                RowLayout {
                    anchors.fill: parent
                    spacing: 0
                    Layout.preferredWidth: 740

                    // 间隔
                    Item {
                        Layout.preferredWidth: 50
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 出发时间
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 80
                        Text {
                            width: 80; height: 30;
                            text: "09:10"; font.bold: false; font.pixelSize: 24; color: "#222";
                            horizontalAlignment: Text.AlignLeft
                            Layout.alignment: Qt.AlignLeft
                        }
                        Text {
                            width: 80; height: 12;
                            text: "北京南（始）"; font.pixelSize: 8; color: "#222";
                            horizontalAlignment: Text.AlignLeft
                            Layout.alignment: Qt.AlignLeft
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 30
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 车次、箭头、时刻表
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 56
                        Text {
                            width: 56; height: 18;
                            text: "G115"; font.bold: false;
                            font.pixelSize: 18; color: "#222";
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Image {
                            source: "qrc:/resources/icon/arrow.svg"
                            width: 48; height: 8
                            fillMode: Image.PreserveAspectFit
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Text {
                            width: 48; height: 12;
                            text: "6小时7分"; font.pixelSize: 8;
                            color: "#888";
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 30
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 到达时间
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 80
                        Text {
                            width: 80; height: 30;
                            text: "15:17"; font.bold: false; font.pixelSize: 24; color: "#222";
                            horizontalAlignment: Text.AlignRight
                            Layout.alignment: Qt.AlignRight
                        }
                        Text {
                            width: 80; height: 12;
                            text: "上海虹桥（终）"; font.pixelSize: 8; color: "#222";
                            horizontalAlignment: Text.AlignRight
                            Layout.alignment: Qt.AlignRight
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 50
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 70; height: 20;
                        text: "二等座 × "
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 20; height: 32;
                        text: "1"
                        font.pixelSize: 24
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 30
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 37; height: 20;
                        text: "共计 "
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 15; height: 20;
                        text: "¥ "
                        font.pixelSize: 16
                        color: "#ee8732"
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 160; height: 48;
                        text: "780"
                        font.pixelSize: 32
                        color: "#ee8732"
                        horizontalAlignment: Text.AlignLeft
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 30
                        Layout.alignment: Qt.AlignVCenter
                    }
                }

                // 间隔
                Item {
                    Layout.fillHeight: true
                }
            }

            //间距
            Item{
                Layout.preferredHeight: 15
                Layout.alignment: Qt.AlignHCenter
            }

            //选择乘车人
            Text{
                Layout.leftMargin: 17
                text: "选择乘车人"
                font.pixelSize: 14
            }

            //间距
            Item{
                Layout.preferredHeight: 2
                Layout.alignment: Qt.AlignHCenter
            }

            //乘车人信息
            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 15
                border.color: "#b3b3b3"

                //上间距
                Item{
                    id:topSpacing
                    anchors.top: parent.top
                    height: 6
                }

                //滚动卡片区
                ScrollView {
                    id: scrollView
                    anchors.top: topSpacing.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: bottomSpacing.top
                    anchors.rightMargin: 2

                    // 完全自定义滚动条样式
                    ScrollBar.vertical: BasicScrollBar {
                        width: 10
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height - 6
                        policy: ScrollBar.AlwaysOn
                        handleNormalColor: "#a0a0a0"
                        handleLength: 48 // 这里设置你想要的长度
                    }

                    ColumnLayout {
                        width: scrollView.width - 40

                        RowLayout{
                            PassengerCard{
                                Layout.leftMargin: 15
                                Layout.fillWidth: true
                            }

                            //按钮
                            CheckButton{
                                Layout.leftMargin: 15
                            }
                        }
                    }

                }

                //下间距
                Item{
                    id:bottomSpacing
                    anchors.bottom: parent.bottom
                    height: 6
                }
            }

            //间距
            Item{
                height: 15
                width: parent.width
            }

            CustomButton{
                anchors.right: parent.right
                text: "确认订单"
            }
        }
    }
}
