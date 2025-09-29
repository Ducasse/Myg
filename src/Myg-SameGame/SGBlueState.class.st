Class {
	#name : #SGBlueState,
	#superclass : #SGNullState,
	#category : #'Myg-SameGame-Model'
}

{ #category : #accessing }
SGBlueState >> backgroundRepresentation [

	^ Color lightBlue
]

{ #category : #accessing }
SGBlueState >> isNull [

	^ false
]

{ #category : #testing }
SGBlueState >> literal [

	^ 'B'
]
