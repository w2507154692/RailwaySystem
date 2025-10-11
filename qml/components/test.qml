import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window{
    width: 960; height: 720
    minimumWidth: 480; minimumHeight: 360;
    maximumWidth: 1920; maximumHeight: 1440
    visible: true
    color: "#ffffff"
    Rectangle{
        width: 500
        height: 1440
        color: "black"
        Rectangle{
            width: 100
            height: 1440
            color: "pink"
        }
        Rectangle{
            width: 100
            height: 1440
            color: "yellow"
        }
        }


}
