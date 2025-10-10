Class {
	#name : 'TBoardElementTest',
	#superclass : 'TestCase',
	#category : 'Myg-Takuzu-Tests',
	#package : 'Myg-Takuzu-Tests'
}

{ #category : 'tests - ui' }
TBoardElementTest >> testClickChangeBackground [

	| board unk |
	board := TBoardElement new board: TAbstractTest new gridForTest.
	unk := board children second.
	self assert: unk box isTUnknownBox.
	self assert: unk background paint color equals: Color veryDarkGray.
	unk click.
	self assert: unk background paint color equals: Color red.
]

{ #category : 'tests - ui' }
TBoardElementTest >> testClickDoesntChangeBackground [

	| board unk |
	board := TBoardElement new board: TAbstractTest new gridForTest.
	unk := board children first.
	self assert: unk box isTFixedBox.
	self assert: unk background paint color equals: Color lightBlue.
	unk click.
	self assert: unk background paint color equals: Color lightBlue.
]

{ #category : 'tests - model' }
TBoardElementTest >> testClickOnUnknowElementGetItKnown [

	| board unk |
	board := TBoardElement new board: TAbstractTest new gridForTest.
	unk := board children second.
	self assert: unk box isTUnknownBox.
	unk click.
	self assert: unk box value equals: 0
]

{ #category : 'tests - model' }
TBoardElementTest >> testClickThreeTimesReturnFirstState [

	| board unk startState | 
	board := TBoardElement new board: TAbstractTest new gridForTest.
	unk := board children second.
	startState := unk box value.
	unk click.
	unk click.
	unk click.
	self assert: unk box value equals: startState
]

{ #category : 'tests - model' }
TBoardElementTest >> testClickTwiceOnUnknowElementGetItKnown [

	| board unk |
	board := TBoardElement new board: TAbstractTest new gridForTest.
	unk := board children second.
	self assert: unk box isTUnknownBox.
	unk click.
	unk click.
	self assert: unk box value equals: 1
]

{ #category : 'tests - model' }
TBoardElementTest >> testElementGetCorrectPosition [

	| board unk |
	board := TBoardElement new board: TAbstractTest new gridForTest.
	unk := board children second.
	self assert: unk box isTUnknownBox.
	self assert: unk box position equals: 2 @ 1
]

{ #category : 'tests - ui' }
TBoardElementTest >> testMouseClickChangeBackground [

	| board unk elt |
	board := TBoardElement new board: TAbstractTest new gridForTest.
	elt := board children second.
	elt forceLayout.
	unk := elt findMouseEventTargetAt: 250 @ 50.
	self assert: unk box isTUnknownBox.
	self assert: unk background paint color equals: Color veryDarkGray.
	unk click.
	self assert: unk background paint color equals: Color red
]

{ #category : 'tests - ui' }
TBoardElementTest >> testMouseClickDoesntChangeBackground [

	| board unk elt |
	board := TBoardElement new board: TAbstractTest new gridForTest.
	elt := board children first.
	elt forceLayout.
	unk := elt findMouseEventTargetAt: 100 @ 50.
	self assert: unk box isTFixedBox.
	self assert: unk background paint color equals: Color lightBlue.
	unk click.
	self assert: unk background paint color equals: Color lightBlue
]
