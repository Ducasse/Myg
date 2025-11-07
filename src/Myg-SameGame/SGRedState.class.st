Class {
	#name : 'SGRedState',
	#superclass : 'SGAbstractState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGRedState >> backgroundRepresentation [

	^ Color lightRed
]

{ #category : 'testing' }
SGRedState >> literal [

	^ 'R'
]
