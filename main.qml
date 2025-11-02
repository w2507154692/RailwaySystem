import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import "qml/components"

ApplicationWindow {
    id: appWin
    width: 1040
    height: 640
    visible: true
    title: "铁路系统"

    // 定义本地的 userRole 属性，默认为 "user"
    property string userRole: "guest" // 初始为 guest，登录后赋值 "user" 或 "admin"
    property string startPage: (userRole === "admin") ? "qrc:/qml/pages/TrainManagement.qml" : "qrc:/qml/pages/TicketQuery.qml"
    // 不用绑定表达式，避免自动派生的 change 信号与手动声明冲突；登录成功时手动赋值
    property bool loggedIn: false

    // 主内容区：始终占满，内部根据登录状态显示侧边栏与内容
    RowLayout {
        id: contentRow
        anchors.fill: parent
        spacing: 0
        visible: loggedIn

        SideBar {
            id: sideBar
            role: userRole
            Layout.fillHeight: true
            onNavigate: function(pageUrl) {
                if (stackView.currentItem && stackView.currentItem.objectName === pageUrl)
                    return
                stackView.clear()
                stackView.push(Qt.resolvedUrl(pageUrl))
                        }
            // 固定宽度由组件内部 width 决定，不再伸展
        }

        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true
            onCurrentItemChanged: {
                if (currentItem && currentItem.objectName)
                    sideBar.currentUrl = currentItem.objectName
            }
        }
    }

    // 登录层：覆盖显示，登录成功后隐藏
    Loader {
        id: loginLoader
        anchors.fill: parent
        active: !loggedIn
        source: "qrc:/qml/pages/LoginPage.qml"
        z: 10
        onLoaded: {
            if (item) {
                item.loginSuccess.connect(function(role) {
                    console.log("Login success, role:", role)
                    appWin.userRole = role
                    appWin.loggedIn = true
                    stackViewLoadTimer.restart()
                })
            }
        }
    }

    Component.onCompleted: {
    if (loggedIn) loadStartPage()
    }

    // 若以后支持切换账号（改变 userRole），可调用此函数
    function loadStartPage() {
        if (!loggedIn) return
        console.log("Loading start page:", startPage, "for role:", userRole)
        try {
            stackView.clear()
            stackView.push(Qt.resolvedUrl(startPage))
            sideBar.currentUrl = startPage
            console.log("Successfully loaded start page:", startPage)
        } catch (error) {
            console.error("Exception during start page loading:", error)
        }
    }

    Timer {
        id: stackViewLoadTimer
        interval: 50; repeat: false
        onTriggered: loadStartPage()
    }
}
