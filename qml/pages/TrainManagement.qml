import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Page {
    width: parent ? parent.width : 960
    height: parent ? parent.height : 720
    id:trainManagementPage
    objectName: "qrc:/qml/pages/TrainManagement.qml"
    visible: true

    property var mainWindow
    property var rawTrainList: []
    property var trainList: []
    property var onWarningConfirmed: null
    property string warningMessage: ""
    property string notificationMessage: ""

    Component.onCompleted: {
        refreshTrains()
    }

    RowLayout {
        anchors.fill: parent

        // 主内容区
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.topMargin: 20
                spacing: 0

                // 车次卡片区（ListView放在Rectangle里）
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: trainManagementPage.height - 120

                    ListView {
                        id: trainListView
                        anchors.fill: parent
                        model: trainList
                        spacing: 15
                        clip: true

                        // 完全自定义滚动条样式
                        ScrollBar.vertical: BasicScrollBar {
                            width: 8
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            height: parent.height - 8
                            policy: ScrollBar.AlwaysOn
                            handleNormalColor: "#a0a0a0"
                            handleLength: 60 // 这里设置想要的长度
                        }

                        delegate: RowLayout {
                            width: trainListView.width

                            // 左侧按钮区
                            ColumnLayout {
                                width: 100
                                spacing: 10
                                Layout.leftMargin: 2
                                // verticalCenter: parent.verticalCenter

                                CustomButton {
                                    text: "时刻表"
                                    width: 90
                                    height: 26
                                    fontSize: 15
                                    borderRadius: 7
                                    buttonType: "confirm"
                                    onClicked: {
                                        // showTimetable(trainNo)
                                        // 打开时刻表窗口
                                        timetableLoader.source = "Timetable.qml"
                                        timetableLoader.active = true
                                    }
                                }
                                CustomButton {
                                    text: "座位模板"
                                    width: 90
                                    height: 26
                                    fontSize: 15
                                    borderRadius: 7
                                    buttonType: "confirm"
                                }
                            }

                            Item{
                                Layout.preferredWidth: 2
                            }

                            // 车次卡片内容
                            TrainCard {
                                Layout.fillWidth: true
                                trainData: modelData
                            }

                            Item{
                                Layout.preferredWidth: 10
                            }

                            // 右侧删除按钮
                            Rectangle {
                                Layout.rightMargin: 30
                                width: 30
                                height: 30
                                radius: 18
                                color: "transparent"
                                border.color: "transparent"
                                Image {
                                    source: "qrc:/resources/icon/Delete.png"
                                    anchors.centerIn: parent
                                    width: 60
                                    height: 60
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        onWarningConfirmed = function() {
                                            warning.active = false
                                            deleteTrain(modelData.trainNumber);
                                        }
                                        warningMessage = "确认删除该车次？"
                                        warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                                        warning.active = true
                                    }
                                }
                            }
                        }
                    }
                }

                // 分割线
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    Layout.rightMargin: 30
                    Layout.topMargin: 0
                    color: "#cce5ff"
                }

                // 搜索框和添加按钮区
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 48
                    Layout.bottomMargin: 20
                    spacing: 15

                    // 搜索框
                    SearchBar{
                        id: searchTrainNumber
                        inputHeight: 30
                        width: 185
                        fontSize: 14
                        placeholderText: "查找车次号"
                        onTextChanged: filterTrainList()
                    }
                    SearchBar{
                        id: searchStartStationName
                        inputHeight: 30
                        width: 185
                        fontSize: 14
                        placeholderText: "查找起始站"
                        onTextChanged: filterTrainList()
                    }
                    SearchBar{
                        id: searchEndStationName
                        inputHeight: 30
                        width: 185
                        fontSize: 14
                        placeholderText: "查找终点站"
                        onTextChanged: filterTrainList()
                    }

                    Item { Layout.fillWidth: true }

                    // 添加按钮
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

                            }
                        }
                    }
                }
            }
        }
    }

    Loader {
        id: warning
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接关闭信号
                item.canceled.connect(function() {
                    warning.active = false
                })
                // 连接确认信号
                if (item && typeof onWarningConfirmed === "function")
                    item.confirmed.connect(onWarningConfirmed)
                // 初始化参数
                item.contentText = warningMessage
                item.visible = true
            }
        }
    }

    Loader {
        id: notification
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接关闭信号
                item.closed.connect(function() {
                    notification.active = false
                })
                // 初始化参数
                item.contentText = notificationMessage
                item.visible = true
            }
        }
    }

    //时刻表页面
    Loader {
        id: timetableLoader
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接关闭信号
                item.closed.connect(function() {
                    console.log("!!!!!!!!!!!!!!!!!!!!")
                    timetableLoader.active = false
                })
                // 初始化参数
                item.transientParent = mainWindow
                item.visible = true
            }
        }
    }

    function refreshTrains() {
        var savedContentY = trainListView.contentY
        rawTrainList = trainManager.getTrains_api()
        filterTrainList()
        trainListView.contentY = savedContentY
    }

    function deleteTrain(trainNumber) {
        var result = trainManager.deleteTrain_api(trainNumber)
        refreshTrains()
        notificationMessage = result["success"] === true ? "车次删除成功!" : "车次删除失败！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }

    function filterTrainList() {
        trainList = rawTrainList.filter(function(train) {
            return (searchTrainNumber.text === "" || (train.trainNumber && train.trainNumber.indexOf(searchTrainNumber.text) !== -1))
                && (searchStartStationName.text === "" || (train.startStationName && train.startStationName.indexOf(searchStartStationName.text) !== -1))
                && (searchEndStationName.text === "" || (train.endStationName && train.endStationName.indexOf(searchEndStationName.text) !== -1))
        });
    }

}
