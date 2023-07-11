"
A MFieldTest is a test class for testing the behavior of MField
"
Class {
	#name : #MFieldTest,
	#superclass : #MAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #running }
MFieldTest >> setUp [

	field := MBoard createWithMatrix: self matrixForField
]

{ #category : #'tests-accessing' }
MFieldTest >> testBoxAtAt [
	self
		assert: (field boxAt: 1 at: 1) isUnknownBox;
		assert: (field boxAt: 1 at: 2) isUnknownBox;
		assert: (field boxAt: 1 at: 3) isMineBox;
		assert: (field boxAt: 1 at: 4) isUnknownBox;
		assert: (field boxAt: 1 at: 5) isUnknownBox;
		assert: (field boxAt: 2 at: 1) isUnknownBox;
		assert: (field boxAt: 2 at: 2) isUnknownBox;
		assert: (field boxAt: 2 at: 3) isMineBox;
		assert: (field boxAt: 2 at: 4) isUnknownBox;
		assert: (field boxAt: 2 at: 5) isUnknownBox;
		assert: (field boxAt: 3 at: 1) isMineBox;
		assert: (field boxAt: 3 at: 2) isMineBox;
		assert: (field boxAt: 3 at: 3) isMineBox;
		assert: (field boxAt: 3 at: 4) isUnknownBox;
		assert: (field boxAt: 3 at: 5) isUnknownBox;
		assert: (field boxAt: 4 at: 1) isUnknownBox;
		assert: (field boxAt: 4 at: 2) isUnknownBox;
		assert: (field boxAt: 4 at: 3) isUnknownBox;
		assert: (field boxAt: 4 at: 4) isMineBox;
		assert: (field boxAt: 4 at: 5) isMineBox;
		assert: (field boxAt: 5 at: 1) isMineBox;
		assert: (field boxAt: 5 at: 2) isUnknownBox;
		assert: (field boxAt: 5 at: 3) isUnknownBox;
		assert: (field boxAt: 5 at: 4) isUnknownBox;
		assert: (field boxAt: 5 at: 5) isUnknownBox
]

{ #category : #'tests-enumerating' }
MFieldTest >> testBoxesAroundBoxAtAtDoWithIndexes [
	| expected |
	expected := #((1 2) (2 1) (2 2) (2 3)).
	field boxesAroundBoxAt: 1 at: 1 doWithIndexes: [ :box :i :j |
		self
			assert: expected first first equals: i;
			assert: expected first second equals: j.
	expected := expected allButFirst ].

	expected := #((2 2) (2 3) (2 4) (3 2) (3 4) (4 2) (4 3) (4 4)).
	field boxesAroundBoxAt: 3 at: 3 doWithIndexes: [ :box :i :j |
		self
			assert: expected first first equals: i;
			assert: expected first second equals: j.
	expected := expected allButFirst ].

	expected := #((4 4) (4 5) (5 4)).
	field boxesAroundBoxAt: 5 at: 5 doWithIndexes: [ :box :i :j |
		self
			assert: expected first first equals: i;
			assert: expected first second equals: j.
	expected := expected allButFirst ].
]

{ #category : #'tests-box api' }
MFieldTest >> testFieldUpdate [

	| update |
	update := false.
	field announcer when: MFieldUpdate do: [ update := true ].
	field clickOnBoxAt: 1 at: 1.

	self assert: update
]

{ #category : #tests }
MFieldTest >> testFlagIsWorking [
	self deny: (field boxAt: 1 at: 3) isFlagged.
	(field boxAt: 1 at: 3) announceFlag.
	self assert: (field boxAt: 1 at: 3) isFlagged.

]

{ #category : #'tests-testing' }
MFieldTest >> testHasClickedBoxAroundBoxAtAt [
	self deny: (field hasClickedBoxAroundBoxAt: 1 at: 1).
	field clickOnBoxAt: 1 at: 1.
	self assert: (field hasClickedBoxAroundBoxAt: 1 at: 2)
]

{ #category : #'tests-testing' }
MFieldTest >> testHasUnknownBox [
	self assert: field hasUnknownBox.
	field
		clickOnBoxAt: 1 at: 1;
		clickOnBoxAt: 1 at: 5;
		clickOnBoxAt: 4 at: 1;
		clickOnBoxAt: 4 at: 2;
		clickOnBoxAt: 4 at: 3;
		clickOnBoxAt: 5 at: 2;
		clickOnBoxAt: 5 at: 3;
		clickOnBoxAt: 5 at: 4;
		clickOnBoxAt: 5 at: 5.
	self deny: field hasUnknownBox.
]

{ #category : #'tests-accessing' }
MFieldTest >> testHeight [
	self assert: field height equals: 5
]

{ #category : #'tests-box api' }
MFieldTest >> testMineCountAroundBoxAtAt [
	self
		assert: (field mineCountAroundBoxAt: 1 at: 1) equals: 0;
		assert: (field mineCountAroundBoxAt: 1 at: 2) equals: 2;
		assert: (field mineCountAroundBoxAt: 1 at: 3) equals: 1;
		assert: (field mineCountAroundBoxAt: 1 at: 4) equals: 2;
		assert: (field mineCountAroundBoxAt: 1 at: 5) equals: 0;
		assert: (field mineCountAroundBoxAt: 2 at: 1) equals: 2;
		assert: (field mineCountAroundBoxAt: 2 at: 2) equals: 5;
		assert: (field mineCountAroundBoxAt: 2 at: 3) equals: 3;
		assert: (field mineCountAroundBoxAt: 2 at: 4) equals: 3;
		assert: (field mineCountAroundBoxAt: 2 at: 5) equals: 0;
		assert: (field mineCountAroundBoxAt: 3 at: 1) equals: 1;
		assert: (field mineCountAroundBoxAt: 3 at: 2) equals: 3;
		assert: (field mineCountAroundBoxAt: 3 at: 3) equals: 3;
		assert: (field mineCountAroundBoxAt: 3 at: 4) equals: 4;
		assert: (field mineCountAroundBoxAt: 3 at: 5) equals: 2;
		assert: (field mineCountAroundBoxAt: 4 at: 1) equals: 3;
		assert: (field mineCountAroundBoxAt: 4 at: 2) equals: 4;
		assert: (field mineCountAroundBoxAt: 4 at: 3) equals: 3;
		assert: (field mineCountAroundBoxAt: 4 at: 4) equals: 2;
		assert: (field mineCountAroundBoxAt: 4 at: 5) equals: 1;
		assert: (field mineCountAroundBoxAt: 5 at: 1) equals: 0;
		assert: (field mineCountAroundBoxAt: 5 at: 2) equals: 1;
		assert: (field mineCountAroundBoxAt: 5 at: 3) equals: 1;
		assert: (field mineCountAroundBoxAt: 5 at: 4) equals: 2;
		assert: (field mineCountAroundBoxAt: 5 at: 5) equals: 2
]

{ #category : #'tests-box api' }
MFieldTest >> testPlayerLoose [

	| loose |
	loose := false.
	field announcer when: MPlayerLoose do: [ loose := true ].
	field clickOnBoxAt: 1 at: 3.

	self
		assert: loose;
		assert: field playerLost
]

{ #category : #'tests-box api' }
MFieldTest >> testPlayerWin [

	| win |
	win := false.
	field announcer when: MPlayerWin do: [ win := true ].
	field
		clickOnBoxAt: 1 at: 1;
		clickOnBoxAt: 1 at: 5;
		clickOnBoxAt: 4 at: 1;
		clickOnBoxAt: 4 at: 2;
		clickOnBoxAt: 4 at: 3;
		clickOnBoxAt: 5 at: 2;
		clickOnBoxAt: 5 at: 3;
		clickOnBoxAt: 5 at: 4;
		clickOnBoxAt: 5 at: 5.
	self
		assert: win;
		assert: field playerWon
]

{ #category : #tests }
MFieldTest >> testPropagateWhenEnoughFlagsAround [
	field clickOnBoxAt: 1 at: 4.
	(field boxAt: 1 at: 3) announceFlag.
	(field boxAt: 2 at: 3) announceFlag.
	self deny: (field boxAt: 1 at: 5) isClickedBox.
	self deny: (field boxAt: 2 at: 5) isClickedBox.
	self deny: (field boxAt: 2 at: 4) isClickedBox.
	field clickOnBoxAt: 1 at: 4.
	self assert: (field boxAt: 1 at: 5) isClickedBox.
	self assert: (field boxAt: 2 at: 5) isClickedBox.
	self assert: (field boxAt: 2 at: 4) isClickedBox.	
	
	  
]

{ #category : #'tests-box api' }
MFieldTest >> testReplaceBoxAtRowColumnBy [

	| actual new |
	actual := field boxAt: 2 at: 2.
	new := MBox clicked.
	field replaceBoxAtRow: 2 column: 2 by: new.
	self
		assert: (field boxAt: 2 at: 2) ~= actual;
		assert: (field boxAt: 2 at: 2) equals: new
]

{ #category : #'tests-accessing' }
MFieldTest >> testWidth [
	self assert: field width equals: 5
]
