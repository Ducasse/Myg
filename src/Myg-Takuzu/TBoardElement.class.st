Class {
	#name : #TBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : 'Myg-Takuzu-UI'
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
TBoardElement class >> openWithModel: aTField [

	| aFieldElement space |
	space := BlSpace new.
	aFieldElement := self new
		                 board: aTField;
		                 yourself.
	space root addChild: aFieldElement.
	space pulse
		extent: 500 @ 500;
		resizable: false;
		show
]

{ #category : #accessing }
TBoardElement >> board [

	^ board
]

{ #category : #accessing }
TBoardElement >> board: aTBoard [

	board := aTBoard.
	self layout:
		(BlGridLayout horizontal cellSpacing: 5 - (board grid width // 5)).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ].
	self padding: (BlInsets all: 5).
	self layout columnCount: board grid width.
	board grid do: [ :aBox |
		| boxElement |
		boxElement := (TBoxElement box: aBox).
		self addChild: boxElement ]
]

{ #category : #initialization }
TBoardElement >> initialize [

	super initialize.
	self background: (BlBackground paint: Color veryVeryDarkGray).
	
]
