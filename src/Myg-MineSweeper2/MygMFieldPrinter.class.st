"
I am a visitor that print the MField on a WriteStream  on a String.
"
Class {
	#name : #MygMFieldPrinter,
	#superclass : #MygMStreamExporter,
	#instVars : [
		'field',
		'currentRow',
		'currentColumn'
	],
	#category : #'Myg-MineSweeper2-Visitor'
}

{ #category : #initialization }
MygMFieldPrinter >> initialize [
	super initialize.
	self writeStream: (WriteStream on: String new)
]

{ #category : #visiting }
MygMFieldPrinter >> visitMClicked: aMClicked [
	|count|
	count := (field mineCountAroundBoxAt: currentRow at: currentColumn).
	count = 0
		ifTrue: [ 
			self writeStream << '_' ]
		ifFalse: [ 
			count printOn: self writeStream ]
]

{ #category : #visiting }
MygMFieldPrinter >> visitMField: aMField [
	field := aMField.
	aMField boxesDoWithIndices: [ :box :row :column |
		currentRow := row.
		currentColumn := column.
		box accept: self.
		currentColumn = aMField width 
			ifFalse: [ self writeStream << Character space ]
			ifTrue: [ self writeStream << Smalltalk os lineEnding ] ]
]

{ #category : #visiting }
MygMFieldPrinter >> visitMMine: aMMine [
	self writeStream << $*
]

{ #category : #visiting }
MygMFieldPrinter >> visitMUnknown: aMEmpty [
	self writeStream << $*
]
