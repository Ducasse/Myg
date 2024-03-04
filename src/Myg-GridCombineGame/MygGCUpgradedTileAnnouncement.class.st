"
I represent the event of a tile that has been combined with another tile and then upgrades it's value (the other tile is deleted).
"
Class {
	#name : #MygGCUpgradedTileAnnouncement,
	#superclass : #MygGCTileAnnouncement,
	#instVars : [
		'oldValue',
		'newValue'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #accessing }
MygGCUpgradedTileAnnouncement >> newValue [

	^ newValue
]

{ #category : #accessing }
MygGCUpgradedTileAnnouncement >> newValue: anObject [

	newValue := anObject
]

{ #category : #accessing }
MygGCUpgradedTileAnnouncement >> oldValue [

	^ oldValue
]

{ #category : #accessing }
MygGCUpgradedTileAnnouncement >> oldValue: anObject [

	oldValue := anObject
]
