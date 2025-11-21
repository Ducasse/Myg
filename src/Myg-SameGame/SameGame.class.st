Class {
	#name : 'SameGame',
	#superclass : 'Object',
	#instVars : [
		'buildBoxStrategy',
		'calculeScoreStrategy',
		'height',
		'width'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'instance creation' }
SameGame class >> open [
	self openWithSize:20

]

{ #category : 'instance creation' }
SameGame class >> openWidth: aInteger height: anotherInteger [

	^ (self width: aInteger height: anotherInteger) open
]

{ #category : 'instance creation' }
SameGame class >> openWithSize: size [

	(self width: size height: size) open
]

{ #category : 'instance creation' }
SameGame class >> width: aInteger height: anotherInteger [

	^ self new
		  width: aInteger;
		  height: anotherInteger
]

{ #category : 'accessing' }
SameGame >> baseHeight [
	^ 20

]

{ #category : 'accessing' }
SameGame >> baseWidth [
	^ 20
]

{ #category : 'accessing' }
SameGame >> buildBoxStrategy [

	^ buildBoxStrategy 
]

{ #category : 'settings' }
SameGame >> buildBoxStrategy: aSGBuildBoxStrategy [

	buildBoxStrategy := aSGBuildBoxStrategy
]

{ #category : 'accessing' }
SameGame >> calculeScoreStrategy [

	^ calculeScoreStrategy 
]

{ #category : 'settings' }
SameGame >> calculeScoreStrategy: aSGCalculeScoreStrategy [

	calculeScoreStrategy := aSGCalculeScoreStrategy 
]

{ #category : 'opening' }
SameGame >> createGameAndBoard [

	| game board |
	game := SGGame new.
	board := SGBoard new .
	game board: board.
	self buildBoxStrategy ifNotNil: [ :strat | board buildBoxStrategy: buildBoxStrategy ].
	self calculeScoreStrategy ifNotNil: [ :strat | board scoreStrategyCalculator: buildBoxStrategy ].
	
	board generateGridWidth: self width height: self height.
	^ {
		  game.
		  board }
]

{ #category : 'opening' }
SameGame >> graphicGame [

	| gameAndBoard |
	gameAndBoard := self createGameAndBoard.
	^ self graphicGame: gameAndBoard first board: gameAndBoard second
]

{ #category : 'opening' }
SameGame >> graphicGame: game board: board [

	| graphicBoard graphicScore container |
	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	graphicScore := SGScoreElement new.
	graphicScore game: game.

	container := BlElement new
		             layout: BlLinearLayout vertical;
		             constraintsDo: [ :c |
				             c horizontal matchParent.
				             c vertical matchParent ].

	container addChildren: {
			graphicScore.
			graphicBoard }.
	^ container
]

{ #category : 'accessing' }
SameGame >> height [
	^ height ifNil:[self baseHeight]
]

{ #category : 'settings' }
SameGame >> height: anInteger [

	height := anInteger 
]

{ #category : 'opening' }
SameGame >> open [

	| space |
	space := BlSpace new.
	space title: 'SameGame'.
	space root addChild: self graphicGame.
	space extent: 1000 @ 1000.
	space show
]

{ #category : 'accessing' }
SameGame >> width [ 
	^ width ifNil:[ self baseWidth ]
]

{ #category : 'settings' }
SameGame >> width: anInteger [

	width := anInteger
]
