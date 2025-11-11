"
A SGScoreElementTest is a test class for testing the behavior of SGScoreElement
"
Class {
	#name : 'SGScoreElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'game',
		'board',
		'graphicScore'
	],
	#category : 'Myg-SameGame-UI-Tests',
	#package : 'Myg-SameGame',
	#tag : 'UI-Tests'
}

{ #category : 'running' }
SGScoreElementTest >> setUp [

	super setUp.
	
	game := SGGame new.
	
	graphicScore := SGScoreElement new.
	graphicScore game: game.

]

{ #category : 'tests' }
SGScoreElementTest >> testScoreChangesWhenGamePointsAreUpdated [

	| before |
	before := graphicScore children first text asString.
	
	game addPoints: 7.
	self deny: graphicScore children first text asString equals: before
]
