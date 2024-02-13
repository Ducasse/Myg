"
I'm a box whose status is unknown. It did have been clicked yet.
"
Class {
	#name : #MSafeBox,
	#superclass : #MBox,
	#category : #'Myg-MineSweeper-Model'
}

{ #category : #clicking }
MSafeBox >> click [

	| box |
	box := MClicked new
		       position: self position;
		       board: self board.
	self announcer announce:
		(MBoxClickAndReplaceAnnouncement replaceBy: box).
	self board replaceBox: self by: box.

	self propagateClick.
	self board hasSafeBox ifFalse: [ self board playerWin ]
]

{ #category : #testing }
MSafeBox >> isSafeBox [
	^ true 
]

{ #category : #printing }
MSafeBox >> printOn: aStream [
	aStream << '*'
]
