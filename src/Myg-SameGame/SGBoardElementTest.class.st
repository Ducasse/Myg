Class {
	#name : #SGBoardElementTest,
	#superclass : #TestCase,
	#category : #'Myg-SameGame-UI-Tests'
}

{ #category : #tests }
SGBoardElementTest >> testGrid [

	| game firstBoard graphicBoard |
	game := SGGame new.
	firstBoard := SGBoard new game: game.
	firstBoard := firstBoard configureGrid:
		              ((CTNewArray2D width: 2 height: 2)
			               at: 1 @ 1 put: SGBox blue;
			               at: 1 @ 2 put: SGBox green;
			               at: 2 @ 1 put: SGBox null;
			               at: 2 @ 2 put: SGBox red;
			               yourself).
	graphicBoard := SGBoardElement new.
	graphicBoard grid: firstBoard grid.

	self assert: graphicBoard grid width equals: 2.
	self assert: graphicBoard grid height equals: 2.
	self
		assert: (graphicBoard grid at: 1 @ 1) background paint color
		equals: Color lightBlue.
	self
		assert: (graphicBoard grid at: 1 @ 2) background paint color
		equals: Color lightGreen.
	self
		assert: (graphicBoard grid at: 2 @ 1) background paint color
		equals: Color gray.
	self
		assert: (graphicBoard grid at: 2 @ 2) background paint color
		equals: Color lightRed.

	firstBoard grid at: 1 @ 1 put: SGBox yellow.
	graphicBoard grid: firstBoard grid.

	self
		assert: (graphicBoard grid at: 1 @ 1) background paint color
		equals: Color lightYellow
]
