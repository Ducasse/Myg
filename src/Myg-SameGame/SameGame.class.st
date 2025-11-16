Class {
	#name : 'SameGame',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'instance creation' }
SameGame class >> gameWithSize: size [

	<script>
	| game board graphicBoard graphicScore container |
	game := SGGame new.
	board := SGBoard new game: game.
	board generateGridWidth: size height: size.

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

{ #category : 'instance creation' }
SameGame class >> open [
	self openWithSize:20

]

{ #category : 'instance creation' }
SameGame class >> openWithSize: size [

	<script>
	| space |
	space := BlSpace new.
	space title: 'SameGame'.
	space root addChild: (self gameWithSize: size).
	space extent: 1000 @ 1000.
	space show
]

{ #category : 'see class side' }
SameGame >> seeClassSide [ 
]
