"
This class contains tests
"
Class {
	#name : #MygSkGameLogic,
	#superclass : #TestCase,
	#instVars : [
		'board'
	],
	#category : #'Myg-Sokoban-Tests'
}

{ #category : #running }
MygSkGameLogic >> setUp [

	super setUp.
	
	board := MygSkBoard board:
		         ((MygLevelImporter
			          fromString: '#@$ . #'
			          fromPackage: MygSkBoard package) do: [ :each | each configured ]).
]

{ #category : #tests }
MygSkGameLogic >> testIsFinished [

	self deny: board isFinished.
	board player moveEast.
	board player moveEast.
	self assert: board isFinished
]

{ #category : #tests }
MygSkGameLogic >> testIsFinishedThenUnfinish [

	self deny: board isFinished.
	board player moveEast.
	board player moveEast.
	self assert: board isFinished.
	board player moveEast.
	self deny: board isFinished
]

{ #category : #tests }
MygSkGameLogic >> testMoveSteps [

	self deny: board isFinished.
	board moveSteps: {
			CpDirection east.
			CpDirection east }.
	self assert: board isFinished
]
