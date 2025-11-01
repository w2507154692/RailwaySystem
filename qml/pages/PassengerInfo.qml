import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Page {
    id: passengerInfoPage
    objectName:"qrc:/qml/pages/PassengerInfo.qml"
    width: 1080; height: 720

    RowLayout {
        anchors.fill: parent

        // 主内容区
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            // 滚动卡片区
            ScrollView {
                anchors.fill: parent
                contentWidth: parent.width

                ColumnLayout {
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 30

                    // 卡片列表
                    Repeater {
                        model: passengerModel
                        delegate: RowLayout {
                            Layout.fillWidth: true
                            PassengerCard {
                                Layout.fillWidth: true
                                // 可在 PassengerCard 内定义属性绑定 modelData
                            }
                            Rectangle {
                                Layout.preferredWidth: 48
                                Layout.preferredHeight: 48
                                radius: 12
                                color: "#fff"
                                border.color: "#cce5ff"
                                Image {
                                    anchors.centerIn: parent
                                    source: "qrc:/resources/icon/Edit.png"
                                    width: 32; height: 32
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        // 打开编辑页面/弹窗
                                        StackView.view.push({
                                            item: Qt.resolvedUrl("qrc:/qml/pages/PersonalInfoDialog.qml"),
                                            properties: {
                                                name: model.name,
                                                idCard: model.idCard,
                                                phone: model.phone
                                            }
                                        })
                                    }
                                }
                            }
                        }
                    }

                    CustomButton {
                        Layout.preferredWidth: 160
                        Layout.preferredHeight: 44
                        text: "新增乘车人"
                        onClicked: {
                            StackView.view.push({
                                item: Qt.resolvedUrl("qrc:/qml/pages/AddUserDialog.qml")
                            })
                        }
                    }
                }
            }
        }
    }

    // 示例乘车人模型
    ListModel {
        id: passengerModel
        ListElement { name: "张三"; idCard: "123456"; phone: "13800000000" }
        ListElement { name: "李四"; idCard: "223456"; phone: "13900000000" }
        ListElement { name: "王五"; idCard: "323456"; phone: "13700000000" }
    }
}
