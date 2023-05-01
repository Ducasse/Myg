Class {
	#name : #MyBoardPrinter,
	#superclass : #MyStreamExporter,
	#instVars : [
		'field',
		'currentRow',
		'currentColumn'
	],
	#category : #'Myg-Mine-Debug'
}

{ #category : #initialization }
MyBoardPrinter >> initialize [
	super initialize.
	writeStream := (WriteStream on: String new)
]
