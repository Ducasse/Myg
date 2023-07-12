"
I am an abstract visitor exporting the MField on the stream in #writeStream instance variable.
"
Class {
	#name : #MygMStreamExporter,
	#superclass : #MygMFieldVisitor,
	#instVars : [
		'writeStream'
	],
	#category : #'Myg-MineSweeper2-Visitor'
}

{ #category : #'instance creation' }
MygMStreamExporter class >> on: aWriteStream [
	^ self writeStream: aWriteStream
]

{ #category : #'instance creation' }
MygMStreamExporter class >> writeStream: aWriteStream [
	^ self new
		writeStream: aWriteStream;
		yourself
]

{ #category : #accessing }
MygMStreamExporter >> streamContents [
	^ self writeStream contents
]

{ #category : #accessing }
MygMStreamExporter >> writeStream [
	^ writeStream
]

{ #category : #accessing }
MygMStreamExporter >> writeStream: anObject [
	writeStream := anObject
]
