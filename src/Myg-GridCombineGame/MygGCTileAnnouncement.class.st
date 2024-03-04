"
I am an event that occurs on a game's tile.
"
Class {
	#name : #MygGCTileAnnouncement,
	#superclass : #MygGCGameAnnouncement,
	#instVars : [
		'tile'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #accessing }
MygGCTileAnnouncement >> tile [

	^ tile
]

{ #category : #accessing }
MygGCTileAnnouncement >> tile: anObject [

	tile := anObject
]
