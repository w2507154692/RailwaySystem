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

        // 侧边栏
        SideBar {
            Layout.preferredWidth: 150
            Layout.fillHeight: true
        }

    }
}
