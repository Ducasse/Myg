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
	#category : 'Myg-SameGame-Tests-UI',
	#package : 'Myg-SameGame-Tests',
	#tag : 'UI'
}

{ #category : 'tests' }
SGScoreElementTest >> testHitsChangesWhenGamePointsAreUpdated [

	| before |
	before := graphicScore blLastMoveHits text asString. "Should start at 0"
	
	game addPointsFor: { SGBox red }.
	self deny: graphicScore blLastMoveHits text asString equals: before
]
