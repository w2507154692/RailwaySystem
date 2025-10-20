import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import "../pages"

Window {
    width: 800
    height: 600
    visible: true
    Rectangle{
        anchors.fill: parent
        // width: parent.width
        // height: parent.height

        ColumnLayout{
            width: parent.width
            height: parent.height
            RowLayout{
                Label{
                    Layout.fillWidth: true
                    text:"ww"
                }

                TextField{
                    Layout.fillWidth:true
                }
            }
        }

    }

}
