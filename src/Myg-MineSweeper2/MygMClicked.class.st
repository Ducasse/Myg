"
I am an empty box in the mine field that has already been clicked.
"
Class {
	#name : #MygMClicked,
	#superclass : #MygMBox,
	#category : #'Myg-MineSweeper2-Model'
}

{ #category : #visiting }
MygMClicked >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMClicked: self
]

{ #category : #clicking }
MygMClicked >> click [
	"Nothing to be done, player should click somewhere else..."

	self propagateClick
]

{ #category : #testing }
MygMClicked >> isClickedBox [
	^ true
]

{ #category : #printing }
MygMClicked >> printOn: aStream [
	aStream << '_'
]
