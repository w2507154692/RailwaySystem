import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 400; height: 600
    minimumWidth: 400; minimumHeight: 260;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    Rectangle {
        id: dialog
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
                Layout.fillWidth: true
                height: 450
                borderWidth:0
                Layout.leftMargin: 2
                Layout.rightMargin: 2
                Layout.topMargin: 4
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


            // 按钮区
            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: 10
                Item { Layout.preferredWidth: 30}
                // 确认按钮
                CustomButton{
                    buttonType: "confirm"
                    text: "确认"
                    borderRadius: 4
                    height: 26
                    width:130
                    fontSize:14
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

            Item{
                Layout.fillHeight: true
            }

        }

    }

}
