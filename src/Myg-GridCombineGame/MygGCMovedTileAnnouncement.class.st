"
I represent the event of a tile that has changed position in a game's board.
"
Class {
	#name : #MygGCMovedTileAnnouncement,
	#superclass : #MygGCTileAnnouncement,
	#instVars : [
		'oldPosition',
		'newPosition'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #accessing }
MygGCMovedTileAnnouncement >> newPosition [

	^ newPosition
]

{ #category : #accessing }
MygGCMovedTileAnnouncement >> newPosition: anObject [

	newPosition := anObject
]

{ #category : #accessing }
MygGCMovedTileAnnouncement >> oldPosition [

	^ oldPosition
]

{ #category : #accessing }
MygGCMovedTileAnnouncement >> oldPosition: anObject [

	oldPosition := anObject
]
