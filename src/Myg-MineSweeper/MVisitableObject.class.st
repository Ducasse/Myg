"
I am an abstract object that can be visited by a subclass of MFieldVisitor.
"
Class {
	#name : #MVisitableObject,
	#superclass : #Object,
	#category : #'Myg-MineSweeper-Core'
}

{ #category : #visiting }
MVisitableObject >> accept: aMFieldVisitor [
	^ self subclassResponsibility
]
