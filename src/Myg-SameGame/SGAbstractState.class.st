Class {
	#name : 'SGAbstractState',
	#superclass : 'Object',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGAbstractState class >> uniqueInstance [

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : 'as yet unclassified' }
SGAbstractState >> canPropagate: aState [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ self = aState 
]

{ #category : 'testing' }
SGAbstractState >> isNull [
	^ false
]

{ #category : 'testing' }
SGAbstractState >> literal [
	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
SGAbstractState >> propagateFromASquare: aSquare [

	SubclassResponsibility.
]
