import QtQuick 2.15

Item {
    width: 800
    height: 79

    // Rectangle {
    //     x: 3
    //     y: 3
    //     width: mainContent.cardWidth - 70 // 60按钮宽+10间距
    //     height: parent.height
    //     radius: 16
    //     color: "#b3d1ff"
    //     opacity: 0.5
    // }

    Rectangle {
        width: mainContent.cardWidth - 70
        height: parent.height
        radius: 16
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#cce5ff" }
            GradientStop { position: 1.0; color: "#8ec9ff" }
        }
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        Column {
            anchors.fill: parent
            anchors.margins: 14
            spacing: 6

            Row {
                width: parent.width
                Text {
                    text: "姓名：王宇豪"
                    font.pixelSize: 18
                    color: "#222"
                }
                Text {
                    text: "联系方式：17816936112"
                    font.pixelSize: 18
                    color: "#222"
                    horizontalAlignment: Text.AlignRight
                    font.underline: false
                }
            }

            Row {
                width: parent.width
                Text {
                    text: "身份证号：412828200507112111"
                    font.pixelSize: 16
                    color: "#222"
                }
                Text {
                    text: "优惠类型：学生"
                    font.pixelSize: 16
                    color: "#222"
                    horizontalAlignment: Text.AlignRight
                }
            }
        }
    }

    Rectangle {
        width: 60
        height: 60
        radius: 16
        color: "#fff"
        x: mainContent.cardWidth - 60
        y: (parent.height - height) / 2
        z: 1
        Image {
            anchors.centerIn: parent
            source: "qrc:/resources/icon/Edit.png"
            width: 60
            height: 60
        }
    }
}
