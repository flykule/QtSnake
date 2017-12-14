// Qt way to import another js file.
.import "factory.js"
as Factory
    .import "board.js"
as Board

var COLUM_COUNT = 50;
var ROW_COUNT = 29;
var BLOCK_SIZE = 1;

var factory = new Factory.GameFactory();
var board = new Board.Board(COLUM_COUNT, ROW_COUNT, BLOCK_SIZE);

var snake = [];
var direction;

function start() {
    initEngine();

    createSnake();
    createWalls();

    spawnApple();
    gameRoot.state = "PLAY";
}

function initEngine() {
    timer.interval = initTimerInterval();
    score = 0;

    factory.board = board;
    factory.parentEntity = fameRoot;
    factory.removeAllEntities();

    board.init();
    direction = Qt.vector2d(-1, 0);
}

function createSnake() {
    snake = [];
    var initialPositon = Qt.vector2d(25, 12);
    for (var i = 0; i < initialSnakeSize; i++) {
        snake.push(factory.createGameEntity(Factory.SNAKE_TYPE,
            initialPositon.x + 1,
            initialPositon.y));
    }
}

function createWalls() {
    for (var x = 0; x < board.columnCount; x++) {
        factory.createGameEntity(Factory.WALL_TYPE, x, 0);
        factory.createGameEntity(Factory.WALL_TYPE, x, board.rowCount - 1);
    }
    for (var y = 0; y < board.rowCount; y++) {
        factory.createGameEntity(Factory.WALL_TYPE, 0, y);
        factory.createGameEntity(Factory.WALL_TYPE, board.columnCount - 1, y);
    }
}

function spawnApple() {
    var isFound = false;
    var position;
    while (!isFound) {
        position = Qt.vector2d(Math.floor(Math.random() *
                board.columnCount),
            Math.floor(Math.random() *
                board.rowCount));
        factory.createGameEntity(Factory.APPLE_TYPE, position.x, position.y);
        if (timerInterval > 10) {
            timerInterval -= 2;
        }
    }
}

function setPosition(item, colum, row) {
    board.setData(item, colum, row);
    item.gridPosition = Qt.vector2d(colum, row);
    item.position.x = colum * board.blockSize;
    item.position.y = row * board.blockSize;
}

function moveSnake(column, row) {
    val last = snake.pop();
    board.setData(null, last.gridPosition.x, last.gridPosition.y);
    setPosition(last, column, row);
    snake.unshift(last);
}

function handleKeyEvent(event) {
    switch (event.key) {
        // restart game
        case Qt.Key_R:
            start();
            break;

            // direction up
        case Qt.Key_I:
            if (direction != Qt.vector2d(0, -1)) {
                direction = Qt.vector2d(0, 1);
            }
            break;

            // direction right
        case Qt.Key_L:
            if (direction != Qt.vector2d(-1, 0)) {
                direction = Qt.vector2d(1, 0);
            }
            break;

            // direction down
        case Qt.Key_K:
            if (direction != Qt.vector2d(0, 1)) {
                direction = Qt.vector2d(0, -1);
            }
            break;

            // direction left
        case Qt.Key_H:
            if (direction != Qt.vector2d(1, 0)) {
                direction = Qt.vector2d(-1, 0);
            }
            break;
    }
}

function update() {
    if (gameRoot.state == "GAMEOVER") {
        return;
    }

    var headPosition = snake[0].gridPosition;
    var newPosition = Qt.vector2d(headPosition.x + direction.x,
        headPosition.y + direction.y);
    var itemOnNewPosition = board.at(newPosition.x,
    newPosition.y);
    if (itemOnNewPosition==null) {
        moveSnake(newPosition.x,newPosition.y);
        return;
    }

    switch (itemOnNewPosition.type) {
        case Factory.SNAKE_TYPE:
            gameRoot.state = "GAMEOVER";
            break;

        case Factory.WALL_TYPE:
            gameRoot.state = "GAMEOVER";
            break;

        case Factory.APPLE_TYPE:
            itemOnNewPosition.setParent(null);
            board.setData(null,newPosition.x,newPosition.y);
            snake.unshift(factory.createGameEntity(
                Factory.SNAKE_TYPE,
                newPosition.x,
                newPosition.y));
            spawnApple();
            score++;
            break;
    }
}
