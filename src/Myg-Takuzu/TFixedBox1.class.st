Class {
	#name : #TFixedBox1,
	#superclass : #TFixedBox,
	#category : 'Myg-Takuzu-Core'
}

{ #category : #description }
TFixedBox1 class >> textualMapCharacter [ 
	^ $1
]

{ #category : #initialization }
TFixedBox1 >> initialize [

	super initialize.
	value := 1
]
