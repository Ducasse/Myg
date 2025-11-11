Class {
	#name : 'SGCalculeScoreDefault',
	#superclass : 'SGCalculeScoreStrategy',
	#category : 'Myg-SameGame',
	#package : 'Myg-SameGame'
}

{ #category : 'as yet unclassified' }
SGCalculeScoreDefault >> calculePoint: hitlist [

	| score |
	score := hitlist size * hitlist size.
	^ score
]
