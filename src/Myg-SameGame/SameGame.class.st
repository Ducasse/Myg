Class {
	#name : 'SameGame',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'instance creation' }
SameGame class >> open [

	<script>
	| board graphicBoard space |
	board := SGBoard new game: SGGame new.
	board generateGridWidth: size height: size.
	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	space := BlSpace new.
	space title: 'SameGame'.
	space root addChild: graphicBoard.
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
