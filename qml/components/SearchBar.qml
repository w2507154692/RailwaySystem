import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    property alias text: searchField.text
    width: 400
    height: 40

    Rectangle {
        id: background
        anchors.fill: parent
        radius: 6
        border.color: "#AAAAAA"
        border.width: 1
        color: "white"

        RowLayout {
            anchors.fill: parent

            Image {
                id: searchIcon
                source: "qrc:/resources/icon/Find.png" // 确认路径正确
                Layout.preferredHeight: 40
                Layout.preferredWidth: 40
                fillMode: Image.PreserveAspectFit
                smooth: true
                Layout.alignment: Qt.AlignVCenter
            }

            TextField {
                id: searchField
                Layout.fillWidth: true
                font.pixelSize: 18
                placeholderText: "查找"
                background: null
            }
        }
    }
}
