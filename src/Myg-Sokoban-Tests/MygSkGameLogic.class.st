"
This class contains tests
"
Class {
	#name : #MygSkGameLogic,
	#superclass : #TestCase,
	#category : #'Myg-Sokoban-Tests'
}

{ #category : #tests }
MygSkGameLogic >> testIsFinished [

	| board |
	board := MygSkBoard board:
		         ((MygLevelImporter
			          fromString: '#@$ .#'
			          fromPackage: MygSkBoard package) do: [ :each | each configured ]).

	self deny: board isFinished.
	board player moveEast.
	board player moveEast.
	self assert: board isFinished
]

{ #category : #tests }
MygSkGameLogic >> testIsFinishedThenUnfinish [

	| board |
	board := MygSkBoard board:
		         (LevelImporter
			          fromString: '#@$ . #'
			          fromPackage: MygSkBoard package).
	self deny: board isFinished.
	board player moveEast.
	board player moveEast.
	self assert: board isFinished.
	board player moveEast.
	self deny: board isFinished
]

{ #category : #tests }
MygSkGameLogic >> testMoveSteps [

	| board |
	board := MygSkBoard board:
		         (LevelImporter
			          fromString: '#@$ . #'
			          fromPackage: MygSkBoard package).
	self deny: board isFinished.
	board moveSteps: {
			CpDirection east.
			CpDirection east }.
	self assert: board isFinished
]
