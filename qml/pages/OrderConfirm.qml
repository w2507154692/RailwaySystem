import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import Qt5Compat.GraphicalEffects

Window {
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    //头部
    Rectangle{
        width: parent.width
        height: 150
        color: "#3B99FB"
        //文本
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 30
            text: "确定订单"
            font.pixelSize: 30
            color: "#fff"
        }
        //取消按钮
        Image {
            id: closeBtn
            source: "qrc:/resources/icon/Cancel.png"
            width: 60
            height: 60
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 16
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
        height: parent.height - 90
        anchors.top: parent.top
        anchors.topMargin: 90
        border.color: "#4d4d4d"
        radius: 20
        ColumnLayout{
            anchors.fill: parent
            anchors.margins: 20
            spacing: 0
            //订单信息
            Rectangle {
                height: 80
                Layout.fillWidth: true
                radius: 10
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ffffff" }
                    GradientStop { position: 1.0; color: "#cce5ff" }
                }
                RowLayout {
                    anchors.fill: parent
                    spacing: 0
                    Layout.preferredWidth: 1000

                    // 间隔
                    Item {
                        Layout.preferredWidth: 80
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 出发时间
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 100
                        Text {
                            width: 100; height: 39;
                            text: "09:10"; font.bold: false; font.pixelSize: 30; color: "#222";
                            horizontalAlignment: Text.AlignLeft
                            Layout.alignment: Qt.AlignLeft
                        }
                        Text {
                            width: 100; height: 15;
                            text: "北京南（始）"; font.pixelSize: 10; color: "#222";
                            horizontalAlignment: Text.AlignLeft
                            Layout.alignment: Qt.AlignLeft
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 50
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 车次、箭头、时刻表
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 70
                        Text {
                            width: 70; height: 23;
                            text: "G115"; font.bold: false;
                            font.pixelSize: 22; color: "#222";
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Image {
                            source: "qrc:/resources/icon/arrow.svg"
                            width: 60; height: 10
                            fillMode: Image.PreserveAspectFit
                            Layout.alignment: Qt.AlignHCenter
                        }
                        Text {
                            width: 60; height: 15;
                            text: "6小时7分"; font.pixelSize: 10;
                            color: "#888";
                            horizontalAlignment: Text.AlignHCenter
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 50
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 到达时间
                    ColumnLayout {
                        spacing: 2
                        Layout.preferredWidth: 100
                        Text {
                            width: 100; height: 39;
                            text: "15:17"; font.bold: false; font.pixelSize: 30; color: "#222";
                            horizontalAlignment: Text.AlignRight
                            Layout.alignment: Qt.AlignRight
                        }
                        Text {
                            width: 100; height: 15;
                            text: "上海虹桥（终）"; font.pixelSize: 10; color: "#222";
                            horizontalAlignment: Text.AlignRight
                            Layout.alignment: Qt.AlignRight
                        }
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 80
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 87; height: 26;
                        text: "二等座 × "
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 25; height: 40;
                        text: "1"
                        font.pixelSize: 30
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 50
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 46; height: 26;
                        text: "共计 "
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 18; height: 26;
                        text: "¥ "
                        font.pixelSize: 20
                        color: "#ee8732"
                        horizontalAlignment: Text.AlignHCenter
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text {
                        width: 200; height: 60;
                        text: "780"
                        font.pixelSize: 40
                        color: "#ee8732"
                        horizontalAlignment: Text.AlignLeft
                        Layout.alignment: Qt.AlignVCenter
                    }

                    // 间隔
                    Item {
                        Layout.preferredWidth: 50
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
                Layout.preferredHeight: 20
                Layout.alignment: Qt.AlignHCenter
            }

            //选择乘车人
            Text{
                text: "选择乘车人"
                font.pixelSize: 15
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
                radius: 20
                border.color: "#b3b3b3"

                //上间距
                Item{
                    id:topSpacing
                    anchors.top: parent.top
                    height: 8
                }

                //滚动卡片区
                ScrollView {
                    anchors.top: topSpacing.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: bottomSpacing.top
                    anchors.rightMargin: 2

                    // 完全自定义滚动条样式
                    ScrollBar.vertical: BasicScrollBar {
                        width: 12
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height - 8
                        policy: ScrollBar.AlwaysOn
                        handleNormalColor: "#a0a0a0"
                        handleLength: 60 // 这里设置你想要的长度
                    }

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 50
                        anchors.rightMargin: 30



                        RowLayout{
                            Layout.preferredWidth: 880
                            PassengerCard{
                                width: 700
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            //按钮
                            CheckButton{
                            }
                        }

                        RowLayout{
                            Layout.preferredWidth: 880
                            PassengerCard{
                                width: 700
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            //按钮
                            CheckButton{
                            }
                        }

                        RowLayout{
                            Layout.preferredWidth: 880
                            PassengerCard{
                                width: 700
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            //按钮
                            CheckButton{
                            }
                        }

                        RowLayout{
                            Layout.preferredWidth: 880
                            PassengerCard{
                                width: 700
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            //按钮
                            CheckButton{
                            }
                        }

                        RowLayout{
                            Layout.preferredWidth: 880
                            PassengerCard{
                                width: 700
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            //按钮
                            CheckButton{
                            }
                        }

                        RowLayout{
                            Layout.preferredWidth: 880
                            PassengerCard{
                                width: 700
                            }

                            //间隔
                            Item{
                                Layout.fillWidth: true
                            }

                            //按钮
                            CheckButton{
                            }
                        }
                    }

                }

                //下间距
                Item{
                    id:bottomSpacing
                    anchors.bottom: parent.bottom
                    height: 8
                }
            }

            //间距
            Item{
                height: 20
                width: parent.width
            }

            CustomButton{
                anchors.right: parent.right
                text: "确认订单"
            }
        }
    }
}
