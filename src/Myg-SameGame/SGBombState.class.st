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

{ #category : 'as yet unclassified' }
SGBombState >> canPropagate: aState [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ true
]

{ #category : 'testing' }
SGBombState >> literal [
	^ 'Bo'
]

{ #category : 'as yet unclassified' }
SGBombState >> propagateFromASquare: aSquare [

	^ aSquare propagateClickOnlyAround
]
