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
	bestCount:		<Object>
	finished:		<Object>


    Implementation Points
"
Class {
	#name : 'MygSkLevelInformation',
	#superclass : 'Object',
	#instVars : [
		'finished',
		'bestCount'
	],
	#category : 'Myg-Sokoban-Model',
	#package : 'Myg-Sokoban',
	#tag : 'Model'
}

{ #category : 'accessing' }
MygSkLevelInformation class >> count: aNumber [

	^ (self new bestCount: aNumber) 
]

{ #category : 'accessing' }
MygSkLevelInformation >> bestCount [ 

	^ bestCount
]

{ #category : 'accessing' }
MygSkLevelInformation >> bestCount: aNumber [

	bestCount := aNumber 
]

{ #category : 'initialization' }
MygSkLevelInformation >> initialize [

	super initialize.
	finished := true
]

{ #category : 'testing' }
MygSkLevelInformation >> isFinished [ 
	
	^ finished
]
