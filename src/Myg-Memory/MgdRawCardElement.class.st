Class {
	#name : #MgdRawCardElement,
	#superclass : #BlElement,
	#instVars : [
		'card',
		'flippedSide',
		'backSide'
	],
	#category : #'Myg-Memory-Bloc'
}

{ #category : #accessing }
MgdRawCardElement class >> card: aMgdCardModel [

	^ self new card: aMgdCardModel
]

{ #category : #accessing }
MgdRawCardElement >> backSide [

	^ backSide ifNil: [ self initializeBackSide ]
]

{ #category : #accessing }
MgdRawCardElement >> backSide: aBlElement [

	backSide := aBlElement 
]

{ #category : #'visual properties' }
MgdRawCardElement >> backgroundPaint [ 
	^ Color lightGray 
]

{ #category : #'visual properties' }
MgdRawCardElement >> card [ 
	^ card 
]

{ #category : #'visual properties' }
MgdRawCardElement >> card: aMgdCard [

	card := aMgdCard.
	self initializeAnnouncements 
]

{ #category : #public }
MgdRawCardElement >> click [

	self parent memoryGame chooseCard: self card.
	self drawCardElement
]

{ #category : #accessing }
MgdRawCardElement >> cornerRadius [ 
	^ 10
]

{ #category : #actions }
MgdRawCardElement >> disappear [ 

	self visibility: BlVisibility hidden
]

{ #category : #drawing }
MgdRawCardElement >> drawBackSide [

	self removeChildren.
	self addChild: self backSide.
]

{ #category : #drawing }
MgdRawCardElement >> drawCardElement [

	self card isFlipped
		  ifTrue: [ self drawFlippedSide ]
		  ifFalse: [ self drawBackSide ]
]

{ #category : #drawing }
MgdRawCardElement >> drawFlippedSide [

	self removeChildren.
	self addChild: self flippedSide
]

{ #category : #accessing }
MgdRawCardElement >> flippedSide [

	^ flippedSide ifNil: [ self initializeFlippedSide ]
]

{ #category : #accessing }
MgdRawCardElement >> flippedSide: aBlElement [

	flippedSide := aBlElement 
]

{ #category : #initialization }
MgdRawCardElement >> initializeAnnouncements [

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
MgdRawCardElement >> initializeBackSide [

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
MgdRawCardElement >> initializeFirstLine [

	| line |
	line := BlElement new
		        border: (BlBorder paint: Color lightGreen width: 3);
		        geometry: BlLineGeometry new;
		        outskirts: BlOutskirts centered.
	line when: BlElementLayoutComputedEvent do: [ :e | line geometry from: 0 @ 0 to: line parent extent ].

	^ line
]

{ #category : #initialization }
MgdRawCardElement >> initializeFlippedSide [

	| elt |
	elt := BlTextElement new text: self card symbol asRopedText.
	elt text fontName: 'Source Sans Pro'.
	elt text fontSize: 50.
	elt text foreground: Color white.
	elt constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	^ elt
]

{ #category : #initialization }
MgdRawCardElement >> initializeSecondLine [

	| line |
	line := BlElement new
		        border: (BlBorder paint: Color lightGreen width: 3);
		        geometry: BlLineGeometry new;
		        outskirts: BlOutskirts centered.
	
	line when: BlElementLayoutComputedEvent do: [ :e |
		line geometry from: 0 @ line parent height to: line parent width @ 0 ].
	
	^ line
]
