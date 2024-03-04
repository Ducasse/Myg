"
I represent the event that communicates that a game when finished, either the player won or lost the game.
"
Class {
	#name : #MygGCFinishedAnnouncement,
	#superclass : #MygGCGameAnnouncement,
	#instVars : [
		'isSuccess'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #'instance creation' }
MygGCFinishedAnnouncement class >> newFullOn: aGame [

	^ self new
		  isSuccess: false;
		  game: aGame;
		  yourself
]

{ #category : #'instance creation' }
MygGCFinishedAnnouncement class >> newSuccessOn: aGame [

	^ self new
		  isSuccess: true;
		  game: aGame;
		  yourself
]

{ #category : #testing }
MygGCFinishedAnnouncement >> isSuccess [

	^ isSuccess
]

{ #category : #testing }
MygGCFinishedAnnouncement >> isSuccess: aBoolean [ 
	
	isSuccess := aBoolean
]
