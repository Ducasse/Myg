"
I am an abstract box held by the mine field.
"
Class {
	#name : #MBox,
	#superclass : #MygAbstractBox,
	#instVars : [
		'announcer',
		'flagged'
	],
	#category : #'Myg-MineSweeper-Model'
}

{ #category : #'subclass instance creation' }
MBox class >> clicked [
	^ MClicked new
]

{ #category : #'subclass instance creation' }
MBox class >> mine [
	^ MMine new
]

{ #category : #'random subclass instance creation' }
MBox class >> randomCase [
	^ (1 to: 7) atRandom > 6
			ifTrue: [ self mine ]
			ifFalse: [ self unknown ].
]

{ #category : #'subclass instance creation' }
MBox class >> unknown [
	^ MUnknown new
]

{ #category : #accessing }
MBox >> announceFlag [

	self announcer announce: MBoxFlaggedAnnouncement new.
	self flagged: flagged not
]

{ #category : #accessing }
MBox >> announcer [ 
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #clicking }
MBox >> clickIn: aMField at: x at: y [
	self subclassResponsibility
]

{ #category : #accessing }
MBox >> flagged: aBoolean [
	flagged:= aBoolean 
]

{ #category : #initialization }
MBox >> initialize [ 
	flagged := false
]

{ #category : #testing }
MBox >> isClickedBox [
	^ false
]

{ #category : #testing }
MBox >> isFlagged [ 
	^ flagged
]

{ #category : #testing }
MBox >> isMineBox [
	^ false
]

{ #category : #testing }
MBox >> isUnknownBox [
	^ false
]
