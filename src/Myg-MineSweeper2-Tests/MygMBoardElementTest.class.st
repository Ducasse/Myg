Class {
	#name : #MygMBoardElementTest,
	#superclass : #TestCase,
	#instVars : [
		'board'
	],
	#category : #'Myg-MineSweeper2-Tests'
}

{ #category : #running }
MygMBoardElementTest >> setUp [

	super setUp.
	board := MygMFieldElement new game: (MygMBoard
			          matrixForField
			          magnifier: 1)
]

{ #category : #tests }
MygMBoardElementTest >> testAllHiddenAtBeginning [

	board childrenDo: [ :each |
		self assert: each background paint color equals: Color lightGray ]
]

{ #category : #'tests - ui' }
MygMBoardElementTest >> testClickOnMine [

	<skip>
	| box |
	self skip.
	box := board children third.
	box mine.
	self
		assert: box background image
		equals: (MygMBoxElement mine scaledToSize: box size)
]

{ #category : #'tests - ui' }
MygMBoardElementTest >> testClickOnUnknown [

	| box |
	box := board children first.
	box box click.
	self
		assert: box background paint color
		equals: Color white darker darker.
	self assert: box children first text asString equals: '0' 
]

{ #category : #'tests - ui' }
MygMBoardElementTest >> testMouseClickOnMine [

	<skip>
	| box unk|
	self skip.
	box := board children third.
	box forceLayout.
	unk := box findMouseEventTargetAt: 200 @ 50.
	unk mine.
	self
		assert: box background image
		equals: (MygMBoxElement mine scaledToSize: box size)
]

{ #category : #'tests - ui' }
MygMBoardElementTest >> testMouseClickOnUnknown [

	| box unk |
	box := board children first.
	box forceLayout.
	unk := box findMouseEventTargetAt: 50 @ 50.
	unk box click.
	self
		assert: unk background paint color
		equals: Color white darker darker.
	self assert: box children first text asString equals: '0'
]

{ #category : #'tests - ui' }
MygMBoardElementTest >> testMouseRightClick [

	<skip>
	| box unk |
	self skip.
	box := board children first.
	box forceLayout.
	unk := box findMouseEventTargetAt: 200 @ 50.
	unk flag.
	self assert: (box childNamed: 'png' ifFound: [ true ]).
	self
		assert: (box childNamed: 'png') background image
		equals: (MygMBoxElement flag scaledToSize: box size)
]

{ #category : #'tests - ui' }
MygMBoardElementTest >> testRightClick [
	
	<skip>
	| box |
	self skip.
	box := board children first.
	box flag.
	self assert: (box childNamed: 'png' ifFound: [ true ]).
	self
		assert: (box childNamed: 'png') background image
		equals: (MygMBoxElement flag scaledToSize: box size)
]
