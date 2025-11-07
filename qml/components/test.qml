import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.impl 2.15


Rectangle {
    width: 1080; height: 640
    color: "#65a8ed" // 背景跟你的图一致

    // 三组互斥：座位、时间、高铁
    property int seatSelected: -1        // 0: 商务座, 1: 一等座, 2: 二等座, -1:未选
    property int timeSelected: -1        // 0: 上午, 1: 下午, -1:未选
    property int typeSelected: -1        // 0: 高铁, -1:未选

    GridLayout {
        anchors.fill: parent
        columns: 3
        rowSpacing: 14
        columnSpacing: 42

        // 第一列
        MyCheckBox {
            text: "只看商务座"
            checked: seatSelected === 0
            onClicked: seatSelected = checked ? 0 : -1
            Layout.row: 0
            Layout.column: 0
        }
        MyCheckBox {
            text: "上午出发"
            checked: timeSelected === 0
            onClicked: timeSelected = checked ? 0 : -1
            Layout.row: 1
            Layout.column: 0
        }
        // 第二列
        MyCheckBox {
            text: "只看一等座"
            checked: seatSelected === 1
            onClicked: seatSelected = checked ? 1 : -1
            Layout.row: 0
            Layout.column: 1
        }
        MyCheckBox {
            text: "下午出发"
            checked: timeSelected === 1
            onClicked: timeSelected = checked ? 1 : -1
            Layout.row: 1
            Layout.column: 1
        }
        // 第三列
        MyCheckBox {
            text: "只看二等座"
            checked: seatSelected === 2
            onClicked: seatSelected = checked ? 2 : -1
            Layout.row: 0
            Layout.column: 2
        }
        MyCheckBox {
            text: "只看高铁"
            checked: typeSelected === 0
            onClicked: typeSelected = checked ? 0 : -1
            Layout.row: 1
            Layout.column: 2
        }
    }
}
