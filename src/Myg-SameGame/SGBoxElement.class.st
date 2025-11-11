Class {
	#name : 'SGBoxElement',
	#superclass : 'BlElement',
	#instVars : [
		'gridPosition',
		'board',
		'box'
	],
	#category : 'Myg-SameGame-UI',
	#package : 'Myg-SameGame',
	#tag : 'UI'
}

{ #category : 'accessing' }
SGBoxElement class >> createWithBox: aSGBox [

	^ self new
		  box: aSGBox;
		  background: aSGBox backgroundRepresentation;
		yourself
]

{ #category : 'accessing' }
SGBoxElement >> board [

	^ board
]

{ #category : 'accessing' }
SGBoxElement >> board: aSGBoardElement [

	board := aSGBoardElement
]

{ #category : 'accessing' }
SGBoxElement >> box [ 
	
	^ box
]

{ #category : 'accessing' }
SGBoxElement >> box: aSGBox [ 

	box := aSGBox.
	
	self initializeAnnouncements
]

{ #category : 'public' }
SGBoxElement >> click [

	self box click
]

{ #category : 'accessing' }
SGBoxElement >> gridPosition [

	^ gridPosition
]

{ #category : 'accessing' }
SGBoxElement >> gridPosition: aPosition [

	gridPosition := aPosition
]

{ #category : 'initialization' }
SGBoxElement >> initialize [

	super initialize.

	self geometry: (BlRoundedRectangleGeometry cornerRadius: 5).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ].

	self addEventHandlerOn: BlClickEvent do: [ :anEvent | self click ]
]

{ #category : 'initialization' }
SGBoxElement >> initializeAnnouncements [ 

	self box announcer when: SGStateChangedAnnouncement send: #updateBackgroundColor to: self
]

{ #category : 'change reporting' }
SGBoxElement >> updateBackgroundColor [

	^ self background: self box backgroundRepresentation
]
