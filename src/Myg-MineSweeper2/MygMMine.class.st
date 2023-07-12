"
I am a box with a mine in the mine field.
If I am clicked by the player, he dies.
"
Class {
	#name : #MygMMine,
	#superclass : #MygMBox,
	#category : #'Myg-MineSweeper2-Model'
}

{ #category : #visiting }
MygMMine >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMMine: self
]

{ #category : #clicking }
MygMMine >> click [

	self isFlagged ifTrue: [ ^ self ].

	self announcer announce: MygMBoxExplosionAnnouncement new.
	self board gameEnded ifFalse: [ self board playerLoose ]
]

{ #category : #testing }
MygMMine >> isMineBox [
	^ true
]

{ #category : #printing }
MygMMine >> printOn: aStream [
	aStream << 'o'
]
