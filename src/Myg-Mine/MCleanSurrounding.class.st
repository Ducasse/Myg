Class {
	#name : #MCleanSurrounding,
	#superclass : #MTile,
	#category : #'Myg-Mine'
}

{ #category : #testing }
MCleanSurrounding >> isClean [

	^ true
]

{ #category : #printing }
MCleanSurrounding >> printOn: aStream [ 

	super printOn: aStream.
	aStream 
		space ; 
		nextPutAll: '_' ; 
		space ; 
		print: x ; 
		space ; 
		print: y
]
