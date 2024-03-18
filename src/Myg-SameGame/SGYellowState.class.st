Class {
	#name : #SGYellowState,
	#superclass : #SGNullState,
	#category : #'Myg-SameGame-Model'
}

{ #category : #accessing }
SGYellowState >> backgroundRepresentation [

	^ Color lightYellow
]

{ #category : #accessing }
SGYellowState >> isNull [

	^ false
]

{ #category : #testing }
SGYellowState >> literal [

	^ 'Y'
]
