Class {
	#name : #MgdCardModel,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'flipped',
		'announcer'
	],
	#category : #'Myg-Memory-Model'
}

{ #category : #accessing }
MgdCardModel >> announcer [  

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #actions }
MgdCardModel >> disappear [ 
	self notifyDisappear 
]

{ #category : #actions }
MgdCardModel >> flip [ 
	flipped := flipped not.
	self notifyFlipped
]

{ #category : #initialization }
MgdCardModel >> initialize [ 
	super initialize.
	flipped := false
]

{ #category : #testing }
MgdCardModel >> isFlipped [ 
	^ flipped 
]

{ #category : #notifying }
MgdCardModel >> notifyDisappear [ 
	self announcer announce: MgdCardDisappearAnnouncement new
]

{ #category : #notifying }
MgdCardModel >> notifyFlipped [ 
	self announcer announce: MgdCardFlipBackAnnouncement new
]

{ #category : #printing }
MgdCardModel >> printOn: aStream [ 
	aStream 
		nextPutAll: 'Card';
		nextPut: Character space;
		nextPut: $(;
		nextPut: self symbol;
		nextPut: $) 
]

{ #category : #accessing }
MgdCardModel >> symbol [
	^ symbol 
]

{ #category : #accessing }
MgdCardModel >> symbol: aCharacter [
	symbol := aCharacter 
]
