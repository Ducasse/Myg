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
MygMUnknown >> clickIn: aMField at: x at: y [

	| box |
	box := MygMClicked new position: x@y.
	self announcer announce:
		(MygMBoxClickAndReplaceAnnouncement replaceBy: box).
	aMField replaceBoxAtRow: x column: y by: box.

	self propagateClickIn: aMField at: x at: y.
	aMField incrementRound.
	"the end of the game is when the player has clicked on all the unknown boxes.
	An alternate solution would be that he tagged all the possible bombs and they are effectively bombs."
	aMField hasUnknownBox
		ifFalse: [ aMField playerWin ]
		ifTrue: [ aMField fieldUpdate ]
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
MygMUnknown >> propagateClickIn: aMField at: x at: y [

	((aMField hasMineBoxAroundBoxAt: x at: y) not or: [
		 aMField rightFlagCountAroundAt: x at: y ]) ifTrue: [
		aMField boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
			box isClickedBox ifFalse: [
				(aMField boxAt: i at: j) clickIn: aMField at: i at: j] ] ]
]
