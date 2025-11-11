Class {
	#name : 'SGScoreElement',
	#superclass : 'BlElement',
	#instVars : [
		'game',
		'score'
	],
	#category : 'Myg-SameGame-UI',
	#package : 'Myg-SameGame',
	#tag : 'UI'
}

{ #category : 'as yet unclassified' }
SGScoreElement >> game: aSGGame [

	game := aSGGame.

	self initializeAnnouncements
]

{ #category : 'as yet unclassified' }
SGScoreElement >> initialize [

	super initialize.
	self layout: BlFrameLayout new.

	score := BlTextElement new.

	self constraintsDo: [ :c |
			c horizontal resizer: BlLayoutFitContentResizer new.
			c vertical resizer: BlLayoutFitContentResizer new ].
		
	"Set the score at 0"
	self updateScore.
	self addChild: score
]

{ #category : 'as yet unclassified' }
SGScoreElement >> initializeAnnouncements [ 

	game announcer when: SGScoreChangedAnnouncement send: #updateScore to: self
]

{ #category : 'as yet unclassified' }
SGScoreElement >> updateScore [

	| s |
	s := (game ifNil: [ 0 ] ifNotNil: [ game points ]) asString.
	score text: ((BlRopedText string: 'Score: ' , s) fontSize: 50). 
]
