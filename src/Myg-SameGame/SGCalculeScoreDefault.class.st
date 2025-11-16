Class {
	#name : 'SGCalculeScoreDefault',
	#superclass : 'SGCalculeScoreStrategy',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGCalculeScoreDefault >> calculePoint: hitlist [

	| score |
	score := hitlist size * hitlist size.
	^ score
]
