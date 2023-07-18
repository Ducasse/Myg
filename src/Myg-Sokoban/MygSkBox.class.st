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


    Implementation Points
"
Class {
	#name : #MygSkBox,
	#superclass : #MygSkMovable,
	#category : #'Myg-Sokoban-Model'
}

{ #category : #'default encoding' }
MygSkBox class >> textualMapCharacter [ 
	
	^ $$
]

{ #category : #accessing }
MygSkBox >> backgroundRepresentation [

	^ self background className = 'SkTarget'
		  ifTrue: [ MygSkBoxElement boxIcon darker darker ]
		  ifFalse: [ MygSkBoxElement boxIcon ]
]

{ #category : #move }
MygSkBox >> bringIn: aPlayer going: aDirection [

	| boxPreviousPosition neighbor didMove |
	aPlayer class = self class ifTrue: [ ^ false ].
	boxPreviousPosition := self position.
	"we store the current position because if I can move, I will have to move the player to my old position."
	neighbor := board atPosition: aDirection * self position.
	"First I tried to move in by asking my neighbor"
	didMove := self moveIn: neighbor going: aDirection.
	"If I moved them moved the player to move into my previous position"
	didMove ifTrue: [
		| playerPreviousPosition |
		playerPreviousPosition := aPlayer position.
		aPlayer basicPosition: boxPreviousPosition.
		board updatePositionOf: aPlayer from: playerPreviousPosition ].
	^ didMove
]

{ #category : #move }
MygSkBox >> isBox [ 

	^ true
]
