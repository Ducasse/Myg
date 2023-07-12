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

{ #category : #clicking }
MygMClicked >> propagateClick [


	((self board hasMineBoxAroundBox: self) not or: [
		 self board rightFlagCountAroundBox: self ]) ifTrue: [
		self board boxesAroundBox: self doWithIndexes: [ :box :i :j |
			box isClickedBox ifFalse: [
				(self board boxAt: i at: j) click ] ] ]
]
