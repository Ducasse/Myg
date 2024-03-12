Class {
	#name : #TBox,
	#superclass : #MygAbstractBox,
	#instVars : [
		'value'
	],
	#classVars : [
		'ValueDictionary'
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

{ #category : #'class initialization' }
TBox class >> initialize [
	"self initialize"
	ValueDictionary := {
		                   (0 -> 1).
		                   (1 -> nil).
		                   (nil -> 0) } asDictionary
]

{ #category : #accessing }
TBox class >> valueDictionary [ 

	^ ValueDictionary 
]

{ #category : #interaction }
TBox >> click [
	self subclassResponsibility
]

{ #category : #testing }
TBox >> isTFixedBox [ 
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

{ #category : #evaluating }
TBox >> value: aNumber [

	value := aNumber
]

{ #category : #accessing }
TBox >> valueDictionary [

	^ ValueDictionary
]
