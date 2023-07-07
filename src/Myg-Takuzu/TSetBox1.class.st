Class {
	#name : #TSetBox1,
	#superclass : #TFixedBox,
	#category : #'Myg-Takuzu-Core'
}

{ #category : #description }
TSetBox1 class >> textualMapCharacter [ 
	^ $1
]

{ #category : #initialization }
TSetBox1 >> initialize [

	super initialize.
	value := 1
]
