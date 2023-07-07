Class {
	#name : #TUnknownBox,
	#superclass : #TBox,
	#category : #'Myg-Takuzu-Core'
}

{ #category : #'as yet unclassified' }
TUnknownBox class >> textualMapCharacter [
	^ $_
]

{ #category : #interaction }
TUnknownBox >> click [
	"change the box value to its next state (nil -> 0 -> 1 -> nil)"

	self createBoxWithValue: (value ifNil: [ 0 ] ifNotNil: [
			 value = 0
				 ifTrue: [ 1 ]
				 ifFalse: [ nil ] ])
]

{ #category : #testing }
TUnknownBox >> isTUnknownBox [ 
	
	^ true
]
