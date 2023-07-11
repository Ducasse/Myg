"
I am an abstract visitor for a MField object.
"
Class {
	#name : #MFieldVisitor,
	#superclass : #Object,
	#category : #'Myg-MineSweeper-Visitors'
}

{ #category : #visiting }
MFieldVisitor >> visitMClicked: aMClicked [
	^ self subclassResponsibility
]

{ #category : #visiting }
MFieldVisitor >> visitMField: aMField [
	^ self subclassResponsibility
]

{ #category : #visiting }
MFieldVisitor >> visitMMine: aMMine [
	^ self subclassResponsibility
]

{ #category : #visiting }
MFieldVisitor >> visitMUnknown: aMEmpty [
	^ self subclassResponsibility
]
