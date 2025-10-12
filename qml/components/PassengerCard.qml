import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    width: 800
    height: 79

    // 卡片 + 按钮
    RowLayout {
        anchors.fill: parent

        // 卡片
        Rectangle {
            Layout.preferredWidth: parent.width - 70
            Layout.preferredHeight: parent.height
            radius: 16
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#cce5ff" }
                GradientStop { position: 1.0; color: "#8ec9ff" }
            }
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter


            // 一列文本 + 一列文本
            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.rightMargin: 20

                // 间隔
                Item {
                    Layout.preferredWidth: 20
                    Layout.alignment: Qt.AlignVCenter
                }

                // 一行文本 + 一行文本
                ColumnLayout {

                    // 第一行文本
                    RowLayout {
                        Text {
                            Layout.preferredWidth: 54
                            Layout.preferredHeight: 23
                            text: "姓名："
                            font.pixelSize: 18
                            color: "#222"
                        }

                        Text {
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: 23
                            text: "王宇豪"
                            font.pixelSize: 18
                            color: "#222"
                        }
                    }
                    // 第二行文本
                    RowLayout {
                        Text {
                            Layout.preferredWidth: 90
                            Layout.preferredHeight: 23
                            text: "身份证号："
                            font.pixelSize: 18
                            color: "#222"
                        }

                        Text {
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: 23
                            text: "412828200507112111"
                            font.pixelSize: 18
                            color: "#222"
                        }
                    }
                }

                // 一行文本 + 一行文本
                ColumnLayout {

                    // 第一行文本
                    RowLayout {
                        Text {
                            Layout.preferredWidth: 70
                            Layout.preferredHeight: 23
                            text: "手机号："
                            font.pixelSize: 18
                            color: "#222"
                        }

                        Text {
                            Layout.preferredWidth: 150
                            Layout.preferredHeight: 23
                            text: "17816936112"
                            font.pixelSize: 18
                            color: "#222"
                        }
                    }
                    // 第二行文本
                    RowLayout {
                        Text {
                            Layout.preferredWidth: 90
                            Layout.preferredHeight: 23
                            text: "优惠类别："
                            font.pixelSize: 18
                            color: "#222"
                        }

                        Text {
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: 23
                            text: "学生"
                            font.pixelSize: 18
                            color: "#222"
                        }
                    }
                }
            }
        }

        // 按钮
        Rectangle {
            Layout.preferredWidth: 60
            Layout.preferredHeight: 60
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

}
