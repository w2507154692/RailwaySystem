import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"


Item {
    // 支持外部传递菜单数据
    property var menuModel: [
        { text: "车票查询", iconSource: "qrc:/resources/icon/TicketQuery.png" },
        { text: "乘车人信息", iconSource: "qrc:/resources/icon/OrderManagement.png" },
        { text: "我的订单", iconSource: "qrc:/resources/icon/MyOrders.png" },
        { text: "个人中心", iconSource: "qrc:/resources/icon/Profile.png" }
    ]

    width: 130
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

            // 顶部三个菜单按钮
            Repeater {
                model: menuModel.length > 3 ? menuModel.slice(0, 3) : menuModel
                MenuButton {
                    text: modelData.text
                    iconSource: modelData.iconSource
                    Layout.margins: 10
                }
            }

            Item { Layout.fillHeight: true } // 占位弹性空间

            Rectangle {
                width: parent.width
                height: 1
                color: "#CCE5FF"
                Layout.margins: 10
                Layout.fillWidth: true
            }

            // 底部一个菜单按钮
            MenuButton {
                text: menuModel.length > 3 ? menuModel[3].text : ""
                iconSource: menuModel.length > 3 ? menuModel[3].iconSource : ""
                Layout.margins: 10
            }


        }
    }

}
