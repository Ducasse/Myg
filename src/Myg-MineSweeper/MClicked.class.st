"
I am an empty box in the mine field that has already been clicked.
"
Class {
	#name : #MClicked,
	#superclass : #MBox,
	#category : #'Myg-MineSweeper-Model'
}

{ #category : #clicking }
MClicked >> click [
	"Nothing to be done, player should click somewhere else..."

	self propagateClick
]

{ #category : #testing }
MClicked >> isClickedBox [
	^ true
]

{ #category : #printing }
MClicked >> printOn: aStream [
	aStream << '_'
]
