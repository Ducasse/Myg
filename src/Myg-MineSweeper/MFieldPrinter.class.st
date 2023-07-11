"
I am a visitor that print the MField on a WriteStream  on a String.
"
Class {
	#name : #MFieldPrinter,
	#superclass : #MStreamExporter,
	#instVars : [
		'field',
		'currentRow',
		'currentColumn'
	],
	#category : #'Myg-MineSweeper-Visitors'
}

{ #category : #initialization }
MFieldPrinter >> initialize [
	super initialize.
	self writeStream: (WriteStream on: String new)
]

{ #category : #visiting }
MFieldPrinter >> visitMClicked: aMClicked [
	|count|
	count := (field mineCountAroundBoxAt: currentRow at: currentColumn).
	count = 0
		ifTrue: [ 
			self writeStream << '_' ]
		ifFalse: [ 
			count printOn: self writeStream ]
]

{ #category : #visiting }
MFieldPrinter >> visitMField: aMField [
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
MFieldPrinter >> visitMMine: aMMine [
	self writeStream << $*
]

{ #category : #visiting }
MFieldPrinter >> visitMUnknown: aMEmpty [
	self writeStream << $*
]
