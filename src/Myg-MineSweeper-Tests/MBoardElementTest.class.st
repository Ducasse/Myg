"
This class contains tests
"
Class {
	#name : #MBoardElementTest,
	#superclass : #TestCase,
	#instVars : [
		'board'
	],
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #running }
MBoardElementTest >> setUp [

	super setUp.
	board := MFieldElement new game: (MBoard
			          matrixForField
			          magnifier: 1)
]

{ #category : #tests }
MBoardElementTest >> testAllHiddenAtBeginning [

	board childrenDo: [ :each |
		self assert: each background paint color equals: Color lightGray ]
]

{ #category : #'tests - ui' }
MBoardElementTest >> testClickOnMine [

	<skip>
	| box |
	self skip.
	box := board children third.
	box mine.
	self
		assert: box background image
		equals: (MBoxElement mine scaledToSize: box size)
]

{ #category : #'tests - ui' }
MBoardElementTest >> testClickOnUnknown [

	| box |
	box := board children first.
	box box click.
	self
		assert: box background paint color
		equals: Color white darker darker.
	self assert: box children first text asString equals: '0' 
]

{ #category : #'tests - ui' }
MBoardElementTest >> testMouseClickOnMine [

	<skip>
	| box unk|
	self skip.
	box := board children third.
	box forceLayout.
	unk := box findMouseEventTargetAt: 200 @ 50.
	unk mine.
	self
		assert: box background image
		equals: (MBoxElement mine scaledToSize: box size)
]

{ #category : #'tests - ui' }
MBoardElementTest >> testMouseClickOnUnknown [

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
MBoardElementTest >> testMouseRightClick [

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
		equals: (MBoxElement flag scaledToSize: box size)
]

{ #category : #'tests - ui' }
MBoardElementTest >> testRightClick [
	
	<skip>
	| box |
	self skip.
	box := board children first.
	box flag.
	self assert: (box childNamed: 'png' ifFound: [ true ]).
	self
		assert: (box childNamed: 'png') background image
		equals: (MBoxElement flag scaledToSize: box size)
]
