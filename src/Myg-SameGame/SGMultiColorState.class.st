Class {
	#name : 'SGMultiColorState',
	#superclass : 'SGAbstractState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGMultiColorState >> backgroundRepresentation [

	^ Color black 
]

{ #category : 'as yet unclassified' }
SGMultiColorState >> canPropagate: aState [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ true
]

{ #category : 'testing' }
SGMultiColorState >> literal [
	^ 'Mu'
]

{ #category : 'as yet unclassified' }
SGMultiColorState >> propagateFromASquare: aSquare [

	^ aSquare propagateClickOnlyAround
]
