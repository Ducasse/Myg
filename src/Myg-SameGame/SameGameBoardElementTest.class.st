Class {
	#name : #SameGameBoardElementTest,
	#superclass : #TestCase,
	#instVars : [
		'board'
	],
	#category : #'Myg-SameGame-Model-Tests'
}

{ #category : #running }
SameGameBoardElementTest >> setUp [

	super setUp.
	"Y: Yellow , B: Blue , G: Green , R: Red, N : Null
	represents this grid:
	 | B | Y | G | 
	 | B | Y | G | 
	 | R | Y | N | 

	"
	board := SGBoard new game: SGGame new.
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox green;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox green;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox null;
			 yourself).
]

{ #category : #tests }
SameGameBoardElementTest >> testClickOn2BlueBoxesColumnRearrange [

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.
	
	board hitBoxOnx: 1 y: 1.

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 1 @ 2) literal equals: 'N'.
	self assert: (board grid at: 1 @ 3) literal equals: 'N'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : #tests }
SameGameBoardElementTest >> testClickOn3YellowBoxesSwitchEmptyColumn [

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.
	
	board hitBoxOnx: 2 y: 1.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'G'.
	self assert: (board grid at: 2 @ 2) literal equals: 'G'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.
	self assert: (board grid at: 3 @ 1) literal equals: 'N'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : #tests }
SameGameBoardElementTest >> testClickOnIsolatedBoxNothingChanges [

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.
	
	board hitBoxOnx: 1 y: 3.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : #tests }
SameGameBoardElementTest >> testClickOnNullNothingChanges [

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.
	
	board hitBoxOnx: 3 y: 3.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : #tests }
SameGameBoardElementTest >> testColonneIsEmpty [

	board hitBoxOnx: 3 y: 1.
	
	self assert: (board isColumnEmpty: 3) 
]

{ #category : #tests }
SameGameBoardElementTest >> testExchangeCase [

	board switchBox: 1@1 with: 2@1.
	
	self assert: (board grid at: 1 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'B'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : #tests }
SameGameBoardElementTest >> testExchangeColonne [

	board switchColumn: 2 withColumn: 3.
	
	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'G'.
	self assert: (board grid at: 2 @ 2) literal equals: 'G'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.
	self assert: (board grid at: 3 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 3) literal equals: 'Y' 
]
