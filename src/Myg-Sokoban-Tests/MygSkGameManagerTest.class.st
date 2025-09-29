"
This class contains tests
"
Class {
	#name : #MygSkGameManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'space'
	],
	#category : #'Myg-Sokoban-Tests'
}

{ #category : #running }
MygSkGameManagerTest >> ensureClose: aSpace [

	self assert: (BlSpace pulseUntilEmptyTaskQueue: aSpace timeout: 200 milliSeconds).

	aSpace close.

	self assert: (BlSpace pulseUntilEmptyTaskQueue: aSpace timeout: 200 milliSeconds).
]

{ #category : #running }
MygSkGameManagerTest >> tearDown [

	space ifNotNil: [ self ensureClose: space ].
	super tearDown 
]

{ #category : #tests }
MygSkGameManagerTest >> testIsBoardReset [

	| string manager boardElement |
	string := '#@$ .#'.
	manager := MygSkGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: '#@$ .#'.
	boardElement board player moveEast.
	self assert: boardElement board printString equals: '# @$.#'.
	boardElement eventDispatcher handlers first handleEvent:
		(KeyboardEvent new key: KeyboardKey space).
	boardElement := manager currentBoardElement.
	self assert: boardElement board printString equals: '#@$ .#'.
	space := manager currentBoardElement space.
]

{ #category : #tests }
MygSkGameManagerTest >> testMoveCount [

	| string manager boardElement |
	string := '#@$ .#'.
	manager := MygSkGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: '#@$ .#'.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player moveWest.
	self assert: boardElement board printString equals: '#@$ .#'.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player moveEast.
	self assert: boardElement board printString equals: '# @$.#'.
	self assert: manager currentMoveCount equals: 1.
	space := manager currentBoardElement space.


]

{ #category : #tests }
MygSkGameManagerTest >> testRegisterLevel [

	| manager board string |
	manager := MygSkGameManager new.
	string := MygSkGameManager mazesTest at: 1.
	manager launchFromString: string inDictionary: 'mazesTest' at: 1.
	board := manager currentBoardElement board.

	self
		should: [
		(manager packDictionary at: 'mazesTest') levelDictionary at: 1 ]
		raise: KeyNotFound.
	board player moveEast.
	board player moveEast.

	self assert:
		((manager packDictionary at: 'mazesTest') levelDictionary at: 1)
			isNotNil.
	self assert: ((manager packDictionary at: 'mazesTest') levelDictionary at: 1) bestCount equals: 2.
	space := manager currentBoardElement space.
]

{ #category : #tests }
MygSkGameManagerTest >> testRegisterLevelWithBetterMoveCount [

	| manager board string registered |
	manager := MygSkGameManager new.
	string := MygSkGameManager mazesTest at: 1.
	manager launchFromString: string inDictionary: 'mazesTest' at: 1.
	board := manager currentBoardElement board.

	self
		should: [
		(manager packDictionary at: 'mazesTest') levelDictionary at: 1 ]
		raise: KeyNotFound.
	board player moveEast.
	board player moveWest.
	board player moveEast.
	board player moveEast.

	registered := (manager packDictionary at: 'mazesTest')
		              levelDictionary at: 1.

	self assert: registered isNotNil.
	self assert: registered bestCount equals: 4.

	space := manager currentBoardElement space.
	self ensureClose: space.
	Toplo closeAllSpaces.
	manager launchAgain.

	board := manager currentBoardElement board.
	board player moveEast.
	board player moveEast.

	self
		assert:
			((manager packDictionary at: 'mazesTest') levelDictionary at: 1)
				bestCount
		equals: 2.
	space := manager currentBoardElement space.
]

{ #category : #tests }
MygSkGameManagerTest >> testRegisterLevelWithWorseMoveCount [

	| manager board string registered |
	manager := MygSkGameManager new.
	string := MygSkGameManager mazesTest at: 1.
	manager launchFromString: string inDictionary: 'mazesTest' at: 1.
	board := manager currentBoardElement board.

	self
		should: [
		(manager packDictionary at: 'mazesTest') levelDictionary at: 1 ]
		raise: KeyNotFound.

	board player moveEast.
	board player moveEast.

	registered := (manager packDictionary at: 'mazesTest')
		              levelDictionary at: 1.


	self assert: registered isNotNil.
	self assert: registered bestCount equals: 2.

	space := manager currentBoardElement space.
	self ensureClose: space.

	manager launchAgain.
	board := manager currentBoardElement board.

	board player moveEast.
	board player moveWest.
	board player moveEast.
	board player moveEast.


	self
		assert:
			((manager packDictionary at: 'mazesTest') levelDictionary at: 1)
				bestCount
		equals: 2.
	space := manager currentBoardElement space.

]
