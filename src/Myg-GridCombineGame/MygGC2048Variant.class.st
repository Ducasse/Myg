"
I represent the original 2048 game variant.
"
Class {
	#name : #MygGC2048Variant,
	#superclass : #MygGCVariant,
	#instVars : [
		'random'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #accessing }
MygGC2048Variant >> game: aGame [
	"The game has just initialized and we do stuff."

	super game: aGame.
	
	self insertTileAtRandomPosition.

	game announcer
		when: MygGCSlideDoneAnnouncement
		send: #insertTileAtRandomPosition
		to: self
]

{ #category : #initialization }
MygGC2048Variant >> initialize [

	super initialize.
	
	random := Random new
]

{ #category : #actions }
MygGC2048Variant >> insertTileAtRandomPosition [
	"Insert a new tile, assuming game is not full, i.e. there is at least an available slot."

	game insertNewTileAt: (game availablePositions atRandom: random)
]

{ #category : #testing }
MygGC2048Variant >> isSuccessTileValue: anInteger [ 
	
	^ anInteger = 2048
]

{ #category : #accessing }
MygGC2048Variant >> nextAfterCombining: anInteger [ 
	
	^ anInteger * 2
]

{ #category : #accessing }
MygGC2048Variant >> nextInitialTileValue [
	
	^ 2
]

{ #category : #accessing }
MygGC2048Variant >> random [

	^ random
]

{ #category : #accessing }
MygGC2048Variant >> random: anObject [

	random := anObject
]
