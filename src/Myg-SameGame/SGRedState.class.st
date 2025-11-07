Class {
	#name : 'SGRedState',
	#superclass : 'SGNullState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGRedState >> backgroundRepresentation [

	^ Color lightRed
]

{ #category : 'accessing' }
SGRedState >> isNull [

	^ false
]

{ #category : 'testing' }
SGRedState >> literal [

	^ 'R'
]
