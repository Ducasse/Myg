Class {
	#name : #TBox,
	#superclass : #Object,
	#instVars : [
		'value',
		'field',
		'position',
		'valueDictionary'
	],
	#category : #'Myg-Takuzu-Core'
}

{ #category : #initialization }
TBox class >> set: aNumber [
	^ TSetBox value: aNumber
]

{ #category : #'as yet unclassified' }
TBox class >> unknown [
	^ TUnknownBox new
]

{ #category : #'as yet unclassified' }
TBox >> click [
	self subclassResponsibility
]

{ #category : #accessing }
TBox >> field [ 
	^ field 
]

{ #category : #accessing }
TBox >> field: aTField [ 
	field := aTField 
]

{ #category : #initialization }
TBox >> initialize [ 
	super initialize.
	valueDictionary := Dictionary new.
	valueDictionary
			  at: 0 put: 1;
			  at: 1 put: nil;
			  at: nil put: 0
]

{ #category : #testing }
TBox >> isTSetBox [ 
	^ false
]

{ #category : #testing }
TBox >> isTUnknownBox [

	^ false
]

{ #category : #accessing }
TBox >> position [ 
	^ position
]

{ #category : #accessing }
TBox >> position: aPoint [ 
	position := aPoint 
]

{ #category : #printing }
TBox >> printOn: aStream [

	super printOn: aStream.
	aStream space.
	aStream print: self value
]

{ #category : #evaluating }
TBox >> value [ 
	^ value 
]

{ #category : #evaluating }
TBox >> value: aNumber [
	value := aNumber 
]

{ #category : #accessing }
TBox >> valueDictionary [ 
	^ valueDictionary 
]
