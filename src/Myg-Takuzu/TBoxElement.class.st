Class {
	#name : #TBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'colorDictionary',
		'board'
	],
	#category : #'Myg-Takuzu-UI'
}

{ #category : #accessing }
TBoxElement class >> box: aMBox [

	^ self new box: aMBox
]

{ #category : #'as yet unclassified' }
TBoxElement >> backgroundPaint [

	^ Color veryDarkGray 
]

{ #category : #'as yet unclassified' }
TBoxElement >> board [

	^ board
]

{ #category : #'as yet unclassified' }
TBoxElement >> board: aTBoard [

	board := aTBoard
]

{ #category : #'as yet unclassified' }
TBoxElement >> box [

	^ box
]

{ #category : #accessing }
TBoxElement >> box: aTBox [

	box := aTBox.
	self updateBackgroundColor
]

{ #category : #public }
TBoxElement >> click [

	self box isTSetBox
		ifTrue: [ self lock ]
		ifFalse: [ self board clickOnBox: self box.
			self updateBackgroundColor ]
]

{ #category : #'as yet unclassified' }
TBoxElement >> colorDictionary [

	^ colorDictionary 
]

{ #category : #'as yet unclassified' }
TBoxElement >> initialize [

	super initialize.

	colorDictionary := Dictionary new.
	colorDictionary
		at: 0 put: Color red;
		at: 1 put: Color lightBlue;
		at: nil put: Color veryDarkGray.
	self background: self backgroundPaint.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 5).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ].

	self addEventHandlerOn: BlMouseUpEvent do: [ :anEvent | self click ]
]

{ #category : #'actions api' }
TBoxElement >> lock [

]

{ #category : #'as yet unclassified' }
TBoxElement >> updateBackgroundColor [
	self background: (self colorDictionary at: self box value)
]
