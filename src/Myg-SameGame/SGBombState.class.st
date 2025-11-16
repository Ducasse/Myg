Class {
	#name : 'SGBombState',
	#superclass : 'SGAbstractState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGBombState >> backgroundRepresentation [

	^ Color black 
]

{ #category : 'testing' }
SGBombState >> literal [
	^ 'Bo'
]

{ #category : 'as yet unclassified' }
SGBombState >> propagateFromASquare: aSquare [

	^ aSquare propagateBombState
]
