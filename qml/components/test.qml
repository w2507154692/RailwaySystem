import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import "../pages"

Item {
        width: 960; height: 540
        ListView{
            anchors.fill: parent
            model: Qt.fontFamilies()
            delegate: Item {
                height: 64
                width: parent.width
                Rectangle{
                    height: 48
                    width: parent.width
                    Text {
                        id: txtShow
                        anchors.centerIn: parent
                        color: "black"
                        text: "字体名称" + index + ": " + modelData
                        font.family: modelData
                    }
                }
            }
        }
    }
