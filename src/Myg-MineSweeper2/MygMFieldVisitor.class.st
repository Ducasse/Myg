"
I am an abstract visitor for a MField object.
"
Class {
	#name : #MygMFieldVisitor,
	#superclass : #Object,
	#category : #'Myg-MineSweeper2-Visitor'
}

{ #category : #visiting }
MygMFieldVisitor >> visitMClicked: aMClicked [
	^ self subclassResponsibility
]

{ #category : #visiting }
MygMFieldVisitor >> visitMField: aMField [
	^ self subclassResponsibility
]

{ #category : #visiting }
MygMFieldVisitor >> visitMMine: aMMine [
	^ self subclassResponsibility
]

{ #category : #visiting }
MygMFieldVisitor >> visitMUnknown: aMEmpty [
	^ self subclassResponsibility
]
