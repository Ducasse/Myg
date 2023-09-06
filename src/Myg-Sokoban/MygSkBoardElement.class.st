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

	^ backgroundLayer
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

{ #category : #accessing }
MygSkBoardElement >> directionDict [

	^ directionDict
]

{ #category : #'as yet unclassified' }
MygSkBoardElement >> elementsToUpdateAtPosition: aPoint goingIn: aCpDirection [

	| layer elements playerElement neighborElement nextNeighborElement |
	layer := self foregroundLayer.
	playerElement := (layer childNamed: aPoint asString) firstChild.
	neighborElement := (layer childNamed:
		                    (aCpDirection * aPoint) asString) firstChild.
	elements := {
		            playerElement.
		            neighborElement } asOrderedCollection.
	(neighborElement board grid at: neighborElement positionInField)
		class = MygSkWall ifFalse: [
		nextNeighborElement := (layer childNamed:
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
		background: (BlBackground paint: Color veryLightGray);
		layout: BlFrameLayout new;
		addEventHandlerOn: BlKeyDownEvent
		do: [ :anEvent | self manageEvent: anEvent ];
		requestFocus
]

{ #category : #accessing }
MygSkBoardElement >> initializeBackgroundLayer [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width;
				          cellSpacing: 2);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygSkMovable) ifTrue: [
			tmpBox := aBox background ].
		boxElement := (MygSkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			clipChildren: false.
		layer addChild: container.
		boxElement updateBackgroundColor ].

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

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width;
				          cellSpacing: 2);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygSkMovable) ifFalse: [
			tmpBox := MygSkGround new ].
		boxElement := (MygSkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			clipChildren: false.

		layer addChild: container as: aBox position asString.
		boxElement updateBackgroundColor ].

	self foregroundLayer: layer
]

{ #category : #initialization }
MygSkBoardElement >> manageEvent: anEvent [

	| player moved direction neighborElement elements |
	anEvent key name = #SPACE ifTrue: [
		self resetBoard.
		^ self ].
	anEvent key name = #ESCAPE ifTrue: [
		self space close.
		^ self ].
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

{ #category : #'as yet unclassified' }
MygSkBoardElement >> updateElements: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]
