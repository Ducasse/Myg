Class {
	#name : #TBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'cellSpacing',
		'width'
	],
	#category : #'Myg-Takuzu-UI'
}

{ #category : #'as yet unclassified' }
TBoardElement class >> launch10 [

	^ self openWithModel: (TBoard generateWithSize: 10)
]

{ #category : #'as yet unclassified' }
TBoardElement class >> launch12 [

	^ self openWithModel: (TBoard generateWithSize: 12)
]

{ #category : #'as yet unclassified' }
TBoardElement class >> launch4 [

	^ self openWithModel: (TBoard generateWithSize: 4)
]

{ #category : #'as yet unclassified' }
TBoardElement class >> launch6 [

	^ self openWithModel: (TBoard generateWithSize: 6)
]

{ #category : #'as yet unclassified' }
TBoardElement class >> launch8 [

	^ self openWithModel: (TBoard generateWithSize: 8)
]

{ #category : #'as yet unclassified' }
TBoardElement class >> openGridForTest [

	^ self openWithModel: TBoard gridForTest 
]

{ #category : #'as yet unclassified' }
TBoardElement class >> openRandom [

	^ self openWithModel: TBoard generate
]

{ #category : #'as yet unclassified' }
TBoardElement class >> openWithModel: aTBoard [

	| aBoardElement space |
	space := BlSpace new extent: 500@500.
	aBoardElement := self new.

	space root addChild: aBoardElement.
	aBoardElement board: aTBoard.
	space
		resizable: false;
		show
]

{ #category : #accessing }
TBoardElement >> board [

	^ board
]

{ #category : #accessing }
TBoardElement >> board: aTBoard [

	| spaceWidth elementWidth |
	board := aTBoard.
	self width: board grid width.
	spaceWidth := self space width.
	elementWidth := spaceWidth / self width - self cellSpacing.

	board grid do: [ :aBox |
		| boxElement |
		boxElement := TBoxElement box: aBox.
		boxElement size: elementWidth asPoint.
			boxElement position:
				(elementWidth + self cellSpacing) * (aBox position - (1 @ 1)).
		self addChild: boxElement.
		].
	self inspect
]

{ #category : #accessing }
TBoardElement >> cellSpacing [ 
	^ cellSpacing 
]

{ #category : #accessing }
TBoardElement >> cellSpacing: aNumber [

	cellSpacing := aNumber 
]

{ #category : #initialization }
TBoardElement >> initialize [

	super initialize.
	"	self padding: (BlInsets all: 5)."
	self cellSpacing: 3.
	self background: (BlBackground paint: Color veryVeryDarkGray).
	self constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal matchParent ]
]

{ #category : #'api - bounds' }
TBoardElement >> width [ 
	^ width 
	
]

{ #category : #'api - bounds' }
TBoardElement >> width: aNumber [

	width := aNumber 
]
