"
I am an abstract visitor exporting the MField on the stream in #writeStream instance variable.
"
Class {
	#name : #MStreamExporter,
	#superclass : #MFieldVisitor,
	#instVars : [
		'writeStream'
	],
	#category : #'Myg-MineSweeper-Visitors'
}

{ #category : #'instance creation' }
MStreamExporter class >> on: aWriteStream [
	^ self writeStream: aWriteStream
]

{ #category : #'instance creation' }
MStreamExporter class >> writeStream: aWriteStream [
	^ self new
		writeStream: aWriteStream;
		yourself
]

{ #category : #accessing }
MStreamExporter >> streamContents [
	^ self writeStream contents
]

{ #category : #accessing }
MStreamExporter >> writeStream [
	^ writeStream
]

{ #category : #accessing }
MStreamExporter >> writeStream: anObject [
	writeStream := anObject
]
