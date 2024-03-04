"
I'm a mocked game variant. Useful for debugging or testing.
"
Class {
	#name : #MygGCMockVariant,
	#superclass : #MygGCVariant,
	#instVars : [
		'nextValueBlock',
		'initialValueBlock',
		'isSuccessBlock',
		'slideDoneBlock'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #accessing }
MygGCMockVariant >> game: aGame [
	"The game has just initialized and we do stuff."

	super game: aGame.
	
	game announcer
		when: MygGCSlideDoneAnnouncement
		send: #slideDone:
		to: self
]

{ #category : #accessing }
MygGCMockVariant >> initialValueBlock [

	^ initialValueBlock
]

{ #category : #accessing }
MygGCMockVariant >> initialValueBlock: aBlock [

	initialValueBlock := aBlock
]

{ #category : #initialization }
MygGCMockVariant >> initialize [

	super initialize.
	
	initialValueBlock := [ 2 ].
	nextValueBlock := [ :n | n * 2 ].
	isSuccessBlock := [ :n | n = 2048 ].
	slideDoneBlock := [ :ann | ].
]

{ #category : #accessing }
MygGCMockVariant >> isSuccessBlock [

	^ isSuccessBlock
]

{ #category : #accessing }
MygGCMockVariant >> isSuccessBlock: aBlock [

	isSuccessBlock := aBlock
]

{ #category : #testing }
MygGCMockVariant >> isSuccessTileValue: anObject [
	"Answer where this tile contents mean a game finished with success."

	^ isSuccessBlock value: anObject
]

{ #category : #accessing }
MygGCMockVariant >> nextAfterCombining: anObject [
	"Answer the next tile value after a combination of the received argument."

	^ nextValueBlock value: anObject
]

{ #category : #accessing }
MygGCMockVariant >> nextInitialTileValue [
	"Answer a content value for a new tile."

	^ initialValueBlock value
]

{ #category : #accessing }
MygGCMockVariant >> nextValueBlock [

	^ nextValueBlock
]

{ #category : #accessing }
MygGCMockVariant >> nextValueBlock: aBlock [

	nextValueBlock := aBlock
]

{ #category : #accessing }
MygGCMockVariant >> slideDone: aGCSlideDoneAnnouncement [

	slideDoneBlock cull: aGCSlideDoneAnnouncement
]

{ #category : #accessing }
MygGCMockVariant >> slideDoneBlock [

	^ slideDoneBlock
]

{ #category : #accessing }
MygGCMockVariant >> slideDoneBlock: anObject [

	slideDoneBlock := anObject
]
