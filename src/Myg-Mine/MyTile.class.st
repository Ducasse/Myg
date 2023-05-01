Class {
	#name : #MyTile,
	#superclass : #Object,
	#instVars : [
		'board',
		'x',
		'y',
		'status',
		'neighBouring'
	],
	#category : #'Myg-Mine-Core'
}

{ #category : #'default encoding' }
MyTile class >> textualMapCharacter [

	^ $_
]

{ #category : #protected }
MyTile >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	"to probably remove and introduce basicX: and basicY:"
	x := aPosition x.
	y := aPosition y
]

{ #category : #accessing }
MyTile >> board [
	^ board 
]

{ #category : #accessing }
MyTile >> character [

	^ self class textualMapCharacter
]

{ #category : #status }
MyTile >> incrementStatus [

	status := status + 1
]

{ #category : #initialization }
MyTile >> initialize [

	super initialize.
	status := 0.
]

{ #category : #accessing }
MyTile >> isBomb [

	^ false
]

{ #category : #testing }
MyTile >> isClean [
	^ status = 0
]

{ #category : #accessing }
MyTile >> neighBouring [

	^ neighBouring
]

{ #category : #accessing }
MyTile >> neighBouring: aBlock [

	neighBouring := aBlock
]

{ #category : #accessing }
MyTile >> position [

	^ x @ y
]

{ #category : #protected }
MyTile >> position: aPoint [

	self basicPosition: aPoint.
	self board atX: aPoint x atY: aPoint y put: self
]

{ #category : #move }
MyTile >> postCreationAction [
	"nothing by default"
	
	^ self
]

{ #category : #printing }
MyTile >> printOn: aStream [ 

	super printOn: aStream.
	aStream 
		space ; 
		print: status ; 
		space ; 
		print: x ; 
		space ; 
		print: y
]

{ #category : #protected }
MyTile >> setBoard: aBoard [
	board := aBoard
]

{ #category : #accessing }
MyTile >> status [
	^ status
]

{ #category : #accessing }
MyTile >> textualMapCharacter [

	^ status asString
]

{ #category : #accessing }
MyTile >> x [

	^ x
]

{ #category : #accessing }
MyTile >> x: anInteger [
	"may be we should update the previous position."
	x := anInteger.
	self board atX: x atY: y put: self
]

{ #category : #accessing }
MyTile >> x: xCoord y: yCoord [
	"may be we should update the previous position."
	x := xCoord.
	y := yCoord.
	self board atX: x atY: y put: self
]

{ #category : #accessing }
MyTile >> y [

	^ y
]

{ #category : #accessing }
MyTile >> y: anInteger [
	"may be we should update the previous position."

	y := anInteger.
	self board atX: x atY: y put: self
]
