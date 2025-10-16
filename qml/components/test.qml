import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Window {
    width: 960
    height: 720
    visible: true
    color: "pink"


        ScrollView {
            id: sv
            anchors.fill: parent

            ScrollBar.vertical: BasicScrollBar {
                width: 12
                anchors.right: parent.right
                height: sv.height
                policy: ScrollBar.AlwaysOn
                handleNormalColor: "#a0a0a0"
            }


            Column {
                spacing: 16
                width: sv.width
                Repeater {
                    model: 100
                    RowLayout {
                        width: sv.width
                        PassengerCard { width: 700 }
                        Item { Layout.fillWidth: true }
                        CheckButton {}
                    }
                }
            }
        }
}
