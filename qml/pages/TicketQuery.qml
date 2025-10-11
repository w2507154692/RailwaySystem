import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    RowLayout {
        anchors.fill: parent

        SideBar {
            Layout.preferredWidth: 150
            Layout.fillHeight: true   // 让SideBar自动填满高度
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "red"

            Column {
                anchors.fill: parent
                anchors.margins: 40
                spacing: 32

                Row {
                    spacing: 80
                    Text {
                        text: "北京"
                        font.pixelSize: 48
                        color: "#222"
                        // 可加 maximumWidth 限制
                    }
                    Image {
                        source: "qrc:/resources/icon/TrainIcon.png"
                        width: 48; height: 48
                    }
                    Text {
                        text: "上海"
                        font.pixelSize: 48
                        color: "#222"


                    }
                }

                Rectangle {
                    width: 400; height: 60
                    radius: 12
                    color: "#6ea8fe"
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        anchors.centerIn: parent
                        text: "查询车票"
                        color: "#fff"
                        font.pixelSize: 32
                    }
                }
            }
        }
    }
}
