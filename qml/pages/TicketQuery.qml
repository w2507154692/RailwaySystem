import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 1280; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    RowLayout {
        anchors.fill: parent

        SideBar {
            Layout.preferredWidth: 220
            Layout.fillHeight: true   // 让SideBar自动填满高度
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 170
                anchors.rightMargin: 190
                spacing: 32

                Item {
                    Layout.fillHeight: true
                }

                RowLayout {
                    Text {
                        text: "北京"
                        font.pixelSize: 48
                        color: "#222"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Image {
                        source: "qrc:/resources/icon/TrainIcon.png"
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text {
                        text: "上海"
                        font.pixelSize: 48
                        color: "#222"

                    }
                }

                // 分割线
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    Layout.topMargin: -60
                    color: "#e6e6e6"
                }

                // 日期
                RowLayout {
                    Layout.topMargin: -60

                    Text {
                        text: "6月30日"
                        font.pixelSize: 25
                        color: "#222"
                    }

                    Text {
                        Layout.leftMargin: 50
                        text: "今天"
                        font.pixelSize: 25
                        color: "#656565"
                    }
                }

                // 按钮
                CustomButton {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 75
                    Layout.topMargin: -20
                    text: "查询车票"
                    textColor: "white"
                    fontSize: 30
                    customColor: "#3B99FB"
                }

                // 历史记录
                RowLayout {
                    Layout.topMargin: -10

                    Text {
                        text: "北京--嘉兴南"
                        font.pixelSize: 20
                        color: "#ACACAC"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text {
                        text: "北京--嘉兴南"
                        font.pixelSize: 20
                        color: "#ACACAC"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text {
                        text: "北京--嘉兴南"
                        font.pixelSize: 20
                        color: "#ACACAC"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text {
                        text: "清除历史"
                        font.pixelSize: 20
                        color: "#ACACAC"
                    }
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
