Class {
	#name : 'SameGameBoardElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SameGameBoardElementTest >> setUp [

	super setUp.
	"Y: Yellow , B: Blue , G: Green , R: Red, N : Null
	represents this grid:
	 | B | Y | G | 
	 | B | Y | G | 
	 | R | Y | N | 

	"

	board := SGBoard new.
	SGGame new board: board.
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
			 yourself)
]

{ #category : 'tests' }
SameGameBoardElementTest >> testClickAndCaseNothingAppend [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | B | Y | Y | 
	 | R | R | R | 
	 | B | G | G | 

	"
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

{ #category : 'tests' }
SameGameBoardElementTest >> testClickAndMultipleCaseDisappear [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | B | Y | Y | 
	 | R | R | R | 
	 | B | G | G | 

	"
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

{ #category : 'tests' }
SameGameBoardElementTest >> testClickAndOneColumnDisappear [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | R | Y | r | 
	 | B | y | b | 
	 | G | y | g | 
	"
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
SameGameBoardElementTest >> testClickOnBlueCase [

	| resGrid graphicBoard resgraphicBoard |
	"| B B  |			   | G R | 
 | G R  |     =>  | N N |"
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
	self assert: (board grid at: 1 @ 1) state equals: (resGrid grid at: 1 @ 1) state.
	self assert: (board grid at: 2 @ 1) state equals: (resGrid grid at: 2 @ 1) state
]

{ #category : 'tests' }
SameGameBoardElementTest >> testClickOnBombAndAllAroundDisappear [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bombe
	represents this grid:
	 | R | Y | r  | r | r |
	 | B | y | b  | r | r |
	 | G | y | Bo | r | r |
	 | B | y | b  | r | r |
	 | B | g | y  | b | r |
	"
	board configureGrid: ((CTNewArray2D width: 5 height: 5)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox red;
			 at: 4 @ 1 put: SGBox red;
			 at: 5 @ 1 put: SGBox red;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox blue;
			 at: 4 @ 2 put: SGBox red;
			 at: 5 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox green;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox bomb;
			 at: 4 @ 3 put: SGBox red;
			 at: 5 @ 3 put: SGBox red;
			 at: 1 @ 4 put: SGBox blue;
			 at: 2 @ 4 put: SGBox yellow;
			 at: 3 @ 4 put: SGBox blue;
			 at: 4 @ 4 put: SGBox red;
			 at: 5 @ 4 put: SGBox red;
			 at: 1 @ 5 put: SGBox blue;
			 at: 2 @ 5 put: SGBox green;
			 at: 3 @ 5 put: SGBox yellow;
			 at: 4 @ 5 put: SGBox blue;
			 at: 5 @ 5 put: SGBox red;
			 yourself).

	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.
	board hitBoxOnx: 3 y: 3.


	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bombe
	represents this grid:
	 | R | Y | r  | r | r |
	 | B | y | b  | r | r |
	 | G | y | Bo | r | r |
	 | B | y | b  | r | r |
	 | B | g | y  | b | r |
	"

	self assert: (board grid at: 3 @ 1) literal equals: 'R'.
	self assert: (board grid at: 3 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.

	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'G'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.

	self assert: (board grid at: 4 @ 1) literal equals: 'R'.
	self assert: (board grid at: 4 @ 2) literal equals: 'B'.
	self assert: (board grid at: 4 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SameGameBoardElementTest >> testClickOnBombWithNullAroundDoesNotThrowAnyThing [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bomb
	represents this grid:

	 | Bo |

	"
	board configureGrid: ((CTNewArray2D width: 1 height: 1)
			 at: 1 @ 1 put: SGBox bomb;
			 yourself).

	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.
	board hitBoxOnx: 1 y: 1
]

{ #category : 'tests' }
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

{ #category : 'tests' }
SameGameBoardElementTest >> testClickOnLineKillerAndAllTheLineDisappear [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | Y | r  | r | r |
	 | B | y | b  | r | r |
	 | G | y | Lk | r | r |
	 | B | y | b  | r | r |
	 | B | g | y  | b | r |
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox red;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox lineKiller ;
			 at: 3 @ 2 put: SGBox blue;
			 at: 1 @ 3 put: SGBox yellow;
			 at: 2 @ 3 put: SGBox blue;
			 at: 3 @ 3 put: SGBox red;
			 yourself).

	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.
	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | Y | r  | r | r |
	 | B | y | b  | r | r |
	 | G | y | Lk | r | r |
	 | B | y | b  | r | r |
	 | B | g | y  | b | r |
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'R'.
	self assert: (board grid at: 3 @ 1) literal equals: 'Y'.

	self assert: (board grid at: 1 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'R'.

	self assert: (board grid at: 1 @ 3) literal equals: 'N'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
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

{ #category : 'tests' }
SameGameBoardElementTest >> testColonneIsEmpty [

	| graphicBoard |
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

{ #category : 'tests' }
SameGameBoardElementTest >> testExchangeCase [

	| case1 case2 graphicBoard |
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

{ #category : 'tests' }
SameGameBoardElementTest >> testExchangeColonne [

	| graphicBoard |
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

{ #category : 'tests' }
SameGameBoardElementTest >> testReorganiseBoard [

	| graphicBoard |
	"| B |            | B |
 | N |            | Y |
 | Y |         => | B |
 | N |            | N |
 | B |            | N | "
	board configureGrid: ((CTNewArray2D width: 1 height: 5)
			 at: 1 @ 1 put: SGBox blue;
			 at: 1 @ 2 put: SGBox null;
			 at: 1 @ 3 put: SGBox yellow;
			 at: 1 @ 4 put: SGBox null;
			 at: 1 @ 5 put: SGBox green;
			 yourself).
	graphicBoard := SGBoardElement new.
	graphicBoard grid: board grid.

	board reorganizeColumn: 1.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 1 @ 3) literal equals: 'G'.
	self assert: (board grid at: 1 @ 4) literal equals: 'N'.
	self assert: (board grid at: 1 @ 5) literal equals: 'N'
]

{ #category : 'tests' }
SameGameBoardElementTest >> testReorganiseWhenEmptyColonne [
	"
| B Y Y |        | Y Y N |
| B R R |    =>  | R R N |
| B G G |        | G G N |                    "

	| graphicBoard |
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
