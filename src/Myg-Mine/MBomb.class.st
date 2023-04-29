Class {
	#name : #MBomb,
	#superclass : #MTile,
	#category : #'Myg-Mine'
}

{ #category : #'default encoding' }
MBomb class >> textualMapCharacter [

	^ '*'
]

{ #category : #accessing }
MBomb >> isBomb [ 

	^ true
]

{ #category : #accessing }
MBomb >> isClean [ 
	^ false
]

{ #category : #printing }
MBomb >> printOn: aStream [ 

	super printOn: aStream.
	aStream 
		space ; 
		print: '*' ; 
		space ; 
		print: x ; 
		space ; 
		print: y
]
