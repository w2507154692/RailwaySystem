import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 400; height: 520
    visible: true
    color: "#ffffff"

    signal closed()
    property var timetable: []

    onClosing: {
        closed()
    }

    Rectangle {
        anchors.fill: parent
        radius: 16
        color: "#ffffff"
        border.color: "#222"
        border.width: 1

        ColumnLayout{
            anchors.fill: parent
            spacing:0

            // 标题栏
            Rectangle {
                Layout.fillWidth: true
                height: 40
                radius: 16
                Layout.leftMargin: 1
                Layout.rightMargin: 1
                Layout.topMargin: 1
                Text {
                    id: trainNumber
                    text: "G115"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 28
                    font.bold: true
                }
                // 编辑按钮(装饰)
                Image {
                    source: "qrc:/resources/icon/Edit.png" // 换成你的资源路径
                    width: 40
                    height: 40
                    anchors.left: parent.horizontalCenter
                    anchors.leftMargin: 40
                    anchors.verticalCenter: parent.verticalCenter
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        // onClicked: ...
                    }
                }
            }

            //间隔符
            Rectangle{
                Layout.fillWidth: true
                height: 2
                color: "#222"
            }

            //时刻表
            TimetableView{
                id: timetableView
                Layout.fillWidth: true
                Layout.preferredHeight: 350
                borderWidth: 0
                Layout.leftMargin: 2
                Layout.rightMargin: 2
                Layout.topMargin: 4
                passingStationList: timetable
            }

            Item {
                Layout.fillHeight: true
            }

            // 新增按钮
            Rectangle {
                width: 38
                height: 38
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 30
                Layout.topMargin: 4

                Image {
                    source: "qrc:/resources/icon/Add.png" // 换成你的加号图标资源路径
                    anchors.centerIn: parent
                    width: 50
                    height: 50
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        stationList.push({ name: "", arrive: "", depart: "", stop: "", checked: true })
                    }
                }
            }

            Item {
                Layout.preferredHeight: 10
            }

            // 按钮区
            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: 10
                Layout.bottomMargin: 25

                Item {
                    Layout.preferredWidth: 30
                }
                // 确认按钮
                CustomButton{
                    buttonType: "confirm"
                    text: "确认"
                    borderRadius: 4
                    height: 26
                    width:130
                    fontSize:14
                    onClicked: submit(trainNumber.text, timetableView.passingStationList)
                }

                Item { Layout.fillWidth: true }

                // 取消按钮
                CustomButton{
                    buttonType: "cancel"
                    text: "取消"
                    borderRadius: 4
                    height: 26
                    width:130
                    fontSize:14
                }

                Item { Layout.preferredWidth: 30}
            }
        }
    }

    //通知
    Loader {
        property string message: ""
        id: notification
        source: "qrc:/qml/components/ConfirmDialog.qml"
        active: false
        onLoaded: {
            if (item) {
                // 连接关闭信号
                item.closed.connect(function() {
                    notification.active = false
                })
                // 初始化参数
                item.contentText = message
                item.visible = true
            }
        }
    }

    function isLegal(list) {

        // 长度为 <=1 不合法
        if (list.length <= 1) {
            notification.message = "起末站不完整！"
            notification.active = true;
            return false
        }

        var stationFlag = {}
        // 每一站依次判断
        for (var i = 0; i < list.length; i++) {
            var stationName = list[i].stationName
            var arriveHour = list[i].arriveHour
            var arriveMinute = list[i].arriveMinute
            var arriveDay = list[i].arriveDay
            var departureHour = list[i].departureHour
            var departureMinute = list[i].departureMinute
            var departureDay = list[i].departureDay
            // 判断站名是否缺失
            if (stationName === "") {
                notification.message = "第" + (i + 1) + "站站名缺失！"
                notification.active = true
                return false
            }
            // 判断是否重复经过某一站
            if (stationFlag[stationName]) {
                notification.message = "重复经过" + stationName + "站！"
                notification.active = true
                return false
            }
            // 记录经过了此站
            stationFlag[stationName] = true
            // 判断起始站各时间字段是否合法
            if (i == 0 && (arriveHour !== -1 || arriveMinute !== -1 || arriveDay !== -1 ||
                           departureHour === -1 || departureMinute === -1 || departureDay === -1)) {
                notification.message = "第" + (i + 1) + "站时刻项错误！"
                notification.active = true
                return false
            }
            // 判断终点站各时间字段是否合法
            if (i == list.length - 1 && (arriveHour === -1 || arriveMinute === -1 || arriveDay === -1 ||
                           departureHour !== -1 || departureMinute !== -1 || departureDay !== -1)) {
                notification.message = "第" + (i + 1) + "站时刻项错误！"
                notification.active = true
                return false
            }
            // 判断中间站各时间字段是否合法
            if (i != 0 && i != list.length - 1 && (arriveHour === -1 || arriveMinute === -1 || arriveDay === -1 ||
                           departureHour === -1 || departureMinute === -1 || departureDay === -1)) {
                notification.message = "第" + (i + 1) + "站时刻项错误！"
                notification.active = true
                return false
            }

            // 判断中间站的到时是不是在发时的前面
            if (i != 0 && i != list.length - 1 && (arriveDay > departureDay ||
                (arriveDay === departureDay && arriveHour > departureHour) ||
                (arriveDay === departureDay && arriveHour === departureHour && arriveMinute >= departureMinute))) {
                notification.message = "第" + (i + 1) + "站到时应在发时之前！"
                notification.active = true
                return false
            }

            // 判断该站的到时是不是在上一站发时的后面
            if (i > 0 && (arriveDay < list[i - 1].departureDay ||
                (arriveDay === list[i - 1].departureDay && arriveHour < list[i - 1].departureHour) ||
                (arriveDay === list[i - 1].departureDay && arriveHour === list[i - 1].departureHour && arriveMinute <= list[i - 1].departureMinute))) {
                notification.message = "第" + (i + 1) + "站到时应在上一站发时之后！"
                notification.active = true
                return false
            }
        }
        return true
    }


    function submit(trainNumber, passingStationList) {
        if (isLegal(passingStationList)) {
            console.log("时刻表信息正确！！")
        }
    }
}
