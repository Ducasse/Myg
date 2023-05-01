Class {
	#name : #MyBoardTest,
	#superclass : #TestCase,
	#category : #'Myg-Mine-Core'
}

{ #category : #tests }
MyBoardTest >> testAccess [

	| b | 
	b := MyBoard new. 
	self assert: b columnNumber equals: 30.
	self assert: b lineNumber equals: 12.
	self assert: (b atX: 1 atY: 1) x equals: 1.
	self assert: (b atX: 1 atY: 1) y equals: 1.
]

{ #category : #tests }
MyBoardTest >> testAccess2 [

	| b | 
	b := MyBoard new. 
	self assert: b columnNumber equals: 30.
	self assert: b lineNumber equals: 12.
	self assert: (b atX: 1 atY: 12) x equals: 1.
	self assert: (b atX: 1 atY: 12) y equals: 12.
]

{ #category : #tests }
MyBoardTest >> testCornerDo [

	| b sum |
	b := MyBoard new.
	sum := 0.
	b cornersDo: [:aCorner | sum := sum + 1].
	self assert: sum equals: 4
]

{ #category : #tests }
MyBoardTest >> testCreatedBoard [

	| b |
	b := MyBoard extent: 5@2.
	"	xxxxx
		xxxxx"
	self assert: b columnNumber equals: 5.
	self assert: b lineNumber equals: 2.
]

{ #category : #tests }
MyBoardTest >> testCreatedBoardWithExtent [

	| b |
	b := MyBoard extent: 100@200.
	self assert: b columnNumber equals: 100.
	self assert: b lineNumber equals: 200.
]

{ #category : #tests }
MyBoardTest >> testGroundIsSet [

	| b |
	b := MyBoard new.
	self assert: (b atX: 1 atY: 1) class equals: MyTile
]

{ #category : #tests }
MyBoardTest >> testPrintingCreatedBoard [

	| b |
	b := MyBoard extent: 5@2.
	self assert: b columnNumber equals: 5.
	self assert: b lineNumber equals: 2.
	self assert: b asciiString equals: '_____
_____'
]

{ #category : #tests }
MyBoardTest >> testTileKnowsItsBoard [

	| b |
	b := MyBoard new.
	self assert: (b atX: 2 atY: 2) board equals: b
]

{ #category : #tests }
MyBoardTest >> testTilePositionUpdatesBoard [

	| b t |
	b := MyBoard new.
	t := MyTile new.
	t setBoard: b.
	t x: 2 y: 2.
	self assert: (b atX: 2 atY: 2) equals: t
]

{ #category : #tests }
MyBoardTest >> testTilePositionUpdatesBoard2 [

	| b t |
	b := MyBoard new.
	t := MyTile new.
	t setBoard: b.
	t x: 3 y: 1.
	self assert: (b atX: 3 atY: 1) equals: t
]
