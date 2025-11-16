"
A SGBoardTest is a test class for testing the behavior of SGBoard
"
Class {
	#name : 'SGBoardTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SGBoardTest >> testAddingBoardToGameAlsoAddGameToBoard [

	| board game |
	board := SGBoard new.
	game := SGGame new.

	game board: board.

	self assert: board game equals: game
]

{ #category : 'tests' }
SGBoardTest >> testSetGameWithGameKnowingTheBoard [

	| board game |
	board := SGBoard new.
	game := SGGame new.

	game board:  board.

	self shouldnt: [ board game: game ] raise: Error
]

{ #category : 'tests' }
SGBoardTest >> testSetGameWithoutGameKnowingTheBoard [

	self should: [ SGBoard new game: SGGame new] raise: Error
	
]
