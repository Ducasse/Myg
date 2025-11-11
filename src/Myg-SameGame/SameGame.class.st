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
	| game board graphicBoard graphicScore space container |

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

	space := BlSpace new.
	space title: 'SameGame'.
	space root addChild: container.
	space extent: 1000 @ 1000.

	^ space
]

{ #category : 'instance creation' }
SameGame class >> open [
	self openWithSize:20

]

{ #category : 'instance creation' }
SameGame class >> openWithSize: size [

	<script>

	(self gameWithSize: size) show
]

{ #category : 'see class side' }
SameGame >> seeClassSide [ 
]
