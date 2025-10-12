import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window{
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"
    Image {
        width: 200    // 你想要的宽度
        height: 20
        fillMode: Image.PreserveAspectFit
        source: "qrc:/resources/icon/arrow.svg"
    }


}
