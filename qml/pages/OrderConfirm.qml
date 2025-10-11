import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

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
        color: "pink"
        Column{
            anchors.fill: parent
            anchors.margins: 20
            spacing: 0
            //订单信息
            Rectangle{
                height: 80
                width: parent.width
                radius: 10
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ffffff" }
                    GradientStop { position: 1.0; color: "#cce5ff" }
                }
                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // 出发时间
                    Column {
                        spacing: 2
                        Text { text: "09:10"; font.bold: false; font.pixelSize: 30; color: "#222" }
                        Text { text: "北京南（始）"; font.pixelSize: 10; color: "#222"; horizontalAlignment: Text.AlignHCenter }
                    }

                    //间隔
                    Item{
                        width: 50
                        height: 1
                    }

                    // 车次、箭头、时刻表
                    Column {
                        spacing: 2
                        anchors.verticalCenter: parent.verticalCenter
                        Text { text: "G115"; font.bold: false; font.pixelSize: 22; color: "#222"; horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter}
                        Image {
                            source: "qrc:/resources/icon/arrow.svg"
                            width: 100
                            height: 10
                            fillMode: Image.PreserveAspectFit
                        }
                        Text { text: "6小时7分"; font.pixelSize: 10; color: "#888"; horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter}
                    }

                    //间隔
                    Item{
                        width: 50
                        height: 1
                    }

                    // 到达时间
                    Column {
                        spacing: 2
                        Text { text: "15:17"; font.bold: false; font.pixelSize: 30; color: "#222" }
                        Text { text: "上海虹桥（过）"; font.pixelSize: 10; color: "#222"; horizontalAlignment: Text.AlignHCenter }
                    }

                    //间隔
                    Item{
                        width: 50
                        height: 1
                    }

                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        text: "二等座 × "
                        font.pixelSize: 20
                    }


                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        text: "1"
                        font.pixelSize: 30
                    }

                    //间隔
                    Item{
                        width: 50
                        height: 1
                    }

                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        text: "共计 "
                        font.pixelSize: 20
                    }

                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        text: "¥ "
                        font.pixelSize: 20
                        color: "#ee8732"
                    }

                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        text: "780"
                        font.pixelSize: 40
                        color: "#ee8732"

                    }
                }
            }

            //间距
            Item{
                height: 20
                width: parent.width
            }

            //选择乘车人
            Text{
                text: "选择乘车人"
                font.pixelSize: 15
            }

            //间距
            Item{
                height: 2
                width: parent.width
            }

            //乘车人信息
            Rectangle{
                height:parent.height - 185
                width: parent.width
                radius: 20
                border.color: "#b3b3b3"

                //主内容
                Column{
                    anchors.fill:parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.margins: 10
                    spacing: 30
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Rectangle{
                            height: 50
                            width: 50
                            color: "yellow"
                        }
                        Rectangle{
                            height: 50
                            width: 50
                            color: "blue"
                        }
                    }

                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        Rectangle{
                            height: 50
                            width: 50
                            color: "blue"
                        }
                        Rectangle{
                            height: 50
                            width: 50
                            color: "yellow"
                        }
                    }
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
