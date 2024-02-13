"
A MFieldTest is a test class for testing the behavior of MField
"
Class {
	#name : #MFieldTest,
	#superclass : #MAbstractTest,
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #tests }
MFieldTest >> testAllClickedWhenLost [

	field playerLoose.
	field grid do: [ :each | self deny: each isSafeBox ]
]

{ #category : #tests }
MFieldTest >> testAllClickedWhenWon [

	field playerWin.
	field grid do: [ :each | self deny: each isSafeBox ]
]

{ #category : #'tests-accessing' }
MFieldTest >> testBoxAtAt [

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
MFieldTest >> testBoxesAroundBoxAtAtDoWithIndexes [

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
MFieldTest >> testClickOnFlaggedBox [

	| box |
	box := field boxAt: 1 at: 1.
	self assert: box class equals: MSafeBox.
	box flag.
	self assert: box isFlagged.
	box click.
	self assert: box class equals: MSafeBox 
]

{ #category : #tests }
MFieldTest >> testFlagIsWorking [

	|box|
	box := (field boxAt: 1 at: 1).
	self deny: box isFlagged.
	box flag.
	self assert: box isFlagged
]

{ #category : #'tests-testing' }
MFieldTest >> testHasClickedBoxAroundBoxAtAt [

	| box boxToClick|
	box := field boxAt: 1 at: 2.
	boxToClick := field boxAt: 1 at: 1. 
	self deny: (field hasClickedBoxAroundBox: box).
	boxToClick click.
	self assert: (field hasClickedBoxAroundBox: box)
]

{ #category : #'tests-testing' }
MFieldTest >> testHasUnknownBox [

	self assert: field hasSafeBox.
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
	self deny: field hasSafeBox
]

{ #category : #'tests-accessing' }
MFieldTest >> testHeight [
	self assert: field height equals: 5
]

{ #category : #'tests-box api' }
MFieldTest >> testMineCountAroundBoxAtAt [

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

{ #category : #'tests-box api' }
MFieldTest >> testPlayerLoose [

	self deny: field gameEnded.
	(field boxAt: 3 at: 3) click.
	self assert: field gameEnded.
	self assert: field playerLost
]

{ #category : #'tests-box api' }
MFieldTest >> testPlayerWin [

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
	self assert: field playerWon
]

{ #category : #tests }
MFieldTest >> testPropagateWhenEnoughFlagsAround [

	| box |
	box := field boxAt: 2 at: 5.
	box click.
	(field boxAt: 1 at: 5) flag.
	self deny: (field boxAt: 1 at: 4) isClickedBox.
	self deny: (field boxAt: 2 at: 4) isClickedBox.
	self deny: (field boxAt: 3 at: 4) isClickedBox.
	self deny: (field boxAt: 3 at: 5) isClickedBox.
	box click.
	self assert: (field boxAt: 1 at: 4) isClickedBox.
	self assert: (field boxAt: 2 at: 4) isClickedBox.
	self assert: (field boxAt: 3 at: 4) isClickedBox.
	self assert: (field boxAt: 3 at: 5) isClickedBox.
	self assert: (field boxAt: 1 at: 5) isMineBox.
]

{ #category : #'tests-box api' }
MFieldTest >> testReplaceBoxAtRowColumnBy [

	| actual new |
	actual := field boxAt: 2 at: 2.
	new := MBox clicked.
	field replaceBox: actual by: new.
	self
		assert: (field boxAt: 2 at: 2) ~= actual;
		assert: (field boxAt: 2 at: 2) equals: new
]

{ #category : #'tests-accessing' }
MFieldTest >> testWidth [
	self assert: field width equals: 5
]
