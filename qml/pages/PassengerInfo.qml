import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    //整个页面布局
    Row {
        anchors.fill: parent

        //侧边栏
        SideBar {
            id:sideBar
        }

        //主内容
        Rectangle {
            width: parent.width - sideBar.width
            height: parent.height
            anchors.margins: 10
            color: "red"

            //列排序
            Column {
                spacing: 18
                width: parent.width

                anchors.horizontalCenter:  parent.horizontalCenter   //水平居中
                anchors.verticalCenter: parent.verticalCenter // 垂直居中
                anchors.margins: 10

                // 信息卡片1
                Item {
                    width: parent.width
                    height: 79

                    Rectangle {
                        width: parent.width - 70
                        height: parent.height
                        radius: 16
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#cce5ff" }
                            GradientStop { position: 1.0; color: "#8ec9ff" }
                        }
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 14
                            spacing: 6

                            RowLayout {
                                width: parent.width
                                Text {
                                    text: "姓名：王宇豪"
                                    font.pixelSize: 18
                                    color: "#222"
                                }
                                Item { Layout.fillWidth: true }
                                Text {
                                    text: "联系方式：17816936112"
                                    font.pixelSize: 18
                                    color: "#222"
                                    horizontalAlignment: Text.AlignRight
                                    font.underline: false
                                }
                            }

                            RowLayout {
                                width: parent.width
                                Text {
                                    text: "身份证号：412828200507112111"
                                    font.pixelSize: 16
                                    color: "#222"
                                }
                                Item { Layout.fillWidth: true }
                                Text {
                                    text: "优惠类型：学生"
                                    font.pixelSize: 16
                                    color: "#222"
                                    horizontalAlignment: Text.AlignRight
                                }
                            }
                        }
                    }

                    Rectangle {
                        anchors.right: parent.right
                        width: 60
                        height: 60
                        radius: 16
                        color: "#fff"
                        x: mainContent.cardWidth - 60
                        y: (parent.height - height) / 2
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/resources/icon/Edit.png"
                            width: 60
                            height: 60
                        }
                    }
                }

                // 信息卡片2
                Item {
                    width: mainContent.cardWidth
                    height: 79

                    Rectangle {
                        x: 3
                        y: 3
                        width: mainContent.cardWidth - 70
                        height: parent.height
                        radius: 16
                        color: "#b3d1ff"
                        opacity: 0.5
                    }

                    Rectangle {
                        width: mainContent.cardWidth - 70
                        height: parent.height
                        radius: 16
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#cce5ff" }
                            GradientStop { position: 1.0; color: "#8ec9ff" }
                        }
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 14
                            spacing: 6

                            RowLayout {
                                width: parent.width
                                Text {
                                    text: "姓名：李四"
                                    font.pixelSize: 18
                                    color: "#222"
                                }
                                Item { Layout.fillWidth: true }
                                Text {
                                    text: "联系方式：13900000000"
                                    font.pixelSize: 18
                                    color: "#222"
                                    horizontalAlignment: Text.AlignRight
                                }
                            }

                            RowLayout {
                                width: parent.width
                                Text {
                                    text: "身份证号：123456789012345678"
                                    font.pixelSize: 16
                                    color: "#222"
                                }
                                Item { Layout.fillWidth: true }
                                Text {
                                    text: "优惠类型：无"
                                    font.pixelSize: 16
                                    color: "#222"
                                    horizontalAlignment: Text.AlignRight
                                }
                            }
                        }
                    }

                    Rectangle {
                        width: 60
                        height: 60
                        radius: 16
                        color: "#fff"
                        x: mainContent.cardWidth - 60
                        y: (parent.height - height) / 2
                        z: 1
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/resources/icon/Edit.png"
                            width: 60
                            height: 60
                        }
                    }
                }

                // 信息卡片3
                Item {
                    id: card3
                    width: mainContent.cardWidth
                    height: 128

                    Rectangle {
                        x: 3
                        y: 3
                        width: mainContent.cardWidth - 70
                        height: parent.height
                        radius: 16
                        color: "#b3d1ff"
                        opacity: 0.5
                    }

                    Rectangle {
                        width: mainContent.cardWidth - 70
                        height: parent.height
                        radius: 16
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#cce5ff" }
                            GradientStop { position: 1.0; color: "#8ec9ff" }
                        }
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 14
                            spacing: 6

                            RowLayout {
                                width: parent.width
                                Text {
                                    text: "姓名：张三"
                                    font.pixelSize: 18
                                    color: "#222"
                                }
                                Item { Layout.fillWidth: true }
                                Text {
                                    text: "联系方式：18888888888"
                                    font.pixelSize: 18
                                    color: "#222"
                                    horizontalAlignment: Text.AlignRight
                                }
                            }

                            RowLayout {
                                width: parent.width
                                Text {
                                    text: "身份证号：987654321098765432"
                                    font.pixelSize: 16
                                    color: "#222"
                                }
                                Item { Layout.fillWidth: true }
                                Text {
                                    text: "优惠类型：儿童"
                                    font.pixelSize: 16
                                    color: "#222"
                                    horizontalAlignment: Text.AlignRight
                                }
                            }

                            Text {
                                text: "备注：本乘客为儿童，需监护人陪同"
                                font.pixelSize: 14
                                color: "#555"
                            }
                        }
                    }

                    Rectangle {
                        width: 60
                        height: 60
                        radius: 166
                        color: "#fff"
                        x: mainContent.cardWidth - 60
                        y: (parent.height - height) / 2
                        z: 1
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/resources/icon/Edit.png"
                            width: 60
                            height: 60
                        }
                    }
                }


            }
        }
    }
}
