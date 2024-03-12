Class {
	#name : #MgdBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : #'Myg-Memory-Bloc'
}

{ #category : #'instance creation' }
MgdBoardElement class >> openWith: aMgdBoard [

	| space gameElement|
	space := BlSpace new.
	gameElement := self new board: aMgdBoard.
	space root addChild: gameElement.
	space pulse.
	space extent: gameElement extent.
	space show
]

{ #category : #'instance creation' }
MgdBoardElement class >> openWithNumbers [

	^ self openWith: MgdBoard numbers
]

{ #category : #accessing }
MgdBoardElement >> board: aMgdBoard [

	board := aMgdBoard.

	self layout columnCount: board gridSize.
	board grid do: [ :aCard |
		self addChild: (MgdCardElement card: aCard) ]
]

{ #category : #initialization }
MgdBoardElement >> initialize [

	super initialize.
	self background: Color lightOrange.
	self layout: (BlGridLayout horizontal cellSpacing: 20).
	self constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ]
]
