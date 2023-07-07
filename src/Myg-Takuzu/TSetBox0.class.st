Class {
	#name : #TSetBox0,
	#superclass : #TFixedBox,
	#category : #'Myg-Takuzu-Core'
}

{ #category : #description }
TSetBox0 class >> textualMapCharacter [

	^ $0
]

{ #category : #initialization }
TSetBox0 >> initialize [

	super initialize.
	value := 0
]
