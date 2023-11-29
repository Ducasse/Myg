Class {
	#name : #MgdCardElement,
	#superclass : #BlElement,
	#instVars : [
		'card',
		'flippedSide',
		'backSide'
	],
	#category : #'Myg-Memory-Bloc'
}

{ #category : #accessing }
MgdCardElement class >> card: aMgdCardModel [

	^ self new card: aMgdCardModel
]

{ #category : #accessing }
MgdCardElement >> backSide [

	^ backSide ifNil: [ self initializeBackSide ]
]

{ #category : #accessing }
MgdCardElement >> backSide: aBlElement [

	backSide := aBlElement 
]

{ #category : #'visual properties' }
MgdCardElement >> backgroundPaint [ 
	^ Color lightGreen  
]

{ #category : #'visual properties' }
MgdCardElement >> card [ 
	^ card 
]

{ #category : #'visual properties' }
MgdCardElement >> card: aMgdCard [

	card := aMgdCard.
	self initializeAnnouncements 
]

{ #category : #public }
MgdCardElement >> click [

	self card board chooseCard: self card.
	self drawCardElement
]

{ #category : #accessing }
MgdCardElement >> cornerRadius [ 
	^ 10
]

{ #category : #actions }
MgdCardElement >> disappear [ 

	self visibility: BlVisibility hidden
]

{ #category : #drawing }
MgdCardElement >> drawBackSide [

	self removeChildren.
	self addChild: self backSide.
]

{ #category : #drawing }
MgdCardElement >> drawCardElement [

	self card isFlipped
		  ifTrue: [ self drawFlippedSide ]
		  ifFalse: [ self drawBackSide ]
]

{ #category : #drawing }
MgdCardElement >> drawFlippedSide [

	self removeChildren.
	self addChild: self flippedSide
]

{ #category : #accessing }
MgdCardElement >> flippedSide [

	^ flippedSide ifNil: [ self initializeFlippedSide ]
]

{ #category : #accessing }
MgdCardElement >> flippedSide: aBlElement [

	flippedSide := aBlElement 
]

{ #category : #initialization }
MgdCardElement >> initialize [

	super initialize.
	self size: 80 @ 80.
	self background: self backgroundPaint.
	self border: (BlBorder paint: Color lightGray width: 2).
	self geometry:
		(BlRoundedRectangleGeometry cornerRadius: self cornerRadius).
	self drawBackSide.
	self layout: BlFrameLayout new.
	self addEventHandlerOn: BlClickEvent do: [ :anEvent | self click ].
]

{ #category : #initialization }
MgdCardElement >> initializeAnnouncements [

	card announcer
		when: MgdCardDisappearAnnouncement
		send: #disappear
		to: self.
	card announcer
		when: MgdCardFlipBackAnnouncement
		send: #drawBackSide
		to: self
]

{ #category : #initialization }
MgdCardElement >> initializeBackSide [

	| firstLine secondLine cross |
	firstLine := self initializeFirstLine.
	secondLine := self initializeSecondLine.

	cross := BlElement new
		         addChildren: {
				         firstLine.
				         secondLine };
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical matchParent ].

	^ cross
]

{ #category : #initialization }
MgdCardElement >> initializeFirstLine [

	| line |
	line := BlElement new
		        border: (BlBorder paint: Color lightOrange width: 3);
		        geometry: BlLineGeometry new;
		        outskirts: BlOutskirts centered.
	line when: BlElementLayoutComputedEvent do: [ :e | line geometry from: 0 @ 0 to: line parent extent ].

	^ line
]

{ #category : #initialization }
MgdCardElement >> initializeFlippedSide [

	| elt |
	elt := BlTextElement new text: self card symbol asRopedText.
	elt text fontName: 'Source Sans Pro'.
	elt text fontSize: 50.
	elt constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	^ elt
]

{ #category : #initialization }
MgdCardElement >> initializeSecondLine [

	| line |
	line := BlElement new
		        border: (BlBorder paint: Color lightOrange width: 3);
		        geometry: BlLineGeometry new;
		        outskirts: BlOutskirts centered.
	
	line when: BlElementLayoutComputedEvent do: [ :e |
		line geometry from: 0 @ line parent height to: line parent width @ 0 ].
	
	^ line
]
