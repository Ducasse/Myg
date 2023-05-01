Class {
	#name : #MyCleanSurrounding,
	#superclass : #MyTile,
	#category : #'Myg-Mine-Core'
}

{ #category : #testing }
MyCleanSurrounding >> isClean [

	^ true
]

{ #category : #printing }
MyCleanSurrounding >> printOn: aStream [ 

	super printOn: aStream.
	aStream 
		space ; 
		nextPutAll: '_' ; 
		space ; 
		print: x ; 
		space ; 
		print: y
]
