Class {
	#name : 'SGBox',
	#superclass : 'MygAbstractBox',
	#instVars : [
		'state',
		'announcer'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'constants' }
SGBox class >> blue [ 

	^ self withState: SGBlueState uniqueInstance 
]

{ #category : 'constants' }
SGBox class >> green [

	^ self withState: SGGreenState uniqueInstance
]

{ #category : 'factory' }
SGBox class >> null [

	^ self withState: SGNullState uniqueInstance 
]

{ #category : 'constants' }
SGBox class >> red [

	^ self withState: SGRedState uniqueInstance
]

{ #category : 'as yet unclassified' }
SGBox class >> withState: aState [ 

	^ self new state: aState
]

{ #category : 'constants' }
SGBox class >> yellow [

	^ self withState: SGYellowState uniqueInstance
]

{ #category : 'accessing' }
SGBox >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'accessing' }
SGBox >> backgroundRepresentation [

	^ self state backgroundRepresentation 
]

{ #category : 'clicking' }
SGBox >> checkAndPropagateOnX: x y: y [

	| case |
	case := self board boxAt: x @ y.
	case state = self state ifTrue: [ case propagateClick ]
]

{ #category : 'public' }
SGBox >> click [

	self board hitBox: self
]

{ #category : 'drawing - general' }
SGBox >> draw: drawer [

	(drawer grid at: self x @ self y) background:
		self backgroundRepresentation
]

{ #category : 'testing' }
SGBox >> hasNullState [ 

	^ self state isNull
]

{ #category : 'accessing' }
SGBox >> literal [ 

	^ state literal
]

{ #category : 'clicking' }
SGBox >> propagateClick [

	| x y |
	x := self x.
	y := self y.
	(self board hitList includes: self) ifTrue: [ ^ self ].
	self board hitList add: self.
	x - 1 > 0 ifTrue: [ self checkAndPropagateOnX: x - 1 y: y ].
	x + 1 <= self board grid width ifTrue: [
		self checkAndPropagateOnX: x + 1 y: y ].
	y - 1 > 0 ifTrue: [ self checkAndPropagateOnX: x y: y - 1 ].
	y + 1 <= self board grid height ifTrue: [
		self checkAndPropagateOnX: x y: y + 1 ]
]

{ #category : 'accessing' }
SGBox >> state [

	^ state 
]

{ #category : 'accessing' }
SGBox >> state: aState [
	"(aState class inheritsFrom: SGNullState) ifFalse: [ self halt ]."

	state = aState ifTrue: [ ^ self ].
	state := aState.
	self announcer announce: SGStateChangedAnnouncement new.
]

{ #category : 'accessing - structure variables' }
SGBox >> x [

	^ position x
]

{ #category : 'accessing - structure variables' }
SGBox >> y [

	^ position y
]
