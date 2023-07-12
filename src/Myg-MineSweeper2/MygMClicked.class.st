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

{ #category : #clicking }
MygMClicked >> clickIn: aMField at: x at: y [
	"Nothing to be done, player should click somewhere else..."

	self propagateClickIn: aMField at: x at: y.
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

{ #category : #clicking }
MygMClicked >> propagateClickIn: aMField at: x at: y [

	((aMField hasMineBoxAroundBoxAt: x at: y) not or: [
		 aMField rightFlagCountAroundAt: x at: y ]) ifTrue: [
		aMField boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
			box isClickedBox ifFalse: [
				(aMField boxAt: i at: j) clickIn: aMField at: i at: j ] ] ]
]
