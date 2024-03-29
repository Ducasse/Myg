Class {
	#name : #SameGameBoardElementTest,
	#superclass : #TestCase,
	#category : #'Myg-SameGame-Model-Tests'
}

{ #category : #tests }
SameGameBoardElementTest >> testClickAndCaseNothingAppend [

	| board game graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | B | Y | Y | 
	 | R | R | R | 
	 | B | G | G | 

	"
	game := SGGame new.
	board := SGBoard new game: game.
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox red;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox blue;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).
	graphicBoard := SGBoardElement new.
	graphicBoard grid.

	board hitBoxOnx: 1 y: 3.

	self assert: (board grid at: 1 @ 3) literal equals: 'B'
]

{ #category : #tests }
SameGameBoardElementTest >> testClickAndMultipleCaseDisappear [

	| board game graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | B | Y | Y | 
	 | R | R | R | 
	 | B | G | G | 

	"
	game := SGGame new.
	board := SGBoard new game: game.
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox red;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox blue;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).
	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	board hitBoxOnx: 1 y: 2.
	"fonctionne jusque ici"

	self assert: (board grid at: 1 @ 1) literal equals: 'B'
]

{ #category : #tests }
SameGameBoardElementTest >> testClickAndOneColumnDisappear [

	| board game graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | R | Y | r | 
	 | B | y | b | 
	 | G | y | g | 
	"
	game := SGGame new.
	board := SGBoard new game: game.
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox red;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox blue;
			 at: 1 @ 3 put: SGBox green;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	board hitBoxOnx: 2 y: 2.

	self assert: (board grid at: 3 @ 1) literal equals: 'N'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.

	self assert: (board grid at: 2 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 2 @ 3) literal equals: 'G'
]

{ #category : #tests }
SameGameBoardElementTest >> testClickOnBlueCase [

	| board resGrid game graphicBoard resgraphicBoard |
	"| B B  |			   | G R | 
 | G R  |     =>  | N N |"
	game := SGGame new.
	board := SGBoard new game: game.
	board configureGrid: ((CTNewArray2D width: 2 height: 2)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox blue;
			 at: 1 @ 2 put: SGBox green;
			 at: 2 @ 2 put: SGBox red;
			 yourself).

	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	resGrid := SGBoard new.
	resGrid configureGrid: ((CTNewArray2D width: 2 height: 2)
			 at: 1 @ 1 put: SGBox green;
			 at: 2 @ 1 put: SGBox red;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox null;
			 yourself).

	resgraphicBoard := SGBoardElement new.
	resgraphicBoard grid: resGrid grid.
	board hitBoxOnx: 1 y: 1.

	self assert: board grid size equals: resGrid grid size.
	self
		assert: (board grid at: 1 @ 1) state
		equals: (resGrid grid at: 1 @ 1) state.
	self
		assert: (board grid at: 2 @ 1) state
		equals: (resGrid grid at: 2 @ 1) state
]

{ #category : #tests }
SameGameBoardElementTest >> testColonneIsEmpty [

	| board game graphicBoard |
	game := SGGame new.
	board := SGBoard new game: game.
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox null;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox null;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).
	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	self assert: (board isColumnEmpty: 1).
	self deny: (board isColumnEmpty: 2)
]

{ #category : #tests }
SameGameBoardElementTest >> testExchangeCase [

	| board case1 case2 game graphicBoard |
	game := SGGame new.
	board := SGBoard new game: game.
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox null;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox null;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	case1 := board boxAt: 1 @ 1.
	case2 := board boxAt: 2 @ 1.
	self assert: case1 literal equals: 'N'.
	self assert: case2 literal equals: 'Y'.

	board switchBox: 1 @ 1 with: 2 @ 1.

	case1 := board boxAt: 1 @ 1.
	case2 := board boxAt: 2 @ 1.

	self assert: case1 literal equals: 'Y'.
	self assert: case2 literal equals: 'N'
]

{ #category : #tests }
SameGameBoardElementTest >> testExchangeColonne [

	| board game graphicBoard |
	game := SGGame new.
	board := SGBoard new game: game.
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox null;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox null;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	board switchColumn: 1 withColumn: 2.
	self assert: (board boxAt: 1 @ 1) literal equals: 'Y'.
	self assert: (board boxAt: 1 @ 2) literal equals: 'R'.
	self assert: (board boxAt: 1 @ 3) literal equals: 'G'.

	self assert: (board boxAt: 2 @ 1) literal equals: 'N'.
	self assert: (board boxAt: 2 @ 2) literal equals: 'N'.
	self assert: (board boxAt: 2 @ 3) literal equals: 'N'
]

{ #category : #tests }
SameGameBoardElementTest >> testReorganiseBoard [

	| firstBoard game graphicBoard |
	"| B |            | B |
 | N |            | Y |
 | Y |         => | B |
 | N |            | N |
 | B |            | N | "
	game := SGGame new.
	firstBoard := SGBoard new game: game.
	firstBoard := firstBoard configureGrid:
		              ((CTNewArray2D width: 1 height: 5)
			               at: 1 @ 1 put: SGBox blue;
			               at: 1 @ 2 put: SGBox null;
			               at: 1 @ 3 put: SGBox yellow;
			               at: 1 @ 4 put: SGBox null;
			               at: 1 @ 5 put: SGBox green;
			               yourself).
	graphicBoard := SGBoardElement new.
	graphicBoard grid: firstBoard grid.

	firstBoard reorganizeColumn: 1.

	self assert: (firstBoard grid at: 1 @ 1) literal equals: 'B'.
	self assert: (firstBoard grid at: 1 @ 2) literal equals: 'Y'.
	self assert: (firstBoard grid at: 1 @ 3) literal equals: 'G'.
	self assert: (firstBoard grid at: 1 @ 4) literal equals: 'N'.
	self assert: (firstBoard grid at: 1 @ 5) literal equals: 'N'
]

{ #category : #tests }
SameGameBoardElementTest >> testReorganiseWhenEmptyColonne [
	"
| B Y Y |        | Y Y N |
| B R R |    =>  | R R N |
| B G G |        | G G N |                    "

	| board game graphicBoard |
	game := SGGame new.
	board := SGBoard new game: game.
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox blue;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).
	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	board hitBoxOnx: 1 y: 1.

	self assert: (board boxAt: 1 @ 1) literal equals: 'Y'.
	self assert: (board boxAt: 3 @ 1) literal equals: 'N'.
	self assert: (board boxAt: 1 @ 2) literal equals: 'R'.
	self assert: (board boxAt: 3 @ 2) literal equals: 'N'.
	self assert: (board boxAt: 1 @ 3) literal equals: 'G'.
	self assert: (board boxAt: 3 @ 3) literal equals: 'N'
]
