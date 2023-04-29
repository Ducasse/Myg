Class {
	#name : #MBoardTest,
	#superclass : #TestCase,
	#category : #'Myg-Mine'
}

{ #category : #tests }
MBoardTest >> testAccess [

	| b | 
	b := MBoard new. 
	self assert: b columnNumber equals: 30.
	self assert: b lineNumber equals: 12.
	self assert: (b atX: 1 atY: 1) x equals: 1.
	self assert: (b atX: 1 atY: 1) y equals: 1.
]

{ #category : #tests }
MBoardTest >> testAccess2 [

	| b | 
	b := MBoard new. 
	self assert: b columnNumber equals: 30.
	self assert: b lineNumber equals: 12.
	self assert: (b atX: 1 atY: 12) x equals: 1.
	self assert: (b atX: 1 atY: 12) y equals: 12.
]

{ #category : #tests }
MBoardTest >> testCornerDo [

	| b sum |
	b := MBoard new.
	sum := 0.
	b cornersDo: [:aCorner | sum := sum + 1].
	self assert: sum equals: 4
]

{ #category : #tests }
MBoardTest >> testCreatedBoard [

	| b |
	b := MBoard extent: 5@2.
	"	xxxxx
		xxxxx"
	self assert: b columnNumber equals: 5.
	self assert: b lineNumber equals: 2.
]

{ #category : #tests }
MBoardTest >> testCreatedBoardWithExtent [

	| b |
	b := MBoard extent: 100@200.
	self assert: b columnNumber equals: 100.
	self assert: b lineNumber equals: 200.
]

{ #category : #tests }
MBoardTest >> testGroundIsSet [

	| b |
	b := MBoard new.
	self assert: (b atX: 1 atY: 1) class equals: MTile
]

{ #category : #tests }
MBoardTest >> testPrintingCreatedBoard [

	| b |
	b := MBoard extent: 5@2.
	self assert: b columnNumber equals: 5.
	self assert: b lineNumber equals: 2.
	self assert: b asciiString equals: '_____
_____'
]

{ #category : #tests }
MBoardTest >> testTileKnowsItsBoard [

	| b |
	b := MBoard new.
	self assert: (b atX: 2 atY: 2) board equals: b
]

{ #category : #tests }
MBoardTest >> testTilePositionUpdatesBoard [

	| b t |
	b := MBoard new.
	t := MTile new.
	t setBoard: b.
	t x: 2 y: 2.
	self assert: (b atX: 2 atY: 2) equals: t
]

{ #category : #tests }
MBoardTest >> testTilePositionUpdatesBoard2 [

	| b t |
	b := MBoard new.
	t := MTile new.
	t setBoard: b.
	t x: 3 y: 1.
	self assert: (b atX: 3 atY: 1) equals: t
]
