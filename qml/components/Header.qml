import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes

Rectangle {
    id: infoHeader
    property string title: "标题" // 外部传入
    property int titleFontSize: 28 // 标题字体大小，默认28
    signal closeClicked         // 关闭按钮点击信号

    width: parent ? parent.width : 600
    height: 60
    radius: 0
    // 渐变背景（从左到右）
    gradient: Gradient {
        orientation: Gradient.Horizontal   // 横向渐变
        GradientStop { position: 0.0; color: "#3399FF" }
        GradientStop { position: 1.0; color: "#fff" }
    }

    // 左侧标题，外部可传入
    Text {
        id: titleText
        text: infoHeader.title
        color: "white"
        font.bold: false
        font.pixelSize: infoHeader.titleFontSize  // 使用开放的字体大小属性
        leftPadding: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    // 右上角关闭按钮，使用图片
    Image {
        id: closeBtn
        source: "qrc:/resources/icon/Cancel.png"
        width: 60
        height: 60
        fillMode: Image.PreserveAspectFit
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        MouseArea {
            anchors.fill: parent
            onClicked: infoHeader.closeClicked()
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }
}
