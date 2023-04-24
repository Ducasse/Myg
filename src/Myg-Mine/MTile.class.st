Class {
	#name : #MTile,
	#superclass : #Object,
	#instVars : [
		'board',
		'x',
		'y',
		'status',
		'neighBouring'
	],
	#category : #'Myg-Mine'
}

{ #category : #'default encoding' }
MTile class >> textualMapCharacter [

	^ self subclassResponsibility
]

{ #category : #protected }
MTile >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	"to probably remove and introduce basicX: and basicY:"
	x := aPosition x.
	y := aPosition y
]

{ #category : #accessing }
MTile >> board [
	^ board 
]

{ #category : #accessing }
MTile >> character [

	^ self class textualMapCharacter
]

{ #category : #initialization }
MTile >> initialize [ 
	super initialize.
	self basicPosition: 1@1
]

{ #category : #accessing }
MTile >> isBomb [

	^ false
]

{ #category : #accessing }
MTile >> neighBouring [

	^ neighBouring
]

{ #category : #accessing }
MTile >> neighBouring: aBlock [

	neighBouring := aBlock
]

{ #category : #accessing }
MTile >> position [

	^ x @ y
]

{ #category : #protected }
MTile >> position: aPoint [

	self basicPosition: aPoint.
	self board atX: aPoint x atY: aPoint y put: self
]

{ #category : #move }
MTile >> postCreationAction [
	"nothing by default"
	
	^ self
]

{ #category : #printing }
MTile >> printOn: aStream [ 

	super printOn: aStream.
	aStream 
		space ; 
		nextPut: self character; 
		space ; 
		print: x ; 
		space ; 
		print: y
]

{ #category : #protected }
MTile >> setBoard: aBoard [
	board := aBoard
]

{ #category : #accessing }
MTile >> x [

	^ x
]

{ #category : #accessing }
MTile >> x: anInteger [
	"may be we should update the previous position."
	x := anInteger.
	self board atX: x atY: y put: self
]

{ #category : #accessing }
MTile >> x: xCoord y: yCoord [
	"may be we should update the previous position."
	x := xCoord.
	y := yCoord.
	self board atX: x atY: y put: self
]

{ #category : #accessing }
MTile >> y [

	^ y
]

{ #category : #accessing }
MTile >> y: anInteger [
	"may be we should update the previous position."

	y := anInteger.
	self board atX: x atY: y put: self
]
