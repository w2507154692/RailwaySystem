import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Page {
    id:ticketQueryPage
    objectName: "qrc:/qml/pages/TicketQuery.qml"
    width: 1080; height: 720
    visible: true

    RowLayout {
        anchors.fill: parent
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
                    Text { text: page.fromCity; font.pixelSize: 48; color: "#222" }

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

                    Text { text: page.toCity; font.pixelSize: 48; color: "#222" }
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
                        text: page.currentDate
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
                    onClicked: {
                        // 传参给结果页
                        stackView.push({
                            item: Qt.resolvedUrl("qrc:/qml/pages/TicketQueryResult.qml"),
                            properties: {
                                fromCity: page.fromCity,
                                toCity: page.toCity,
                                date: page.currentDate
                            }
                        })
                    }
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
