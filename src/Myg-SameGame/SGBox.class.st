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

{ #category : 'as yet unclassified' }
SGBox class >> bomb [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	^ self withState: SGBombState uniqueInstance
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

{ #category : 'public' }
SGBox >> click [

	self board hitBox: self
]

{ #category : 'propagating' }
SGBox >> defaultCheckAndPropagateOnX: x y: y [

	| case |
	case := self board boxAt: x @ y.
	case state = self state ifTrue: [ case propagateClick ]
]

{ #category : 'propagating' }
SGBox >> defaultPropagate [

	| x y |
	x := self x.
	y := self y.
	(self board hitList includes: self) ifTrue: [ ^ self ].
	self board hitList add: self.
	x - 1 > 0 ifTrue: [ self defaultCheckAndPropagateOnX: x - 1 y: y ].
	x + 1 <= self board grid width ifTrue: [
		self defaultCheckAndPropagateOnX: x + 1 y: y ].
	y - 1 > 0 ifTrue: [ self defaultCheckAndPropagateOnX: x y: y - 1 ].
	y + 1 <= self board grid height ifTrue: [
		self defaultCheckAndPropagateOnX: x y: y + 1 ]
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

{ #category : 'propagating' }
SGBox >> propagateBombState [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	| x y |
	x := self x.
	y := self y.
	(self board hitList includes: self) ifTrue: [ ^ self ].
	self board hitList add: self.
	((x@y) eightNeighbors select: [:aPoint| aPoint isInsideRectangle: 
		(Rectangle  point: 1@1 point:  (board grid width + 1 )@(board grid height +1 ))]	)
	 do:[ :aPoint| 
		self removeBox:( board boxAt:aPoint ) 
		].
	
]

{ #category : 'propagating' }
SGBox >> propagateClick [
	self state propagateFromASquare: self.
]

{ #category : 'propagating' }
SGBox >> propagateNormalState [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	^ self defaultPropagate.
	
]

{ #category : 'accessing' }
SGBox >> propagateNullState [

	^ self
]

{ #category : 'removing' }
SGBox >> removeBox: aBox [
	self board hitList add: aBox.
	
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
