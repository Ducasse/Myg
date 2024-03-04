"
I am an event that happens when a slide was done in a game, and the game doesn't finish yet.
"
Class {
	#name : #MygGCSlideDoneAnnouncement,
	#superclass : #MygGCGameAnnouncement,
	#instVars : [
		'isVertical',
		'isToEnd'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #accessing }
MygGCSlideDoneAnnouncement >> isToEnd [

	^ isToEnd
]

{ #category : #accessing }
MygGCSlideDoneAnnouncement >> isToEnd: anObject [

	isToEnd := anObject
]

{ #category : #accessing }
MygGCSlideDoneAnnouncement >> isVertical [

	^ isVertical
]

{ #category : #accessing }
MygGCSlideDoneAnnouncement >> isVertical: anObject [

	isVertical := anObject
]
