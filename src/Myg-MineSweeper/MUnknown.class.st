"
I'm a box whose status is unknown. It did have been clicked yet.
"
Class {
	#name : #MUnknown,
	#superclass : #MBox,
	#category : #'Myg-MineSweeper-Model'
}

{ #category : #visiting }
MUnknown >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMUnknown: self
]

{ #category : #clicking }
MUnknown >> click [

	| box |
	box := MClicked new
		       position: self position;
		       board: self board.
	self announcer announce:
		(MBoxClickAndReplaceAnnouncement replaceBy: box).
	self board replaceBox: self by: box.

	self propagateClick.
	self board hasUnknownBox ifFalse: [ self board playerWin ]
]

{ #category : #testing }
MUnknown >> isUnknownBox [
	^ true 
]

{ #category : #printing }
MUnknown >> printOn: aStream [
	aStream << '*'
]
