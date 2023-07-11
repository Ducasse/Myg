"
I am a mine field.

I you want to play with me, have a look at 'player api' protocol.

You may want to subscribe to my announcer to react to what is going on during the game. Access it using #announcer accessor. See MFieldAnnouncement to know what I can announce.
"
Class {
	#name : #MField,
	#superclass : #MVisitableObject,
	#instVars : [
		'matrix',
		'round',
		'gameEnded',
		'playerWon',
		'announcer',
		'magnifier'
	],
	#category : #'Myg-MineSweeper-Core'
}

{ #category : #'instance creation' }
MField class >> matrix: aMatrix [
	^ self new
		matrix: aMatrix;
		yourself
]

{ #category : #'test ressources' }
MField class >> matrixForField [
	^ self matrix: ((Array2D rows: 5 columns: 5)
			at: 1 at: 1 put: MBox unknown;
			at: 1 at: 2 put: MBox unknown;
			at: 1 at: 3 put: MBox mine;
			at: 1 at: 4 put: MBox unknown;
			at: 1 at: 5 put: MBox unknown;
			at: 2 at: 1 put: MBox unknown;
			at: 2 at: 2 put: MBox unknown;
			at: 2 at: 3 put: MBox mine;
			at: 2 at: 4 put: MBox unknown;
			at: 2 at: 5 put: MBox unknown;
			at: 3 at: 1 put: MBox mine;
			at: 3 at: 2 put: MBox mine;
			at: 3 at: 3 put: MBox mine;
			at: 3 at: 4 put: MBox unknown;
			at: 3 at: 5 put: MBox unknown;
			at: 4 at: 1 put: MBox unknown;
			at: 4 at: 2 put: MBox unknown;
			at: 4 at: 3 put: MBox unknown;
			at: 4 at: 4 put: MBox mine;
			at: 4 at: 5 put: MBox mine;
			at: 5 at: 1 put: MBox mine;
			at: 5 at: 2 put: MBox unknown;
			at: 5 at: 3 put: MBox unknown;
			at: 5 at: 4 put: MBox unknown;
			at: 5 at: 5 put: MBox unknown;
			yourself)
]

{ #category : #'as yet unclassified' }
MField class >> matrixTest5x5 [ 
	^ self matrix: ((Array2D rows: 5 columns: 5) collect: [ :e | MBox randomCase ])
]

{ #category : #'instance creation' }
MField class >> width: width height: height [
	^ self matrix: ((Matrix rows: height columns: width) collect: [ :e | MBox randomCase ])
]

{ #category : #visiting }
MField >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMField: self
]

{ #category : #accessing }
MField >> announcer [
	^ announcer
]

{ #category : #enumerating }
MField >> anyBoxSatisfy: aBlock [
	^ matrix anySatisfy: aBlock
]

{ #category : #accessing }
MField >> boxAt: x at: y [
	^ matrix at: x at: y
]

{ #category : #enumerating }
MField >> boxesAroundBoxAt: x at: y anySatisfy: aBlock [
	self boxesAroundBoxAt: x at: y do: [ :box |
		(aBlock value: box)
			ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #enumerating }
MField >> boxesAroundBoxAt: x at: y collect: aBlock [
	| collected |
	collected := OrderedCollection new.
	self boxesAroundBoxAt: x at: y do: [ :box |
		collected add: (aBlock value: box) ].
	^ collected
]

{ #category : #enumerating }
MField >> boxesAroundBoxAt: x at: y do: aBlock [
	self boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
		aBlock value: box ]
]

{ #category : #enumerating }
MField >> boxesAroundBoxAt: x at: y doWithIndexes: aBlock [
	^ (x - 1 to: x + 1) collect: [ :i |
			(y - 1 to: y + 1) collect: [ :j |
				((i = x and: [ j = y ])
					or: [ i < 1
					or: [ j < 1
					or: [ i > self height
					or: [ j > self width ] ] ] 
				])
					ifFalse: [ 
						aBlock
							value: (self boxAt: i at: j)
							value: i
							value: j ] ] ]
]

{ #category : #enumerating }
MField >> boxesAroundBoxAt: x at: y select: aBlock [
	| collected |
	collected := OrderedCollection new.
	self boxesAroundBoxAt: x at: y do: [ :box |
		(aBlock value: box)
			ifTrue: [ collected add: box ] ].
	^ collected
]

{ #category : #enumerating }
MField >> boxesDoWithIndices: aBlock [
	1 to: self height do: [ :i |
		1 to: self width do: [ :j |
			aBlock value: (self boxAt: i at: j) value: i value: j ] ]
]

{ #category : #enumerating }
MField >> boxesSelect: aBlock [
	| selected |
	selected := OrderedCollection new.
	matrix do: [ :box |
		(aBlock value: box)
			ifTrue: [ selected add: box ] ].
	^ selected
]

{ #category : #'player api' }
MField >> clickOnBoxAt: x at: y [
	gameEnded ifTrue: [ ^ self ].
	(self boxAt: x at: y) clickIn: self at: x at: y
]

{ #category : #'debug api' }
MField >> debugTextualRepresentation [
	| visitor |
	visitor := MDebugFieldPrinter new.
	self accept: visitor.
	^ visitor streamContents
]

{ #category : #'box api' }
MField >> fieldUpdate [
	self announcer announce: (MFieldUpdate field: self)
]

{ #category : #'box api' }
MField >> flagCountAroundBoxAt: x at: y [
	^ (self boxesAroundBoxAt: x at: y collect: [ :box | 
		box isFlagged
			ifTrue: [ 1 ]
			ifFalse: [ 0 ] ]) sum
]

{ #category : #accessing }
MField >> gameEnded [
	^ gameEnded
]

{ #category : #testing }
MField >> hasClickedBoxAroundBoxAt: x at: y [
	^ self boxesAroundBoxAt: x at: y anySatisfy: #isClickedBox
]

{ #category : #testing }
MField >> hasMineBoxAroundBoxAt: x at: y [
	^ (self mineCountAroundBoxAt: x at: y) > 0
]

{ #category : #testing }
MField >> hasUnknownBox [
	^ self anyBoxSatisfy: #isUnknownBox
]

{ #category : #accessing }
MField >> height [
	^ matrix numberOfRows
]

{ #category : #'box api' }
MField >> incrementRound [
	round := round + 1
]

{ #category : #initialization }
MField >> initialize [
	super initialize.
	round := 0.
	announcer := Announcer new.
	gameEnded := false.
	playerWon := false
]

{ #category : #accessing }
MField >> magnifier [ 
	^ magnifier
]

{ #category : #accessing }
MField >> magnifier: aNumber [
	magnifier := aNumber 
]

{ #category : #accessing }
MField >> matrix [ 
	^ matrix
]

{ #category : #'private - accessing' }
MField >> matrix: anObject [

	matrix := anObject.
	matrix indicesDo: [ :line :column |
		(matrix at: line at: column) position: line @ column ].
]

{ #category : #'player api' }
MField >> mineCount [
	^ (self boxesSelect: #isMineBox) size
]

{ #category : #'box api' }
MField >> mineCountAroundBoxAt: x at: y [
	^ (self boxesAroundBoxAt: x at: y collect: [ :box | 
		box isMineBox
			ifTrue: [ 1 ]
			ifFalse: [ 0 ] ]) sum
]

{ #category : #'box api' }
MField >> playerLoose [

	playerWon := false.
	gameEnded := true.
	self announcer announce: (MPlayerLoose field: self).

	Transcript
		clear;
		show: 'Defaite';
		open.

	self boxesDoWithIndices: [ :aBox :i :j |
		aBox announcer announce:
			(MBoxClickAndReplaceAnnouncement replaceBy: (MClicked new position: i@j)) ]
]

{ #category : #accessing }
MField >> playerLost [
	^ self playerWon not
]

{ #category : #'box api' }
MField >> playerWin [
	gameEnded ifTrue: [ ^self ].
	playerWon := true.
	gameEnded := true.
	self announcer announce: (MPlayerWin field: self).
	Transcript
		clear;
		show: 'Victoire';
		open.
	self boxesDoWithIndices: [ :aBox :i :j |
		aBox announcer announce:
			(MBoxClickAndReplaceAnnouncement replaceBy:
				 (MClicked new position: i @ j)) ]
]

{ #category : #accessing }
MField >> playerWon [
	^ playerWon
]

{ #category : #printing }
MField >> printOn: aStream [
	aStream
		<< self width asString;
		<< self height asString;
		<< Smalltalk os lineEnding.
	1 to: self width do: [ :i |
		1 to: self height do: [ :j |
			|box|
			box := self boxAt: i at: j.
			box printOn: aStream ].
		i = self width ifFalse: [ aStream	<< Smalltalk os lineEnding ] ]
]

{ #category : #'player api' }
MField >> readableTextualRepresentation [
	| visitor |
	visitor := MFieldPrinter new.
	self accept: visitor.
	^ visitor streamContents
]

{ #category : #'box api' }
MField >> replaceBoxAtRow: x column: y by: aMBox [
	matrix at: x at: y put: aMBox
]

{ #category : #accessing }
MField >> rightFlagCountAroundAt: x at: y [ 
	^ (self flagCountAroundBoxAt: x at: y) = (self mineCountAroundBoxAt: x at: y)
]

{ #category : #accessing }
MField >> round [
	^ round
]

{ #category : #accessing }
MField >> width [
	^ matrix numberOfColumns
]
