Class {
	#name : 'TUnknownBox',
	#superclass : 'TBox',
	#category : 'Myg-Takuzu-Core',
	#package : 'Myg-Takuzu',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
TUnknownBox class >> textualMapCharacter [
	^ $_
]

{ #category : 'interaction' }
TUnknownBox >> click [
	"change the box value to its next state (nil -> 0 -> 1 -> nil)"

	self value: (value ifNil: [ 0 ] ifNotNil: [
			 value = 0
				 ifTrue: [ 1 ]
				 ifFalse: [ nil ] ]).
	self board checkIfFinished
]

{ #category : 'testing' }
TUnknownBox >> isTUnknownBox [ 
	
	^ true
]
