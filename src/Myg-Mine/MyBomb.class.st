Class {
	#name : #MyBomb,
	#superclass : #MyTile,
	#category : #'Myg-Mine-Core'
}

{ #category : #'default encoding' }
MyBomb class >> textualMapCharacter [

	^ $*
]

{ #category : #accessing }
MyBomb >> isBomb [ 

	^ true
]

{ #category : #accessing }
MyBomb >> isClean [ 
	^ false
]

{ #category : #printing }
MyBomb >> printOn: aStream [ 

	super printOn: aStream.
	aStream 
		space ; 
		print: '*' ; 
		space ; 
		print: x ; 
		space ; 
		print: y
]
