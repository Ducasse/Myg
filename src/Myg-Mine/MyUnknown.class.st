Class {
	#name : #MyUnknown,
	#superclass : #MyTile,
	#category : #'Myg-Mine-Core'
}

{ #category : #visiting }
MyUnknown >> accept: aMVisitor [
	^ aMVisitor visitUnknown: self
]
