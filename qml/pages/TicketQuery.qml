import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls
import "../components"

Page {
    id:ticketQueryPage
    objectName: "qrc:/qml/pages/TicketQuery.qml"
    width: parent ? parent.width : 1040
    height: parent ? parent.height : 640
    // width: 1040
    // height: 640
    visible: true

    // 定义页面数据
    property alias page: pageData
    QtObject {
        id: pageData
        property string fromCity: "北京"
        property string toCity: "上海"
        property string currentDate: "" // 今天
        property string selectedDate: "" // 用户选中的日期
        property var cityList: []
    }

    //获取当前页面信息
    Component.onCompleted: {
        pageData.currentDate = Qt.formatDate(new Date(), "yyyy年MM月dd日")
        pageData.selectedDate = pageData.currentDate   // 默认选中今天
        pageData.cityList = stationManager.getStationNames()
    }

    // property var cityList: [
    //     "北京", "上海", "广州", "深圳", "成都", "重庆", "杭州", "南京", "武汉", "西安",
    //     "天津", "苏州", "郑州", "长沙", "合肥", "青岛", "沈阳", "大连", "宁波", "厦门",
    //     "福州", "济南", "哈尔滨", "长春", "石家庄", "昆明", "南昌", "贵阳", "太原", "南宁",
    //     "呼和浩特", "兰州", "乌鲁木齐", "海口", "三亚", "拉萨", "银川", "西宁", "香港", "澳门", "台北"
    // ]

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
                        model: pageData.cityList
                        currentIndex: pageData.cityList.indexOf(page.fromCity)
                        onCurrentIndexChanged: page.fromCity = pageData.cityList[currentIndex]
                        Layout.preferredWidth: 160
                        font.pixelSize: 48

                        background: Rectangle {
                            color: "transparent"
                        }

                        contentItem: Text{
                            text: parent.displayText
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            color: "#222"
                            font.pixelSize: 48
                        }
                    }

                    Item { Layout.fillWidth: true }

                    Image {
                        source: "qrc:/resources/icon/TrainIcon.png"
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                // 交换始发地和目的地
                                var tmp = page.fromCity
                                page.fromCity = page.toCity
                                page.toCity = tmp

                                // 同步 ComboBox 选中项
                                fromCombo.currentIndex = pageData.cityList.indexOf(page.fromCity)
                                toCombo.currentIndex = pageData.cityList.indexOf(page.toCity)
                            }
                        }
                    }

                    Item { Layout.fillWidth: true }

                    // 目的地选择
                    ComboBox {
                        id: toCombo
                        model: pageData.cityList
                        currentIndex: pageData.cityList.indexOf(page.toCity)
                        onCurrentIndexChanged: page.toCity = pageData.cityList[currentIndex]
                        Layout.preferredWidth: 160
                        font.pixelSize: 48

                        background: Rectangle {
                            color: "transparent"
                        }

                        contentItem: Text{
                            text: parent.displayText
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignRight
                            color: "#222"
                            font.pixelSize: 48
                        }
                    }
                }

                // 分割线
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    Layout.topMargin: -60
                    color: "#e6e6e6"
                }

                // 日期显示
                RowLayout {
                    Layout.topMargin: -60

                    // 日期文本
                    Text {
                        id: dateText
                        text: page.selectedDate
                        font.pixelSize: 25
                        color: "#222"
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: calendarDialog.open()
                        }
                    }

                    Item{
                        Layout.preferredWidth: 20
                    }

                    Text {
                        Layout.leftMargin: 50
                        text: getDateLabel(page.selectedDate)
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

                Text {
                    text: "调试：" + page.currentDate
                    font.pixelSize: 18
                    color: "red"
                }
            }
        }
    }

    // 日历弹窗（放在Window顶层）
    Dialog {
        id: calendarDialog
        modal: true
        width: 340
        height: 370

        // 居中显示
        x: (ticketQueryPage.width - width) / 2
        y: (ticketQueryPage.height - height) / 2

        MyCalendar {
            id: myCalendar
            anchors.fill: parent
            selectDate: Qt.parseDate(page.currentDate, "yyyy年MM月dd日")
            Connections {
                target: myCalendar
                onSelectDateChanged: function() {
                    page.selectedDate = Qt.formatDate(myCalendar.selectDate, "yyyy年MM月dd日")
                    // console.log("选中日期：", myCalendar.selectDate)
                    calendarDialog.close()
                }
            }
        }
    }

    function parseChineseDate(str) {
        var m = str.match(/^(\d{4})年(\d{1,2})月(\d{1,2})日$/)
        if (!m) return null
        return new Date(Number(m[1]), Number(m[2]) - 1, Number(m[3]))
    }

    function getDateLabel(selectedDateStr) {
        // console.log("getDateLabel参数：", selectedDateStr)
        if (!selectedDateStr || selectedDateStr === "") return "111"
        var selected = parseChineseDate(selectedDateStr)
        if (!selected || isNaN(selected.getTime())) return ""
        var today = parseChineseDate(page.currentDate)
        var todayYMD = new Date(today.getFullYear(), today.getMonth(), today.getDate())
        var selectedYMD = new Date(selected.getFullYear(), selected.getMonth(), selected.getDate())
        var diff = Math.round((selectedYMD - todayYMD) / (24 * 3600 * 1000))
        if (diff === 0) return "今天"
        if (diff === 1) return "明天"
        if (diff === 2) return "后天"
        var weekNames = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
        return weekNames[selectedYMD.getDay()]
    }
}
