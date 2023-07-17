"
I do the same thing as my mother class but I show mines on the field by printing a M.
"
Class {
	#name : #MygMDebugFieldPrinter,
	#superclass : #MygMFieldPrinter,
	#category : #'Myg-MineSweeper2-Visitor'
}

{ #category : #visiting }
MygMDebugFieldPrinter >> visitMMine: aMMine [
	self writeStream << $M
]
