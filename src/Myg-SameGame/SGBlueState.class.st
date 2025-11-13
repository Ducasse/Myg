Class {
	#name : 'SGBlueState',
	#superclass : 'SGAbstractState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGBlueState >> backgroundRepresentation [

	^ Color lightBlue
]

{ #category : 'testing' }
SGBlueState >> literal [

	^ 'B'
]

{ #category : 'as yet unclassified' }
SGBlueState >> propagateFromASquare: aSquare [

	^ aSquare propagateBlueState.
]
