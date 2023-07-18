"
This class contains tests
"
Class {
	#name : #MygSkMoveInSituationTest,
	#superclass : #TestCase,
	#category : #'Myg-Sokoban-Tests'
}

{ #category : #'tests - basic' }
MygSkMoveInSituationTest >> testBasicMoveInformation [

	| board position |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@  $.#'
			          fromPackage: MygSkBoard package) do: [ :each | each configured ]).
		
	position := board player position.
	self assert: (board player move: CpDirection east).
	"The player has moved!"
	"No check that the player position is correct."
	self
		assert: board player position x
		equals: (CpDirection east * position) x.
	self assert: board player position x equals: 3.
	self assert: board asciiString equals: '# @ $.#'
]

{ #category : #tests }
MygSkMoveInSituationTest >> testBoxBumpingInBox [

	| board box |
	board := MygSkBoard createWithBoard: ((MygLevelImporter
			           fromString: '#@$$ ..#'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
	box := board atColumn: 3 atRow: 1.
	self assert: (box isKindOf: MygSkBox).
	self deny: box moveEast.

	self assert: board asciiString equals: '#@$$ ..#'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testBoxBumpingInWall [

	| board box |
	board := MygSkBoard createWithBoard: ((MygLevelImporter
			           fromString: '#@ .$#'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
	box := board atColumn: 5 atRow: 1 .
	self assert: (box isKindOf: MygSkBox).
	self deny: box moveEast.

	self assert: board asciiString equals: '#@ .$#'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testBoxMovingOnGround [

	| board box |
	board := MygSkBoard createWithBoard: ((MygLevelImporter
			           fromString: '#@ .$ #'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
	box := board atColumn: 5 atRow: 1 .
	self assert: (box isKindOf: MygSkBox).
	self assert: box moveEast.

	self assert: board asciiString equals: '#@ . $#'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testBoxMovingOnTarget [

	| board box |
	board := MygSkBoard createWithBoard: ((MygLevelImporter
			           fromString: '#@ $. #'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
	box := board atColumn: 4 atRow: 1 .
	self assert: (box isKindOf: MygSkBox).
	self assert: box moveEast.
	self assert: box position x equals: 5.
	self assert: board asciiString equals: '#@  * #'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testBoxMovingOnTargetAndRestore [

	| board box |
	board := MygSkBoard createWithBoard: ((MygLevelImporter
			           fromString: '#@ $. #'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
	box := board atColumn: 4 atRow: 1 .
	self assert: (box isKindOf: MygSkBox).
	self assert: box moveEast.

	self assert: board asciiString equals: '#@  * #'.
	self assert: box moveEast.
	self assert: box position x equals: 6.
	self assert: board asciiString equals: '#@  .$#'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testPlayerBumpingInWall [

	| board position player |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '# @#'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
	player := board atColumn: 3 atRow: 1 .
	position := board player position.
	self deny: (board player move: CpDirection east).
	self assert: board player position equals: position.
	self assert: player position x equals: 3.
	self assert: board asciiString equals: '# @#'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testPlayerMovingOnGround [

	| board position player |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@ #'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
	position := board player position.
	player := board atColumn: 2 atRow: 1 .
	self assert: (board player move: CpDirection east).
	self
		assert: board player position x
		equals: (CpDirection east * position) x.
	self
		assert: board player position y
		equals: (CpDirection east * position) y.
	self assert: player position x equals: 3.
	self assert: board asciiString equals: '# @#'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testPlayerMovingOnGroundRestoreCorrectlyGround [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@   #'
			          fromPackage: MygSkBoard package) do: [ :each | each configured ]).
	self assert: board player moveEast.
	self assert: board printString equals: '# @  #'.
	self assert: board player moveEast.
	self assert: board printString equals: '#  @ #'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testPlayerMovingOnTarget [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@.   $#'
			          fromPackage: MygSkBoard package) do: [ :each | each configured ]).
	self assert: board asciiString equals: '#@.   $#'.
	self assert: board player moveEast.
	self assert: board printString equals: '# +   $#'.
	board player moveEast.
	self assert: board printString equals: '# .@  $#'
]

{ #category : #'tests - simple move' }
MygSkMoveInSituationTest >> testPlayerMovingTwoTimesOnGroundRestoreCorrectlyGround [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@  #'
			          fromPackage: MygSkBoard package) do: [ :each | each configured ]).
	self assert: board height equals: 1.
	self assert: board width equals: '#@  #' size.
	self assert: board printString equals: '#@  #'.
	self assert: board printString equals: '#@  #'.
	self assert: board player moveEast.
	self assert: board printString equals: '# @ #'.
	board player moveEast.
	self assert: board printString equals: '#  @#'
]

{ #category : #'tests - pushing box' }
MygSkMoveInSituationTest >> testPushingABoxAlreadyOnTarget [

	| board position |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@* #'
			          fromPackage: MygSkBoard package) collect: [ :each | each configured ]).
	position := board player position.
	self assert: board asciiString equals: '#@* #'.
	self assert: board player moveEast.
	"The player has moved!"

	"Now check that the player position is correct."
	self assert: board player position x equals: 3.
	self assert: (board atPosition: 3 @ 1) isPlayer.

	self assert: board asciiString equals: '# +$#'.

	self deny: (board atPosition: 2 @ 1) isPlayer
	"Check that the board is updated, i.e., the player in the board should be at the player's position."
]

{ #category : #'tests - pushing box' }
MygSkMoveInSituationTest >> testPushingABoxOnGround [

	| board position |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@$ .#'
			          fromPackage: MygSkBoard package) do: [ :each | each configured ]).
	position := board player position.
	self assert: board asciiString equals: '#@$ .#'.
	self assert: board player moveEast.
	"The player has moved!"

	"Now check that the player position is correct."
	self assert: board player position x equals: 3.
	self assert: (board atPosition: 3 @ 1) isPlayer.

	self assert: board asciiString equals: '# @$.#'.

	self deny: (board atPosition: 2 @ 1) isPlayer
	"Check that the board is updated, i.e., the player in the board should be at the player's position."
]

{ #category : #'tests - pushing box' }
MygSkMoveInSituationTest >> testPushingABoxOnTarget [

	| board position |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@$.#'
			          fromPackage: MygSkBoard package) do: [ :each | each configured ]).
	position := board player position.
	self assert: board asciiString equals: '#@$.#'.
	self assert: board player moveEast.
	"The player has moved!"

	"Now check that the player position is correct."
	self assert: board player position x equals: 3.
	self assert: (board atPosition: 3 @ 1) isPlayer.

	self assert: board asciiString equals: '# @*#'.

	self deny: (board atPosition: 2 @ 1) isPlayer
	"Check that the board is updated, i.e., the player in the board should be at the player's position."
]

{ #category : #'tests - pushing box' }
MygSkMoveInSituationTest >> testPushingABoxOnWall [

	| board position player box |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#.@$#'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
	player := board atColumn: 3 atRow: 1.
	position := board player position.
	self assert: board player position x equals: 3.
	self assert: player position x equals: 3.
	self assert: board asciiString equals: '#.@$#'.
	box := board atColumn: 4 atRow: 1.
	self assert: box position x equals: 4.
	self deny: board player moveEast.
	"The player has moved!"

	self assert: board player position x equals: 3.
	self assert: player position x equals: 3.
	box := board atColumn: 4 atRow: 1 .
	self assert: (box isKindOf: MygSkBox).
	self assert: box position x equals: 4
]
