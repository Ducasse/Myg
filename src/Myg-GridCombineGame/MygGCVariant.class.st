"
I represent a variant of a `GCGame`.

Subclasses may want to subscribe to game announcements to react.
"
Class {
	#name : #MygGCVariant,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #testing }
MygGCVariant class >> isAbstract [

	^ self == MygGCVariant
]

{ #category : #accessing }
MygGCVariant >> game: aGCGame [

	game := aGCGame
]

{ #category : #testing }
MygGCVariant >> isSuccessTileValue: anObject [
	"Answer where this tile contents mean a game finished with success."

	^ self subclassResponsibility
]

{ #category : #accessing }
MygGCVariant >> nextAfterCombining: anObject [
	"Answer the next tile value after a combination of the received argument."

	^ self subclassResponsibility
]

{ #category : #accessing }
MygGCVariant >> nextInitialTileValue [
	"Answer a content value for a new tile."

	^ self subclassResponsibility
]
