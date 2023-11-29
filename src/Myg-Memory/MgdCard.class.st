Class {
	#name : #MgdCard,
	#superclass : #MygAbstractBox,
	#instVars : [
		'symbol',
		'flipped',
		'announcer'
	],
	#category : #'Myg-Memory-Model'
}

{ #category : #accessing }
MgdCard >> announcer [  

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #actions }
MgdCard >> disappear [ 
	self notifyDisappear 
]

{ #category : #actions }
MgdCard >> flip [ 
	flipped := flipped not.
	self notifyFlipped
]

{ #category : #initialization }
MgdCard >> initialize [ 
	super initialize.
	flipped := false
]

{ #category : #testing }
MgdCard >> isFlipped [ 
	^ flipped 
]

{ #category : #notifying }
MgdCard >> notifyDisappear [ 
	self announcer announce: MgdCardDisappearAnnouncement new
]

{ #category : #notifying }
MgdCard >> notifyFlipped [ 
	self announcer announce: MgdCardFlipBackAnnouncement new
]

{ #category : #printing }
MgdCard >> printOn: aStream [ 
	aStream 
		nextPutAll: 'Card';
		nextPut: Character space;
		nextPut: $(;
		nextPut: self symbol;
		nextPut: $) 
]

{ #category : #accessing }
MgdCard >> symbol [
	^ symbol 
]

{ #category : #accessing }
MgdCard >> symbol: aCharacter [
	symbol := aCharacter 
]
