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
	levelDictionary:		<Object>


    Implementation Points
"
Class {
	#name : 'MygSkLevelPack',
	#superclass : 'Object',
	#instVars : [
		'levelDictionary'
	],
	#category : 'Myg-Sokoban-Model',
	#package : 'Myg-Sokoban',
	#tag : 'Model'
}

{ #category : 'accessing' }
MygSkLevelPack >> at: anIndex isBetterThan: aSkLevelInformation [

	| registeredCount newCount|
	registeredCount := (self levelDictionary at: anIndex) bestCount.
	newCount := aSkLevelInformation bestCount.
	^ registeredCount < newCount 
]

{ #category : 'accessing' }
MygSkLevelPack >> at: anIndex put: aSkLevelInformation [

	self levelDictionary at: anIndex ifPresent: [
		(self at: anIndex isBetterThan: aSkLevelInformation) ifTrue: [
			^ self ] ].
	self levelDictionary at: anIndex put: aSkLevelInformation
]

{ #category : 'initialization' }
MygSkLevelPack >> initialize [ 

	super initialize.
	levelDictionary := Dictionary new
]

{ #category : 'accessing' }
MygSkLevelPack >> levelDictionary [

	^ levelDictionary
]

{ #category : 'accessing' }
MygSkLevelPack >> levelDictionary: aDictionary [

	levelDictionary := aDictionary 
]
