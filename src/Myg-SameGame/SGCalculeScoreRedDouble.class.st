Class {
	#name : 'SGCalculeScoreRedDouble',
	#superclass : 'SGCalculeScoreStrategy',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGCalculeScoreRedDouble >> calculePoint: hitlist [

	| nbBloc |
	nbBloc := 0.
	hitlist do: [ :each |
			nbBloc := each state class= SGRedState
				          ifTrue: [ nbBloc + 2 ]
				          ifFalse: [ nbBloc + 1 ] ].
	^ nbBloc * nbBloc
]
