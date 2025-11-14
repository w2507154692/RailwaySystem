import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: confirmWin
    title: "确认"
    property string contentText: "主内容iahfahfahfafhoiashfdoaosigfasu;dg;oihf;HF;AOSIHF;Oaifh;ohi"
    signal closed()
    onVisibleChanged: if (!visible) closed()

    width: 320
    height: 180
    flags: Qt.Dialog
    modality: Qt.ApplicationModal
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: "#ffffff"

        ColumnLayout {
            anchors.fill: parent

            Text {
                id:content

                Layout.topMargin: 30
                Layout.rightMargin: 60
                Layout.leftMargin: 60
                text: contentText
                wrapMode: Text.Wrap                      // 开启自动换行
                // elide: Text.ElideMiddle
                Layout.preferredWidth: 200
                Layout.preferredHeight: 60
                font.pixelSize: 18
                font.family: "Microsoft YaHei"
                color: "#1a252f"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            CustomButton {
                Layout.topMargin: 10
                Layout.bottomMargin: 20
                Layout.alignment: Qt.AlignCenter
                buttonType: "confirm"
                width: 120
                text: "确认"
                focus: true
                Keys.onReturnPressed: closed()
                onClicked: closed()
            }
        }
    }
}
