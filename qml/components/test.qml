import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Window {
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    // 图像加阴影
    Item {
        width: 200
        height: 40 // 留出阴影空间
        anchors.centerIn: parent

        Image {
            id: arrowImg
            width: 200
            height: 20
            fillMode: Image.PreserveAspectFit
            source: "qrc:/resources/icon/arrow.svg"
        }

        DropShadow {
            anchors.fill: arrowImg
            source: arrowImg
            color: "#444444"
            radius: 12
            samples: 17
            horizontalOffset: 4
            verticalOffset: 4
        }
    }
}
