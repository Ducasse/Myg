Class {
	#name : #SGGreenState,
	#superclass : #SGNullState,
	#category : #'Myg-SameGame-Model'
}

{ #category : #accessing }
SGGreenState >> backgroundRepresentation [

	^ Color lightGreen 
]

{ #category : #accessing }
SGGreenState >> isNull [

	^ false
]

{ #category : #testing }
SGGreenState >> literal [

	^ 'G'
]
