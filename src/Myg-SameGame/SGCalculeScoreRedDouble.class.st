Class {
	#name : 'SGCalculeScoreRedDouble',
	#superclass : 'SGCalculeScoreStrategy',
	#category : 'Myg-SameGame',
	#package : 'Myg-SameGame'
}

{ #category : 'as yet unclassified' }
SGCalculeScoreRedDouble >> calculePoint: hitlist [
	| score |
	score := hitlist size * hitlist size.
	hitlist
		detect: [ :each | each state class = SGRedState ]
		ifFound: [ ^ score * 2 ]
		ifNone: [ ^ score ]
]
