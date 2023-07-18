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
	board:		<Object>
	position:		<Object>


    Implementation Points
"
Class {
	#name : #MygSkElement,
	#superclass : #MygAbstractBox,
	#category : #'Myg-Sokoban-Model'
}

{ #category : #initialization }
MygSkElement class >> configured [ 

	^ self new configured
]

{ #category : #'default encoding' }
MygSkElement class >> textualMapCharacter [
	^ $Z
]

{ #category : #accessing }
MygSkElement >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #action }
MygSkElement >> bringIn: aSkMovable going: aDirection [
	"By default when a movable wants to move in, we move it in. By default do not use the direction, it is only usd for case where we need to check the next element in that direction, e.g., Player push a Box and the box should check if there is a ground or a wall before moving in that direction."

	| previousPosition |
	previousPosition := aSkMovable position.
	aSkMovable basicPosition: self position.
	self board gameManager ifNotNil: [
		self board gameManager currentMoveCount:
			self board gameManager currentMoveCount + 1 ].
	self board updatePositionOf: aSkMovable from: previousPosition.
	^ true
]

{ #category : #accessing }
MygSkElement >> configureBoard: aBoard [

	self board: aBoard.
	
]

{ #category : #initialization }
MygSkElement >> configured [ 

	^self
]

{ #category : #move }
MygSkElement >> isPlayer [
	^ false
]

{ #category : #move }
MygSkElement >> isTarget [
	^ false
]

{ #category : #move }
MygSkElement >> moveIn: aNeighbor going: aDirection [
	"To move in a position, we ask the entity where we want to get in to decide.
	This is not a double dispatch per se because we do not have to discrimnate on the receiver."
	
	^ aNeighbor bringIn: self going: aDirection
]

{ #category : #action }
MygSkElement >> postCreationAction [

	self
]

{ #category : #printing }
MygSkElement >> printOn: aStream [ 

	super printOn: aStream.
	aStream nextPut: $-.
	position printOn: aStream
]
