var SNAKE_TYPE=1;
var WALL_TYPE=2;
var APPLE_TYPE=3;

var snakeComponent = Qt.createComponent("Snake.qml");
var wallComponent = Qt.createComponent("Wall.qml");
var appleComponent = Qt.createComponent("Apple.qml");

function GameFactory() {
    this.board = null;
    this.parentEntity = null;
    this.entities = [];
}

GameFactory.prototype.removeAllEntities = function(){
    for(var i = 0;i< this.entities.length;i++){
        this.entities[i].setParent(null);
    }
}
