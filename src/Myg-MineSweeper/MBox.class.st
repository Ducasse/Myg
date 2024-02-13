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
	^ MMineBox new
]

{ #category : #'random subclass instance creation' }
MBox class >> randomCase [
	^ (1 to: 7) atRandom > 6
			ifTrue: [ self mine ]
			ifFalse: [ self unknown ].
]

{ #category : #'subclass instance creation' }
MBox class >> unknown [
	^ MSafeBox new
]

{ #category : #accessing }
MBox >> announcer [ 
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #clicking }
MBox >> click [

	self subclassResponsibility
]

{ #category : #accessing }
MBox >> flag [

	self flagged: self isFlagged not
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
MBox >> isSafeBox [
	^ false
]

{ #category : #clicking }
MBox >> propagateClick [

	((self board hasMineBoxAroundBox: self) not or: [
		 self board rightFlagCountAroundBox: self ]) ifTrue: [
		self board boxesAroundBox: self do: [ :box |
			box isClickedBox ifFalse: [ box click ] ] ]
]
