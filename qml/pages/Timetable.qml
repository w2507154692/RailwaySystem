import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"

Window {
    id: timetableWin
    width: 400; height: 360
    minimumWidth: 400; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"

    signal closed()

    onVisibleChanged: {
        if (visible && transientParent) {
            // 居中到父窗口
            x = transientParent.x + (transientParent.width - width) / 2
            y = transientParent.y + (transientParent.height - height) / 2
        } else if (visible) {
            // 居中到屏幕
            x = (Screen.width - width) / 2
            y = (Screen.height - height) / 2
        } else {
            closed()
        }
    }

    TimetableView{
        width: parent.width
        height: parent.height
        showButtons: false
    }
}
