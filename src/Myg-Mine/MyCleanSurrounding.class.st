Class {
	#name : #MyCleanSurrounding,
	#superclass : #MyTile,
	#category : #'Myg-Mine-Core'
}

{ #category : #visiting }
MyCleanSurrounding >> accept: aMVisitor [
	^ aMVisitor visitClean: self
]

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
