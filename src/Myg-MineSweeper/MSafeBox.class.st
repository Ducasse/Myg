"
I'm a box whose status is unknown. It did have been clicked yet.
"
Class {
	#name : 'MSafeBox',
	#superclass : 'MBox',
	#category : 'Myg-MineSweeper-Model',
	#package : 'Myg-MineSweeper',
	#tag : 'Model'
}

{ #category : 'clicking' }
MSafeBox >> click [

	self clicked: true.
	self announcer announce: MBoxClickedAnnouncement new.

	self propagateClick. "Here it is usefull for when there is no bomb around"
	self board hasBeenCleared ifTrue: [ self board playerWin ]
]

{ #category : 'testing' }
MSafeBox >> isSafeBox [
	^ true 
]

{ #category : 'printing' }
MSafeBox >> printOn: aStream [
	aStream << '*'
]
