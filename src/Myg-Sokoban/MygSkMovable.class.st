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
	background:		<Object>


    Implementation Points
"
Class {
	#name : #MygSkMovable,
	#superclass : #MygSkElement,
	#instVars : [
		'background'
	],
	#category : #'Myg-Sokoban-Model'
}

{ #category : #accessing }
MygSkMovable >> background [

	^ background
]

{ #category : #accessing }
MygSkMovable >> background: anObject [

	background := anObject
]

{ #category : #initialization }
MygSkMovable >> configured [

	self background: self defaultBackground.
	^ self
]

{ #category : #initialization }
MygSkMovable >> defaultBackground [

	"self class = SkPlayer ifTrue: [ self halt ]."
	^ MygSkGround new
		  basicPosition: self position;
		  board: board;
		  yourself
]

{ #category : #move }
MygSkMovable >> move: aCpDirection [

	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection.
]

{ #category : #move }
MygSkMovable >> moveEast [

	^ self move: CpDirection east
]

{ #category : #move }
MygSkMovable >> moveNorth [

	^ self move: CpDirection north
]

{ #category : #move }
MygSkMovable >> moveSouth [

	^ self move: CpDirection south
]

{ #category : #move }
MygSkMovable >> moveWest [

	^ self move: CpDirection west
]

{ #category : #accessing }
MygSkMovable >> position: aPoint [

	position := aPoint.
	self background position: aPoint
]
