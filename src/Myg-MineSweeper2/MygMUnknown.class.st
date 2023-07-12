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
	self board incrementRound.
	"the end of the game is when the player has clicked on all the unknown boxes.
	An alternate solution would be that he tagged all the possible bombs and they are effectively bombs."
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

{ #category : #clicking }
MygMUnknown >> propagateClick [

	((self board hasMineBoxAroundBox: self) not or: [
		 self board rightFlagCountAroundBox: self ]) ifTrue: [
		self board boxesAroundBox: self doWithIndexes: [ :box :i :j |
			box isClickedBox ifFalse: [ (self board boxAt: i at: j) click ] ] ]
]
