"
I am a box with a mine in the mine field.
If I am clicked by the player, he dies.
"
Class {
	#name : 'MMineBox',
	#superclass : 'MBox',
	#category : 'Myg-MineSweeper-Model',
	#package : 'Myg-MineSweeper',
	#tag : 'Model'
}

{ #category : 'clicking' }
MMineBox >> click [

	self isFlagged ifTrue: [ ^ self ].
	self announcer announce: MBoxExplosionAnnouncement new.
	self board gameEnded ifFalse: [ self board playerLoose ]
]

{ #category : 'testing' }
MMineBox >> isMineBox [
	^ true
]

{ #category : 'printing' }
MMineBox >> printOn: aStream [
	aStream << 'o'
]
