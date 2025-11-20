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
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGScoreElementTest >> setUp [

	super setUp.

	game := SGGame new.

	graphicScore := SGScoreElement new.
	graphicScore game: game
]

{ #category : 'tests' }
SGScoreElementTest >> testHitsChangesWhenGamePointsAreUpdated [

	| before |
	before := graphicScore blLastMoveHits text asString. "Should start at 0"
	
	game addPointsFor: { SGBox red }.
	self deny: graphicScore blLastMoveHits text asString equals: before
]

{ #category : 'tests' }
SGScoreElementTest >> testScoreChangesWhenGamePointsAreUpdated [

	| before |
	before := graphicScore blScore text asString.

	game addPoints: 7.
	self deny: graphicScore blScore text asString equals: before
]
