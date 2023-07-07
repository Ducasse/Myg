Class {
	#name : #TBox,
	#superclass : #MygAbstractBox,
	#instVars : [
		'value',
		'valueDictionary'
	],
	#category : #'Myg-Takuzu-Core'
}

{ #category : #factory }
TBox class >> createFixedBox: aNumber [
	^ TFixedBox createBoxWithValue: aNumber
]

{ #category : #factory }
TBox class >> createUnknownBox [
	^ TUnknownBox new
]

{ #category : #interaction }
TBox >> click [
	self subclassResponsibility
]

{ #category : #evaluating }
TBox >> createBoxWithValue: aNumber [
	value := aNumber 
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

{ #category : #accessing }
TBox >> valueDictionary [ 
	^ valueDictionary 
]
