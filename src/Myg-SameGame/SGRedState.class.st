Class {
	#name : #SGRedState,
	#superclass : #SGNullState,
	#category : #'Myg-SameGame-Model'
}

{ #category : #accessing }
SGRedState >> backgroundRepresentation [

	^ Color lightRed
]

{ #category : #accessing }
SGRedState >> isNull [

	^ false
]

{ #category : #testing }
SGRedState >> literal [

	^ 'R'
]
