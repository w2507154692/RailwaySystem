import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects


ApplicationWindow {
    width: 960
    height: 720
    visible: true
    color: "pink"

    Rectangle {
        anchors.fill: parent
        radius: 20
        border.color: "pink"

        ScrollView {
            anchors.fill: parent
            // 设置内容区底色
            Rectangle {
                anchors.fill: parent
                color: "pink"
                z: -1
            }

            // 完全自定义滚动条样式
            ScrollBar.vertical: ScrollBar {
                width: 12
                policy: ScrollBar.AlwaysOn
                minimumSize: 0.15

                contentItem: Rectangle {
                    implicitWidth: 12
                    radius: 6
                    color: control.pressed ? "yellow"
                           : control.hovered ? "pink"
                           : "white"
                    border.width: 0
                    opacity: 1.0 // 关键，避免消失
                }
                background: Rectangle {
                    color: "transparent"
                    radius: 6
                    border.width: 0
                }
            }

            // 用Column自动撑开内容
            Column {
                width: parent.width - 80   // 留出左右Margin
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Repeater {
                    model: 100
                    delegate: Row {
                        width: parent.width
                        spacing: 10

                        Rectangle {
                            width: 700; height: 60
                            color: "#e3f2fd"
                            radius: 12
                            border.color: "#90caf9"
                            border.width: 1
                            Text {
                                anchors.centerIn: parent
                                text: "Passenger Card " + (index+1)
                                color: "#1976d2"
                                font.pixelSize: 20
                            }
                        }
                        Item { width: 1; height: 1 }
                        Rectangle {
                            width: 34; height: 34
                            radius: 17
                            color: "#fffde7"
                            border.color: "#ffd600"
                            border.width: 2
                            Text {
                                anchors.centerIn: parent
                                text: "✓"
                                color: "#ffd600"
                                font.pixelSize: 24
                            }
                        }
                    }
                }
            }
        }
    }
}
