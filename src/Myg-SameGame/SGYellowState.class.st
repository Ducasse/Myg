Class {
	#name : 'SGYellowState',
	#superclass : 'SGNullState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGYellowState >> backgroundRepresentation [

	^ Color lightYellow
]

{ #category : 'accessing' }
SGYellowState >> isNull [

	^ false
]

{ #category : 'testing' }
SGYellowState >> literal [

	^ 'Y'
]
