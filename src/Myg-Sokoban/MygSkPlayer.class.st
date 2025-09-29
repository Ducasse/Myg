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
	facing:		<Object>


    Implementation Points
"
Class {
	#name : 'MygSkPlayer',
	#superclass : 'MygSkMovable',
	#instVars : [
		'facing'
	],
	#category : 'Myg-Sokoban-Model',
	#package : 'Myg-Sokoban',
	#tag : 'Model'
}

{ #category : 'default encoding' }
MygSkPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : 'accessing' }
MygSkPlayer >> backgroundRepresentation [

	| dict |
	dict := {
		        (CpNorthDirection -> MygSkBoxElement playerUpIcon).
		        (CpWestDirection -> MygSkBoxElement playerLeftIcon).
		        (CpSouthDirection -> MygSkBoxElement playerDownIcon).
		        (CpEastDirection -> MygSkBoxElement playerRightIcon) } asDictionary.
	^ dict at: self facing
]

{ #category : 'accessing' }
MygSkPlayer >> facing [ 

	^ facing
]

{ #category : 'accessing' }
MygSkPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : 'initialization' }
MygSkPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection
]

{ #category : 'move' }
MygSkPlayer >> isPlayer [ 
	^ true
]

{ #category : 'move' }
MygSkPlayer >> move: aCpDirection [

	self facing: aCpDirection class.
	^ super move: aCpDirection
]

{ #category : 'default encoding' }
MygSkPlayer >> textualMapCharacter [

	^ self background class = MygSkTarget
		  ifTrue: [ MygSkPlayerOnTarget textualMapCharacter ]
		  ifFalse: [ self class textualMapCharacter ]
]
