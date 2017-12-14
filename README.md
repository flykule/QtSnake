# QtSnake

A snake game written in qt.Use qml to show ui,and java script to control game.
###Snake Game###

Everyone knows what it is,if you dont,[Check it out](https://en.wikipedia.org/wiki/Snake_(video_game))

### Status
[![Build Status](https://travis-ci.org/flykule/QtSnake.svg?branch=master)](https://travis-ci.org/flykule/QtSnake)

### Repository structure ###
The directory structure is:

	snake.pro the qmake project
	
	Sources:
		main.cpp init qopenglcontext
		
	Resources:
		main.qml the main page to show game area
		Apple.qml the entity represent apple
		GameArea.qml represent game board
		GameEntity.qml parent of other entities
		MaterialBackground.qml draw game background
		SnakePart.qml part of snake body
		Wall.qml wall around game area,invisible because the game aims in raspi
		qtquickcontrols2.conf the style and theme configuration file 
		
### Entity struts
![](http://obip31jcs.bkt.clouddn.com/17-12-13/81688963.jpg)
	
	





