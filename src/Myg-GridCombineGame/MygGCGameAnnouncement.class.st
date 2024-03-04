"
I represent an event that occurs in a `GCGame`.
"
Class {
	#name : #MygGCGameAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'game'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #accessing }
MygGCGameAnnouncement >> game [

	^ game
]

{ #category : #accessing }
MygGCGameAnnouncement >> game: anObject [

	game := anObject
]
