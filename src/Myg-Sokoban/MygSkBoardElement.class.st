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
		initializeForegroundLayer;
		setLayers.
]

{ #category : #initialization }
MygSkBoardElement >> boardPreview: aSkBoard [

	board := aSkBoard.
	self loseFocus.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ].
	self
		initializeBackgroundLayer;
		initializeForegroundLayer.
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
	playerElement := (layer childWithId: aPoint asString) firstChild.
	neighborElement := (layer childWithId:
		                    (aCpDirection * aPoint) asString) firstChild.
	elements := {
		            playerElement.
		            neighborElement } asOrderedCollection.
	(neighborElement board grid at: neighborElement positionInField)
		class = MygSkWall ifFalse: [
		nextNeighborElement := (layer childWithId:
			                        (aCpDirection * (aCpDirection * aPoint))
				                        asString) firstChild.
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
	layer := BlElement new background: Color lightGreen .
	layer size: self space extent.
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
				              board: board.
			layer addChild: boxElement.
			boxElement position: boxSize * (boxElement positionInField - 1).
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
	layer := BlElement new background: Color transparent.
	layer size: self space extent.
	boxSize := self space extent / board width.
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygSkMovable) ifTrue: [
			boxElement := (MygSkBoxElement box: tmpBox)
				              positionInField: aBox position;
				              board: board.

			layer addChild: boxElement as: aBox position asString.
			boxElement position: boxSize * (boxElement positionInField - 1).
			boxElement updateBackgroundColor ] ].

	self foregroundLayer: layer
]

{ #category : #initialization }
MygSkBoardElement >> manageEvent: anEvent [

	| player moved direction neighborElement elements |
	anEvent key name = #SPACE ifTrue: [
		^ self resetBoard ].
	anEvent key name = #ESCAPE ifTrue: [
		^ self space close ].
	board isFinished ifTrue: [ ^ self ].
	player := self board player.
	direction := self directionDict
		             at: anEvent key name
		             ifAbsent: [ ^ self ].
	elements := self
		            elementsToUpdateAtPosition: player position
		            goingIn: direction.
	moved := player move: direction.

	neighborElement := elements second.

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

{ #category : #adding }
MygSkBoardElement >> setLayers [

	| boxSize center |
	boxSize := self space extent / self board width.
	center := self space extent / 2 - (self board height / 2 * boxSize).
	"self backgroundLayer position: 0 @ center y.
	self foregroundLayer position: 0 @ center y."
	self position: 0 @ center y.
	self halt
]

{ #category : #private }
MygSkBoardElement >> updateElements: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]
