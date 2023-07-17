"
I'm a box whose status is unknown. It did have been clicked yet.
"
Class {
	#name : #MygMUnknown,
	#superclass : #MygMBox,
	#category : #'Myg-MineSweeper2-Model'
}

{ #category : #visiting }
MygMUnknown >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMUnknown: self
]

{ #category : #clicking }
MygMUnknown >> click [

	| box |
	box := MygMClicked new
		       position: self position;
		       board: self board.
	self announcer announce:
		(MygMBoxClickAndReplaceAnnouncement replaceBy: box).
	self board replaceBox: self by: box.

	self propagateClick.
	self board hasUnknownBox ifFalse: [ self board playerWin ]
]

{ #category : #testing }
MygMUnknown >> isUnknownBox [
	^ true 
]

{ #category : #printing }
MygMUnknown >> printOn: aStream [
	aStream << '*'
]
