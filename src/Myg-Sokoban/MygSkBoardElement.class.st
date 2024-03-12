"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them.

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	backgroundLayer:		<Object>
	board:		<Object>
	directionDict:		<Object>
	foregroundLayer:		<Object>


    Implementation Points
"
Class {
	#name : #MygSkBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer',
		'directionDict'
	],
	#category : #'Myg-Sokoban-UI'
}

{ #category : #'as yet unclassified' }
MygSkBoardElement class >> openBoardTest [

	^ self openWithModel: MygSkBoard boardTest
]

{ #category : #'as yet unclassified' }
MygSkBoardElement class >> openWithModel: aSkBoard [

	self new openWithModel: aSkBoard.
]

{ #category : #accessing }
MygSkBoardElement >> backgroundLayer [

	^ backgroundLayer ifNil: [ self initializeBackgroundLayer  ]
]

{ #category : #accessing }
MygSkBoardElement >> backgroundLayer: aBlElement [

	backgroundLayer := aBlElement 
]

{ #category : #initialization }
MygSkBoardElement >> board [ 
	^ board
]

{ #category : #initialization }
MygSkBoardElement >> board: aSkBoard [

	board := aSkBoard.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ].
	self
		initializeBackgroundLayer;
		initializeForegroundLayer
]

{ #category : #initialization }
MygSkBoardElement >> boardPreview: aSkBoard [

	self board: aSkBoard.
	self loseFocus.
	board := nil
]

{ #category : #accessing }
MygSkBoardElement >> directionDict [

	^ directionDict
]

{ #category : #private }
MygSkBoardElement >> elementsToUpdateAtPosition: aPoint goingIn: aCpDirection [

	| layer elements playerElement neighborElement nextNeighborElement |
	layer := self foregroundLayer.
	playerElement := (layer childWithId: aPoint asString).
	neighborElement := (layer childWithId:
		                    (aCpDirection * aPoint) asString).
	elements := {
		            playerElement.
		            neighborElement } asOrderedCollection.
	(neighborElement board grid at: neighborElement positionInField)
		class = MygSkWall ifFalse: [
		nextNeighborElement := (layer childWithId:
			                        (aCpDirection * (aCpDirection * aPoint))
				                        asString).
		elements add: nextNeighborElement ].
	^ elements
]

{ #category : #accessing }
MygSkBoardElement >> foregroundLayer [

	^ foregroundLayer
]

{ #category : #accessing }
MygSkBoardElement >> foregroundLayer: aBlElement [

	foregroundLayer := aBlElement 
]

{ #category : #initialization }
MygSkBoardElement >> initialize [

	super initialize.
	self initializeDirectionDict.
	self
		background: (BlBackground paint: Color transparent);
		layout: BlFrameLayout new;
		addEventHandlerOn: BlKeyDownEvent
		do: [ :anEvent | self manageEvent: anEvent ];
		requestFocus
]

{ #category : #accessing }
MygSkBoardElement >> initializeBackgroundLayer [

	| layer boxSize |
	layer := BlElement new
		         background: Color transparent;
		         layout: BlFrameLayout new;
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent.
			         c frame vertical alignCenter ].
	boxSize := self space extent / board width.
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygSkMovable) ifTrue: [
			tmpBox := aBox background ].
		tmpBox class = MygSkGround ifFalse: [
			boxElement := (MygSkBoxElement box: tmpBox)
				              positionInField: aBox position;
				              layout: BlSquaredLayout new;
				              board: board.
			boxElement constraintsDo: [ :c |
				c horizontal matchParent.
				c frame horizontal
					alignLeftAt: aBox position x - 1 / board width;
					weight: 1.0 / board width.
				c frame vertical
					alignTopAt: aBox position y - 1 / board height;
					weight: 1.0 / board height ].
			boxElement height: boxElement width.
			layer addChild: boxElement.
			boxElement updateBackgroundColor ] ].
	self backgroundLayer: layer
]

{ #category : #initialization }
MygSkBoardElement >> initializeDirectionDict [

	directionDict := {
		        (#DOWN -> CpDirection south).
		        (#UP -> CpDirection north).
		        (#LEFT -> CpDirection west).
		        (#RIGHT -> CpDirection east) } asDictionary.
]

{ #category : #accessing }
MygSkBoardElement >> initializeForegroundLayer [

	| layer boxSize |
	layer := BlElement new
		         background: Color transparent;
		         layout: BlFrameLayout new;
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
		boxSize := self space extent / board width.
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygSkMovable) ifFalse: [
			tmpBox := MygSkGround new ].
		boxElement := (MygSkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
	boxElement constraintsDo: [ :c |
				c horizontal matchParent.
				c frame horizontal
					alignLeftAt: aBox position x - 1 / board width;
					weight: 1.0 / board width.
				c frame vertical
					alignTopAt: aBox position y - 1 / board height;
					weight: 1.0 / board height ].
		layer addChild: boxElement as: aBox position asString.
		boxElement height: boxElement width.
		boxElement updateBackgroundColor ].
	self foregroundLayer: layer
]

{ #category : #initialization }
MygSkBoardElement >> manageEvent: anEvent [

	| player moved direction neighborElement elements |
	anEvent key name = #SPACE ifTrue: [ ^ self resetBoard ].
	anEvent key name = #ESCAPE ifTrue: [ ^ self space close ].
	board isFinished ifTrue: [ ^ self ].
	player := self board player.
	direction := self directionDict
		             at: anEvent key name
		             ifAbsent: [ ^ self ].
	elements := self
		            elementsToUpdateAtPosition: player position
		            goingIn: direction.
	neighborElement := elements second.
	
	moved := player move: direction.

	

	(moved and: [ neighborElement box class = MygSkBox ])
		ifTrue: [
			| animation |
			animation := neighborElement boxAnimationMovingInDirection:
				             direction.
			neighborElement addAnimation: (animation onFinishedDo: [
					 neighborElement resetAnimation.
					 self updateElements: elements ]) ]
		ifFalse: [ self updateElements: elements ]
]

{ #category : #opening }
MygSkBoardElement >> openWithModel: aSkBoard [

	| space |
	space := BlSpace new.
	space
		extent: 500 asPoint;
		resizable: false.
	space root addChild: self.

	self board: aSkBoard.

	space root background: Color red muchLighter.
	space root layout: BlFrameLayout new.
	space show
]

{ #category : #initialization }
MygSkBoardElement >> resetBoard [

	self space close.
	self board reset
]

{ #category : #private }
MygSkBoardElement >> updateElements: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]
