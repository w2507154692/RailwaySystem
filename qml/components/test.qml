import QtQuick
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts 1.15
import "../components"

Page {
    id:ticketQueryPage
    objectName: "qrc:/qml/pages/TicketQuery.qml"
    width: parent ? parent.width : 1040
    height: parent ? parent.height : 640
    visible: true

    // 定义页面数据
    property alias page: pageData
    QtObject {
        id: pageData
        property string fromCity: "北京"
        property string toCity: "上海"
        property string currentDate: "2025年11月2日"
    }

    property var cityList: [
        "北京", "上海", "广州", "深圳", "成都", "重庆", "杭州", "南京", "武汉", "西安",
        "天津", "苏州", "郑州", "长沙", "合肥", "青岛", "沈阳", "大连", "宁波", "厦门",
        "福州", "济南", "哈尔滨", "长春", "石家庄", "昆明", "南昌", "贵阳", "太原", "南宁",
        "呼和浩特", "兰州", "乌鲁木齐", "海口", "三亚", "拉萨", "银川", "西宁", "香港", "澳门", "台北"
    ]

    RowLayout {
        anchors.fill: parent
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: false   // 保证弹出菜单不被裁剪

            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 110
                anchors.rightMargin: 130
                spacing: 32

                Item {
                    Layout.fillHeight: true
                }

                RowLayout {
                    // 始发地选择
                    ComboBox {
                        id: fromCombo
                        model: cityList
                        currentIndex: cityList.indexOf(page.fromCity)
                        onCurrentIndexChanged: page.fromCity = cityList[currentIndex]
                        Layout.preferredWidth: 160
                        font.pixelSize: 48
                    }

                    Item { Layout.fillWidth: true }

                    Image {
                        source: "qrc:/resources/icon/TrainIcon.png"
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                    }

                    Item { Layout.fillWidth: true }

                    // 目的地选择
                    ComboBox {
                        id: toCombo
                        model: cityList
                        currentIndex: cityList.indexOf(page.toCity)
                        onCurrentIndexChanged: page.toCity = cityList[currentIndex]
                        Layout.preferredWidth: 160
                        font.pixelSize: 48
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
                    Layout.preferredHeight: 72
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
                        font.pixelSize: 18
                        color: "#ACACAC"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text {
                        text: "北京--嘉兴南"
                        font.pixelSize: 18
                        color: "#ACACAC"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text {
                        text: "北京--嘉兴南"
                        font.pixelSize: 18
                        color: "#ACACAC"
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text {
                        text: "清除历史"
                        font.pixelSize: 18
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
