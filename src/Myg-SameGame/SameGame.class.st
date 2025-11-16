Class {
	#name : 'SameGame',
	#superclass : 'Object',
	#instVars : [
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
SameGame class >> openWithSize: size [

	(self width: size height: size) open
]

{ #category : 'instance creation' }
SameGame class >> width: aInteger height: anotherInteger [

	^ self new
		  width: aInteger;
		  height: anotherInteger
]

{ #category : 'as yet unclassified' }
SameGame >> baseHeight [
	^ 20

]

{ #category : 'as yet unclassified' }
SameGame >> baseWidth [
	^ 20
]

{ #category : 'as yet unclassified' }
SameGame >> graphicGame [

	| graphicBoard graphicScore container game board |
	game := SGGame new.
	board := SGBoard new game: game.
	board generateGridWidth: self width height: self height.

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

{ #category : 'as yet unclassified' }
SameGame >> height [
	^ height ifNil:[self baseHeight]
]

{ #category : 'as yet unclassified' }
SameGame >> height: anInteger [

	height := anInteger
]

{ #category : 'as yet unclassified' }
SameGame >> initialize [ 
	
]

{ #category : 'as yet unclassified' }
SameGame >> open [

	| space |
	space := BlSpace new.
	space title: 'SameGame'.
	space root addChild: self graphicGame.
	space extent: 1000 @ 1000.
	space show
]

{ #category : 'as yet unclassified' }
SameGame >> width [
	^ width ifNil:[ self baseWidth ]
]

{ #category : 'as yet unclassified' }
SameGame >> width: anInteger [

	width := anInteger
]
