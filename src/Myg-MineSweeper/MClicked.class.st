"
I am an empty box in the mine field that has already been clicked.
"
Class {
	#name : #MClicked,
	#superclass : #MBox,
	#category : #'Myg-MineSweeper-Model'
}

{ #category : #visiting }
MClicked >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMClicked: self
]

{ #category : #clicking }
MClicked >> clickIn: aMField at: x at: y [
	"Nothing to be done, player should click somewhere else..."

	self propagateClickIn: aMField at: x at: y.
]

{ #category : #testing }
MClicked >> isClickedBox [
	^ true
]

{ #category : #printing }
MClicked >> printOn: aStream [
	aStream << '_'
]

{ #category : #clicking }
MClicked >> propagateClickIn: aMField at: x at: y [

	((aMField hasMineBoxAroundBoxAt: x at: y) not or: [
		 aMField rightFlagCountAroundAt: x at: y ]) ifTrue: [
		aMField boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
			box isClickedBox ifFalse: [
				(aMField boxAt: i at: j) clickIn: aMField at: i at: j
				"					aMField replaceBoxAtRow: i column: j by: MClicked new."
				"					self propagateClickIn: aMField at: i at: j " ] ] ]
]
