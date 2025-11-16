Class {
	#name : 'SGBasicState',
	#superclass : 'SGAbstractState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGBasicState >> propagateFromASquare: aSquare [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ aSquare propagateNormalState.
]
