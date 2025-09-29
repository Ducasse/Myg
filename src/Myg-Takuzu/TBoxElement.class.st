Class {
	#name : #TBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'board'
	],
	#classVars : [
		'ColorDictionary'
	],
	#category : 'Myg-Takuzu-UI'
}

{ #category : #accessing }
TBoxElement class >> box: aMBox [

	^ self new box: aMBox
]

{ #category : #'class initialization' }
TBoxElement class >> initialize [ 


	ColorDictionary := { 0 -> Color red.
	1 -> Color lightBlue.
	nil -> Color veryDarkGray } asDictionary 

]

{ #category : #accessing }
TBoxElement >> backgroundPaint [

	^ Color veryDarkGray 
]

{ #category : #accessing }
TBoxElement >> board [

	^ board
]

{ #category : #accessing }
TBoxElement >> board: aTBoard [

	board := aTBoard
]

{ #category : #accessing }
TBoxElement >> box [

	^ box
]

{ #category : #accessing }
TBoxElement >> box: aTBox [

	box := aTBox.
	self updateBackgroundColor
]

{ #category : #initialization }
TBoxElement >> initialize [

	super initialize.
	self background: self backgroundPaint.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 5).
	self addEventHandlerOn: BlMouseUpEvent do: [
		self click ]
]

{ #category : #'actions api' }
TBoxElement >> updateBackgroundColor [
	self background: (ColorDictionary at: self box value)
]
