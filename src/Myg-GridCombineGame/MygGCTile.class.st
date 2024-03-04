"
I'm a tile in a `GCGame`.
"
Class {
	#name : #MygGCTile,
	#superclass : #Object,
	#instVars : [
		'game',
		'content',
		'position'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #accessing }
MygGCTile >> content [

	^ content
]

{ #category : #accessing }
MygGCTile >> content: anObject [

	content := anObject
]

{ #category : #accessing }
MygGCTile >> game [

	^ game
]

{ #category : #accessing }
MygGCTile >> game: anObject [

	game := anObject
]

{ #category : #accessing }
MygGCTile >> position [

	^ position
]

{ #category : #accessing }
MygGCTile >> position: anObject [

	position := anObject
]

{ #category : #printing }
MygGCTile >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' position: ';
		print: position.
	aStream
		nextPutAll: ' content: ';
		print: content
]
