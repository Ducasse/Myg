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

	self subclassResponsibility
]
