import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"


Item {
    width: 150
    height: parent ? parent.height : 600 // 如果有父级就跟随父级高度，否则默认600

    Rectangle {
        // height: 1500
        width: 130
        // color: "#ffffff"
        // color:"pink"
        height: parent.height
        Rectangle {
            width: 2
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            color: "#b3b3b3"
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            // 顶部菜单按钮区
            MenuButton { text: "车票查询"; iconSource: "qrc:/resources/icon/TicketQuery.png"; Layout.margins: 10 }
            MenuButton { text: "乘车人信息"; iconSource: "qrc:/resources/icon/OrderManagement.png"; Layout.margins: 10 }
            MenuButton { text: "我的订单"; iconSource: "qrc:/resources/icon/MyOrders.png"; Layout.margins: 10 }

            Item { Layout.fillHeight: true } // 弹性占位

            Rectangle {
                width: parent.width
                height: 1
                color: "#CCE5FF"
                Layout.margins: 10
                Layout.fillWidth: true
            }

            MenuButton {
                text: "个人中心"
                iconSource: "qrc:/resources/icon/Profile.png"
                normalColor: "#A9C4EB"
                Layout.margins: 16
            }
        }
    }

}
