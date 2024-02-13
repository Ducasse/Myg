"
A MFieldTest is a test class for testing the behavior of MField
"
Class {
	#name : #MBoardTest,
	#superclass : #MAbstractTest,
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #tests }
MBoardTest >> testAllClickedWhenLost [

	field playerLoose.
	field grid do: [ :each | self deny: each isSafeBox ]
]

{ #category : #tests }
MBoardTest >> testAllClickedWhenWon [

	field playerWin.
	field grid do: [ :each | self deny: each isSafeBox ]
]

{ #category : #'tests-accessing' }
MBoardTest >> testBoxAtAt [

	self
		assert: (field boxAt: 1 at: 1) isSafeBox;
		assert: (field boxAt: 1 at: 2) isSafeBox;
		assert: (field boxAt: 1 at: 3) isMineBox;
		assert: (field boxAt: 1 at: 4) isSafeBox;
		assert: (field boxAt: 1 at: 5) isMineBox;
		assert: (field boxAt: 2 at: 1) isSafeBox;
		assert: (field boxAt: 2 at: 2) isSafeBox;
		assert: (field boxAt: 2 at: 3) isMineBox;
		assert: (field boxAt: 2 at: 4) isSafeBox;
		assert: (field boxAt: 2 at: 5) isSafeBox;
		assert: (field boxAt: 3 at: 1) isMineBox;
		assert: (field boxAt: 3 at: 2) isMineBox;
		assert: (field boxAt: 3 at: 3) isMineBox;
		assert: (field boxAt: 3 at: 4) isSafeBox;
		assert: (field boxAt: 3 at: 5) isSafeBox;
		assert: (field boxAt: 4 at: 1) isSafeBox;
		assert: (field boxAt: 4 at: 2) isSafeBox;
		assert: (field boxAt: 4 at: 3) isSafeBox;
		assert: (field boxAt: 4 at: 4) isMineBox;
		assert: (field boxAt: 4 at: 5) isSafeBox;
		assert: (field boxAt: 5 at: 1) isSafeBox;
		assert: (field boxAt: 5 at: 2) isSafeBox;
		assert: (field boxAt: 5 at: 3) isSafeBox;
		assert: (field boxAt: 5 at: 4) isMineBox;
		assert: (field boxAt: 5 at: 5) isSafeBox
]

{ #category : #'tests-enumerating' }
MBoardTest >> testBoxesAroundBoxAtAtDoWithIndexes [

	| expected |
	expected := {
		            (1 @ 2).
		            (2 @ 1).
		            (2 @ 2) }.
	field boxesAroundBox: (field boxAt: 1 at: 1) do: [ :box |
		self assert: box position equals: expected first.
		expected := expected allButFirst ].

	expected := {
		            (2 @ 2).
		            (2 @ 3).
		            (2 @ 4).
		            (3 @ 2).
		            (3 @ 4).
		            (4 @ 2).
		            (4 @ 3).
		            (4 @ 4) }.

	field boxesAroundBox: (field boxAt: 3 at: 3) do: [ :box |
		self assert: box position equals: expected first.
		expected := expected allButFirst ].

	expected := {
		            (4 @ 4).
		            (4 @ 5).
		            (5 @ 4) }.
	field boxesAroundBox: (field boxAt: 5 at: 5) do: [ :box |
		self
			assert: box position equals: expected first.
		expected := expected allButFirst ]
]

{ #category : #tests }
MBoardTest >> testClickOnFlaggedBox [

	| box |
	box := field boxAt: 1 at: 1.
	self assert: box class equals: MSafeBox.
	box flag.
	self assert: box isFlagged.
	box click.
	self assert: box class equals: MSafeBox 
]

{ #category : #tests }
MBoardTest >> testFlagIsWorking [

	|box|
	box := (field boxAt: 1 at: 1).
	self deny: box isFlagged.
	box flag.
	self assert: box isFlagged
]

{ #category : #'tests-box api' }
MBoardTest >> testGameEndsWhenClickingOnAllSafe [

	self deny: field gameEnded.
	field
		clickOnBox: (field boxAt: 1 at: 1);
		clickOnBox: (field boxAt: 1 at: 4);
		clickOnBox: (field boxAt: 2 at: 4);
		clickOnBox: (field boxAt: 2 at: 5);
		clickOnBox: (field boxAt: 3 at: 4);
		clickOnBox: (field boxAt: 3 at: 5);
		clickOnBox: (field boxAt: 4 at: 5);
		clickOnBox: (field boxAt: 5 at: 1);
		clickOnBox: (field boxAt: 5 at: 5).
	self assert: field gameEnded.
]

{ #category : #'tests-box api' }
MBoardTest >> testGameEndsWhenClickingOnBomb [

	self deny: field gameEnded.
	(field boxAt: 3 at: 3) click.
	self assert: field gameEnded.
]

{ #category : #'tests-testing' }
MBoardTest >> testHasClickedBoxAroundBoxAtAt [

	| box boxToClick|
	box := field boxAt: 1 at: 2.
	boxToClick := field boxAt: 1 at: 1. 
	self deny: (field hasClickedBoxAroundBox: box).
	boxToClick click.
	self assert: (field hasClickedBoxAroundBox: box)
]

{ #category : #'tests-testing' }
MBoardTest >> testHasUnknownBox [

	self deny: field hasBeenCleared.
	field
		clickOnBox: (field boxAt: 1 at: 1);
		clickOnBox: (field boxAt: 1 at: 4);
		clickOnBox: (field boxAt: 2 at: 4);
		clickOnBox: (field boxAt: 2 at: 5);
		clickOnBox: (field boxAt: 3 at: 4);
		clickOnBox: (field boxAt: 3 at: 5);
		clickOnBox: (field boxAt: 4 at: 5);
		clickOnBox: (field boxAt: 5 at: 1);
		clickOnBox: (field boxAt: 5 at: 5).
	self assert: field hasBeenCleared
]

{ #category : #'tests-accessing' }
MBoardTest >> testHeight [
	self assert: field height equals: 5
]

{ #category : #'tests-box api' }
MBoardTest >> testMineCountAroundBoxAtAt [

	self
		assert: (field mineCountAroundBox: (field boxAt: 1 at: 1))
		equals: 0;
		assert: (field mineCountAroundBox: (field boxAt: 1 at: 2))
		equals: 2;
		assert: (field mineCountAroundBox: (field boxAt: 1 at: 3))
		equals: 1;
		assert: (field mineCountAroundBox: (field boxAt: 1 at: 4))
		equals: 3;
		assert: (field mineCountAroundBox: (field boxAt: 1 at: 5))
		equals: 0;
		assert: (field mineCountAroundBox: (field boxAt: 2 at: 1))
		equals: 2;
		assert: (field mineCountAroundBox: (field boxAt: 2 at: 2))
		equals: 5;
		assert: (field mineCountAroundBox: (field boxAt: 2 at: 3))
		equals: 3;
		assert: (field mineCountAroundBox: (field boxAt: 2 at: 4))
		equals: 4;
		assert: (field mineCountAroundBox: (field boxAt: 2 at: 5))
		equals: 1;
		assert: (field mineCountAroundBox: (field boxAt: 3 at: 1))
		equals: 1;
		assert: (field mineCountAroundBox: (field boxAt: 3 at: 2))
		equals: 3;
		assert: (field mineCountAroundBox: (field boxAt: 3 at: 3))
		equals: 3;
		assert: (field mineCountAroundBox: (field boxAt: 3 at: 4))
		equals: 3;
		assert: (field mineCountAroundBox: (field boxAt: 3 at: 5))
		equals: 1;
		assert: (field mineCountAroundBox: (field boxAt: 4 at: 1))
		equals: 2;
		assert: (field mineCountAroundBox: (field boxAt: 4 at: 2))
		equals: 3;
		assert: (field mineCountAroundBox: (field boxAt: 4 at: 3))
		equals: 4;
		assert: (field mineCountAroundBox: (field boxAt: 4 at: 4))
		equals: 2;
		assert: (field mineCountAroundBox: (field boxAt: 4 at: 5))
		equals: 2;
		assert: (field mineCountAroundBox: (field boxAt: 5 at: 1))
		equals: 0;
		assert: (field mineCountAroundBox: (field boxAt: 5 at: 2))
		equals: 0;
		assert: (field mineCountAroundBox: (field boxAt: 5 at: 3))
		equals: 2;
		assert: (field mineCountAroundBox: (field boxAt: 5 at: 4))
		equals: 1;
		assert: (field mineCountAroundBox: (field boxAt: 5 at: 5))
		equals: 2
]

{ #category : #tests }
MBoardTest >> testPropagateWhenEnoughFlagsAround [

	| box |
	box := field boxAt: 2 at: 5.
	box click.
	(field boxAt: 1 at: 5) flag.
	self deny: (field boxAt: 1 at: 4) isClicked.
	self deny: (field boxAt: 2 at: 4) isClicked.
	self deny: (field boxAt: 3 at: 4) isClicked.
	self deny: (field boxAt: 3 at: 5) isClicked.
	box click.
	self assert: (field boxAt: 1 at: 4) isClicked.
	self assert: (field boxAt: 2 at: 4) isClicked.
	self assert: (field boxAt: 3 at: 4) isClicked.
	self assert: (field boxAt: 3 at: 5) isClicked.
	self assert: (field boxAt: 1 at: 5) isMineBox
]

{ #category : #'tests-box api' }
MBoardTest >> testReplaceBoxAtRowColumnBy [

	| actual new |
	actual := field boxAt: 2 at: 2.
	new := MBox clicked.
	field replaceBox: actual by: new.
	self
		assert: (field boxAt: 2 at: 2) ~= actual;
		assert: (field boxAt: 2 at: 2) equals: new
]

{ #category : #'tests-accessing' }
MBoardTest >> testWidth [
	self assert: field width equals: 5
]
