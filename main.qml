import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import "qml/components"

ApplicationWindow {
    id: appWin
    width: 1280
    height: 720
    visible: true
    title: "铁路系统"

    // 简化：根据角色计算初始页
    property string startPage: (userRole === "admin")
                               ? "qrc:/qml/pages/TrainManagement.qml"
                               : "qrc:/qml/pages/TicketQuery.qml"

    RowLayout {
        width: parent.width
        anchors.fill: parent

        SideBar {
            id: sideBar
            role: userRole
            onNavigate: function(pageUrl) {
                if (stackView.currentItem && stackView.currentItem.objectName === pageUrl)
                    return
                stackView.clear()
                stackView.push(Qt.resolvedUrl(pageUrl))
            }
        }

        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true
            // 不再使用 initialItem，统一在 completed 里加载
            onCurrentItemChanged: {
                if (currentItem && currentItem.objectName)
                    sideBar.currentUrl = currentItem.objectName
            }
        }
    }

    Component.onCompleted: {
        loadStartPage()
    }

    // 若以后支持切换账号（改变 userRole），可调用此函数
    function loadStartPage() {
        stackView.clear()
        stackView.push(Qt.resolvedUrl(startPage))
        sideBar.currentUrl = startPage
    }
}
