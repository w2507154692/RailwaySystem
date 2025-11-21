import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"
import MyApp 1.0

Page {
    id: passengerInfoPage
    property var mainWindow
    objectName:"qrc:/qml/pages/PassengerInfo.qml"
    width: parent ? parent.width :640
    height: parent ? parent.height : 400

    property var rawPassengerList: []
    property var passengerList: []

    Component.onCompleted: {
        refreshPassengers()
    }

    // 主内容区
    Rectangle {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.leftMargin: 20

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: passengerInfoPage.height - 70
                Layout.alignment: Qt.AlignTop

                // 滚动卡片区
                ListView {
                    id: passengerListView
                    model: passengerList
                    clip: true
                    spacing: 15
                    anchors.fill: parent
                    anchors.topMargin: 20
                    anchors.bottomMargin: 20

                    // 完全自定义滚动条样式
                    ScrollBar.vertical: BasicScrollBar {
                        width: 8
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height - 8
                        policy: ScrollBar.AlwaysOn
                        handleNormalColor: "#a0a0a0"
                        handleLength: 60 // 这里设置你想要的长度
                    }

                    delegate: ColumnLayout {
                        width: passengerListView.width - 15

                        // 卡片列表
                        RowLayout{
                            Layout.fillWidth: true
                            // 删除按钮
                            Rectangle {
                                Layout.rightMargin: 15
                                Layout.preferredWidth: 30
                                Layout.preferredHeight: 30
                                radius: 18
                                border.color: "transparent"
                                MouseArea {
                                    id: mouseAreaDelete
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        warning.onConfirmed = function() {
                                            warning.active = false
                                            deletePassenger(SessionState.username, modelData.id)
                                        }
                                        warning.message = "确认删除该乘车人？"
                                        warning.source = "qrc:/qml/components/ConfirmCancelDialog.qml"
                                        warning.active = true
                                    }
                                }
                                Image {
                                    source: "qrc:/resources/icon/Delete.png"
                                    anchors.centerIn: parent
                                    width: 70
                                    height: 70
                                }
                            }

                            PassengerCard {
                                Layout.fillWidth: true
                                passengerData: modelData
                            }
                            // 编辑按钮
                            Rectangle {
                                Layout.preferredWidth: 60
                                Layout.preferredHeight: 60
                                radius: 16
                                color: "#fff"
                                MouseArea {
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        editPassengerInfoDialog.initialName = modelData.name
                                        editPassengerInfoDialog.initialPhoneNumber = modelData.phoneNumber
                                        editPassengerInfoDialog.initialId = modelData.id
                                        editPassengerInfoDialog.initialType = modelData.type
                                        editPassengerInfoDialog.onConfirmed = function(name, phoneNumber, id, type) {
                                            editPassengerInfo(modelData.id, name, phoneNumber, id, type)
                                        }

                                        editPassengerInfoDialog.source = "qrc:/qml/pages/EditPassengerInfoDialog.qml"
                                        editPassengerInfoDialog.active = true
                                    }
                                }
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

            // 分割线
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                Layout.rightMargin: 30
                Layout.topMargin: -20
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
                    id: searchName
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找姓名"
                    onTextChanged: filterPassengerList()
                }
                SearchBar{
                    id: searchPhoneNumber
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找联系方式"
                    onTextChanged: filterPassengerList()
                }
                SearchBar{
                    id: searchId
                    inputHeight: 30
                    width: 185
                    fontSize: 14
                    placeholderText: "查找身份证号"
                    onTextChanged: filterPassengerList()
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

    Loader {
        property string message: ""
        property var onConfirmed: null
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
                item.confirmed.connect(onConfirmed)
                // 初始化参数
                item.contentText = message
                item.visible = true
            }
        }
    }

    Loader {
        property string message: ""
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
                item.contentText = message
                item.visible = true
            }
        }
    }


    // 修改
    Loader {
        property string initialName: ""
        property string initialPhoneNumber: ""
        property string initialId: ""
        property string initialType: ""
        property var onConfirmed: null
        id: editPassengerInfoDialog
        source: ""
        active: false
        onLoaded: {
            if (item) {
                // 连接取消信号
                item.canceled.connect(function() {
                    editPassengerInfoDialog.active = false
                })
                // 连接确认信号
                item.confirmed.connect(onConfirmed)
                //初始化参数
                item.initialName = initialName
                item.initialPhoneNumber = initialPhoneNumber
                item.initialId = initialId
                item.initialType = initialType
                item.visible = true
            }
        }
    }


    function refreshPassengers() {
        var savedContentY = passengerListView.contentY
        rawPassengerList = passengerManager.getPassengersByUsername_api(SessionState.username)
        filterPassengerList()
        passengerListView.contentY = savedContentY
    }

    function deletePassenger(username, id) {
        passengerManager.deletePassengerByUsernameAndId_api(username, id)
        refreshPassengers(username)
        notification.message = "乘车人删除成功！"
        notification.source = "qrc:/qml/components/ConfirmDialog.qml"
        notification.active = true
    }

    function filterPassengerList() {
        passengerList = rawPassengerList.filter(function(passenger) {
            return (searchName.text === "" || (passenger.name && passenger.name.indexOf(searchName.text) !== -1))
                && (searchPhoneNumber.text === "" || (passenger.phoneNumber && passenger.phoneNumber.indexOf(searchPhoneNumber.text) !== -1))
                && (searchId.text === "" || (passenger.id && passenger.id.indexOf(searchId.text) !== -1))
        });
    }

    function editPassengerInfo(id_old, name, phoneNumber, id_new, type) {
        if (name === "") {
            notification.message = "姓名不能为空！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }
        if (phoneNumber === "") {
            notification.message = "联系方式不能为空！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }
        if (phoneNumber.length !== 11) {
            notification.message = "联系方式不合法！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }
        if (id_new === "") {
            notification.message = "身份证号不能为空！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }
        if (id_new.length !== 18 || !(id_new.indexOf('x') === -1 || id_new.indexOf('x') === id_new.length - 1)) {
            notification.message = "身份证号不合法！"
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            return
        }

        var result = passengerManager.editPassenger_api(SessionState.username, id_old, name, phoneNumber, id_new, type)
        if (result.success) {
            notification.message = result.message
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
            editPassengerInfoDialog.active = false
            refreshPassengers()
        }
        else {
            notification.message = result.message
            notification.source = "qrc:/qml/components/ConfirmDialog.qml"
            notification.active = true
        }
    }
}
