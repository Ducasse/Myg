"
I am an abstract box held by the mine field.
"
Class {
	#name : #MygMBox,
	#superclass : #MygAbstractBox,
	#instVars : [
		'announcer',
		'flagged'
	],
	#category : #'Myg-MineSweeper2-Model'
}

{ #category : #'subclass instance creation' }
MygMBox class >> clicked [
	^ MygMClicked new
]

{ #category : #'subclass instance creation' }
MygMBox class >> mine [
	^ MygMMine new
]

{ #category : #'random subclass instance creation' }
MygMBox class >> randomCase [
	^ (1 to: 7) atRandom > 6
			ifTrue: [ self mine ]
			ifFalse: [ self unknown ].
]

{ #category : #'subclass instance creation' }
MygMBox class >> unknown [
	^ MygMUnknown new
]

{ #category : #accessing }
MygMBox >> announcer [ 
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #clicking }
MygMBox >> clickIn: aMField at: x at: y [
	self subclassResponsibility
]

{ #category : #accessing }
MygMBox >> flagged: aBoolean [
	flagged:= aBoolean 
]

{ #category : #initialization }
MygMBox >> initialize [ 
	flagged := false
]

{ #category : #testing }
MygMBox >> isClickedBox [
	^ false
]

{ #category : #testing }
MygMBox >> isFlagged [ 
	^ flagged
]

{ #category : #testing }
MygMBox >> isMineBox [
	^ false
]

{ #category : #testing }
MygMBox >> isUnknownBox [
	^ false
]
