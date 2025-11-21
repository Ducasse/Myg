"
I represent a Case of the SameGame

I have the responsabilities of my coordinates

I am part of a Board of a Same Game
"
Class {
	#name : 'SGNullState',
	#superclass : 'SGAbstractState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGNullState >> backgroundRepresentation [

	^ Color gray
]

{ #category : 'accessing' }
SGNullState >> compatibleWith: aSGState [ 
	"compatibility is usefull for propagating, does not concern the null state"
	^ false
]

{ #category : 'accessing' }
SGNullState >> isNull [

	^ true
]

{ #category : 'accessing' }
SGNullState >> literal [

	^ 'N'
]

{ #category : 'accessing' }
SGNullState >> propagateFromABox: aSGBox [ 
	
	^ aSGBox propagateNullState
]
