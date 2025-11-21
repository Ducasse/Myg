Class {
	#name : 'SGLineKillerState',
	#superclass : 'SGSpecialState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGLineKillerState >> backgroundRepresentation [

	^ Color purple
]

{ #category : 'testing' }
SGLineKillerState >> literal [

	^ 'Lk'
]

{ #category : 'as yet unclassified' }
SGLineKillerState >> propagateFromABox: aSGBox [

	^ aSGBox propagateLineKillerState
]
