pragma Singleton
import QtQuick 2.15

QtObject {
    property string username: ""
    property string role: ""

    function clear() {
        username = ""
        role = ""
    }
}
