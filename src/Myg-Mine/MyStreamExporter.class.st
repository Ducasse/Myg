Class {
	#name : #MyStreamExporter,
	#superclass : #MyBoardVisitor,
	#instVars : [
		'writeStream'
	],
	#category : #'Myg-Mine-Debug'
}

{ #category : #accessing }
MyStreamExporter >> streamContents [
	^ writeStream contents
]

{ #category : #accessing }
MyStreamExporter >> writeStream: anObject [
	writeStream := anObject
]
