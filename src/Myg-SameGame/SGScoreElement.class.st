Class {
	#name : 'SGScoreElement',
	#superclass : 'BlElement',
	#instVars : [
		'game',
		'blScore',
		'score',
		'blLastMove',
		'blLastMoveScore',
		'blLastMoveHits'
	],
	#category : 'Myg-SameGame-UI',
	#package : 'Myg-SameGame',
	#tag : 'UI'
}

{ #category : 'as yet unclassified' }
SGScoreElement >> blLastMoveHits [
	^ blLastMoveHits
]

{ #category : 'as yet unclassified' }
SGScoreElement >> blScore [
	^ blScore
]

{ #category : 'as yet unclassified' }
SGScoreElement >> game: aSGGame [

	game := aSGGame.
	score := game points.
	self initializeAnnouncements
]

{ #category : 'as yet unclassified' }
SGScoreElement >> initialize [
	super initialize.
	
	"Initialize variables"
	score := 0.
	blScore := BlTextElement new.
	blLastMoveScore := BlTextElement new.
	blLastMoveHits := BlTextElement new.
	blLastMove := BlElement new.
	
	"Configure main container"
	self layout: BlFrameLayout new.
	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	
	"Configure left side: total score"
	blScore constraintsDo: [ :c |
		c frame horizontal alignLeft.
		c frame vertical alignCenter ].
	
	"Configure right side: last move info (vertical stack)"
	blLastMove layout: BlLinearLayout vertical.
	blLastMove constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c frame horizontal alignRight.
		c frame vertical alignCenter ].
	blLastMove
		addChild: blLastMoveScore;
		addChild: blLastMoveHits.
	
	"Build UI"
	self
		addChild: blScore;
		addChild: blLastMove.
	
	self updateScore
]

{ #category : 'as yet unclassified' }
SGScoreElement >> initializeAnnouncements [ 

	game announcer when: SGScoreChangedAnnouncement send: #updateScore to: self
]

{ #category : 'as yet unclassified' }
SGScoreElement >> updateScore [

	| newScore hits |
	newScore := game ifNil: [ 0 ] ifNotNil: [ game points ].
	hits := game ifNil: [ 0 ] ifNotNil: [ game lastHitList size ].
	blScore text: ((BlRopedText string: 'Total score: ' , newScore asString) fontSize: 50).
	blLastMoveScore text: ((BlRopedText string: 'Score: ' , (newScore - score) asString) fontSize: 50).
	blLastMoveHits text: ((BlRopedText string: 'Hits: ' , hits asString) fontSize: 50).
	score := newScore
]
