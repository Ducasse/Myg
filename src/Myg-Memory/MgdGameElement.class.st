Class {
	#name : #MgdGameElement,
	#superclass : #BlElement,
	#instVars : [
		'memoryGame'
	],
	#category : #'Myg-Memory-Bloc'
}

{ #category : #'instance creation' }
MgdGameElement class >> openWith: aMgdGameModel [

	| space gameElement|
	space := BlSpace new.
	gameElement := self new memoryGame: aMgdGameModel.
	space root addChild: gameElement.
	space pulse.
	space extent: gameElement extent.
	space show
]

{ #category : #'instance creation' }
MgdGameElement class >> openWithNumbers [

	| space gameElement |
	space := BlSpace new.
	gameElement := self new memoryGame: MgdGameModel numbers.
	space root addChild: gameElement.
	space pulse.
	space extent: gameElement extent.
	space show
]

{ #category : #initialization }
MgdGameElement >> initialize [

	super initialize.
	self background: Color veryLightGray.
	self layout: (BlGridLayout horizontal cellSpacing: 20).
	self constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ]
]

{ #category : #accessing }
MgdGameElement >> memoryGame [ 
	^ memoryGame 
]

{ #category : #accessing }
MgdGameElement >> memoryGame: aMgdGameModel [

	memoryGame := aMgdGameModel.

	self layout columnCount: memoryGame gridSize.
	memoryGame availableCards do: [ :aCard |
		self addChild: (MgdRawCardElement card: aCard) ]
]
