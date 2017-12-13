import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Scene3D 2.0

Item {
    id:mainView

    property int score: 0
    readonly property alias window: mainView

    visible: true
    width: 1280
    height: 768

    Keys.onEscapePressed: {
        Qt.quit()
    }

    Rectangle{
        // heads up display
        id:hud

        color:"#31363b"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 60

        Label  {
            id:snakeSizeText
            anchors.centerIn: parent
            font.pointSize: 25
            color: "white"
            text: "Score: "+score
        }

    }

    Scene3D{
        id:scene
        anchors.top: hud.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        focus: true
        aspects: "input"
    }
}
