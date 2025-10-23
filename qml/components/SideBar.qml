import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components"


Item {
    id: root

    property int selectedIndex: 0

    // 支持外部传递菜单数据
    property var menuModel: [
        {index: 0, text: "车票查询", iconSource: "qrc:/resources/icon/TicketQuery.png" },
        {index: 1, text: "乘车人信息", iconSource: "qrc:/resources/icon/OrderManagement.png" },
        {index: 2, text: "我的订单", iconSource: "qrc:/resources/icon/MyOrders.png" },
        {index: 3, text: "个人中心", iconSource: "qrc:/resources/icon/Profile.png" }
    ]

    property bool showBottomLine: true    // 控制分隔线显示
    property bool showBottomButton: true  // 控制底部按钮显示

    width: 180
    height: 600 // 如果有父级就跟随父级高度，否则默认600

    Rectangle {
        width: 180
        height: parent.height
        Rectangle {
            width: 2
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            anchors.right: parent.right
            color: "#cccccc"
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 20
            anchors.leftMargin: 15
            anchors.rightMargin: 25
            spacing: 10

            // 顶部三个菜单按钮
            Repeater {
                model: menuModel.length > 3 ? menuModel.slice(0, 3) : menuModel
                MenuButton {
                    // Layout.rightMargin: 15
                    Layout.fillWidth: true
                    text: modelData.text
                    iconSource: modelData.iconSource
                    // iconWidth: 40
                    // iconHeight: 40
                    selected: root.selectedIndex == modelData.index
                    onClicked: root.selectedIndex = modelData.index
                }
            }

            Item { Layout.fillHeight: true } // 占位弹性空间

            // 分隔线
            Rectangle {
                width: parent.width
                height: 2
                color: "#CCE5FF"
                Layout.margins: 10
                Layout.fillWidth: true
                visible: showBottomLine   // 控制显示
            }

            // 底部一个菜单按钮
            MenuButton {
                Layout.fillWidth: true
                Layout.topMargin: -5
                Layout.bottomMargin: 30
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                text: menuModel.length > 3 ? menuModel[3].text : ""
                iconSource: menuModel.length > 3 ? menuModel[3].iconSource : ""
                visible: showBottomButton // 控制显示
                selected: root.selectedIndex == (menuModel.length > 3 ? menuModel[3].index : -1)
                onClicked: root.selectedIndex = (menuModel.length > 3 ? menuModel[3].index : -1)
            }
        }
    }
}
