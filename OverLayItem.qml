import QtQuick 2.0

Item {
    id:root
    states: [
        State {
            name: "PLAY"
            PropertyChanges {
                target: root
                visible:false
            }
        },
        State {
            name: "GAMEOVER"
            PropertyChanges {
                target: gameOver
                visible: true
            }
            PropertyChanges {
                target: root
                visible:true
            }
        }
    ]

    GameOverItem{
        id:gameOver
    }
}
