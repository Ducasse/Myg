"
I am a mine field.

I you want to play with me, have a look at 'player api' protocol.

You may want to subscribe to my announcer to react to what is going on during the game. Access it using #announcer accessor. See MFieldAnnouncement to know what I can announce.
"
Class {
	#name : #MBoard,
	#superclass : #MygBoard,
	#instVars : [
		'matrix',
		'round',
		'gameEnded',
		'playerWon',
		'announcer',
		'magnifier'
	],
	#category : #'Myg-MineSweeper-Model'
}

{ #category : #'instance creation' }
MBoard class >> createWithMatrix: aMatrix [

	^ self new
		  matrix: aMatrix;
		  yourself
]

{ #category : #'test ressources' }
MBoard class >> matrixForField [

	^ self createWithMatrix: ((Array2D rows: 5 columns: 5)
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
MBoard class >> matrixTest5x5 [

	^ self createWithMatrix:
		  ((Array2D rows: 5 columns: 5) collect: [ :e | MBox randomCase ])
]

{ #category : #'instance creation' }
MBoard class >> width: width height: height [
	^ self matrix: ((Matrix rows: height columns: width) collect: [ :e | MBox randomCase ])
]

{ #category : #visiting }
MBoard >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMField: self
]

{ #category : #accessing }
MBoard >> announcer [
	^ announcer
]

{ #category : #enumerating }
MBoard >> anyBoxSatisfy: aBlock [
	^ matrix anySatisfy: aBlock
]

{ #category : #accessing }
MBoard >> boxAt: x at: y [
	^ matrix at: x at: y
]

{ #category : #enumerating }
MBoard >> boxesAroundBoxAt: x at: y anySatisfy: aBlock [
	self boxesAroundBoxAt: x at: y do: [ :box |
		(aBlock value: box)
			ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #enumerating }
MBoard >> boxesAroundBoxAt: x at: y collect: aBlock [
	| collected |
	collected := OrderedCollection new.
	self boxesAroundBoxAt: x at: y do: [ :box |
		collected add: (aBlock value: box) ].
	^ collected
]

{ #category : #enumerating }
MBoard >> boxesAroundBoxAt: x at: y do: aBlock [
	self boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
		aBlock value: box ]
]

{ #category : #enumerating }
MBoard >> boxesAroundBoxAt: x at: y doWithIndexes: aBlock [
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
MBoard >> boxesAroundBoxAt: x at: y select: aBlock [
	| collected |
	collected := OrderedCollection new.
	self boxesAroundBoxAt: x at: y do: [ :box |
		(aBlock value: box)
			ifTrue: [ collected add: box ] ].
	^ collected
]

{ #category : #enumerating }
MBoard >> boxesDoWithIndices: aBlock [
	1 to: self height do: [ :i |
		1 to: self width do: [ :j |
			aBlock value: (self boxAt: i at: j) value: i value: j ] ]
]

{ #category : #enumerating }
MBoard >> boxesSelect: aBlock [
	| selected |
	selected := OrderedCollection new.
	matrix do: [ :box |
		(aBlock value: box)
			ifTrue: [ selected add: box ] ].
	^ selected
]

{ #category : #'player api' }
MBoard >> clickOnBoxAt: x at: y [
	gameEnded ifTrue: [ ^ self ].
	(self boxAt: x at: y) clickIn: self at: x at: y
]

{ #category : #'debug api' }
MBoard >> debugTextualRepresentation [
	| visitor |
	visitor := MDebugFieldPrinter new.
	self accept: visitor.
	^ visitor streamContents
]

{ #category : #'box api' }
MBoard >> fieldUpdate [
	self announcer announce: (MFieldUpdate field: self)
]

{ #category : #'box api' }
MBoard >> flagCountAroundBoxAt: x at: y [
	^ (self boxesAroundBoxAt: x at: y collect: [ :box | 
		box isFlagged
			ifTrue: [ 1 ]
			ifFalse: [ 0 ] ]) sum
]

{ #category : #accessing }
MBoard >> gameEnded [
	^ gameEnded
]

{ #category : #testing }
MBoard >> hasClickedBoxAroundBoxAt: x at: y [
	^ self boxesAroundBoxAt: x at: y anySatisfy: #isClickedBox
]

{ #category : #testing }
MBoard >> hasMineBoxAroundBoxAt: x at: y [
	^ (self mineCountAroundBoxAt: x at: y) > 0
]

{ #category : #testing }
MBoard >> hasUnknownBox [
	^ self anyBoxSatisfy: #isUnknownBox
]

{ #category : #accessing }
MBoard >> height [
	^ matrix numberOfRows
]

{ #category : #'box api' }
MBoard >> incrementRound [
	round := round + 1
]

{ #category : #initialization }
MBoard >> initialize [
	super initialize.
	round := 0.
	announcer := Announcer new.
	gameEnded := false.
	playerWon := false
]

{ #category : #accessing }
MBoard >> magnifier [ 
	^ magnifier
]

{ #category : #accessing }
MBoard >> magnifier: aNumber [
	magnifier := aNumber 
]

{ #category : #accessing }
MBoard >> matrix [ 
	^ matrix
]

{ #category : #'private - accessing' }
MBoard >> matrix: anObject [

	matrix := anObject.
	matrix indicesDo: [ :line :column |
		(matrix at: line at: column) position: line @ column ].
]

{ #category : #'player api' }
MBoard >> mineCount [
	^ (self boxesSelect: #isMineBox) size
]

{ #category : #'box api' }
MBoard >> mineCountAroundBoxAt: x at: y [
	^ (self boxesAroundBoxAt: x at: y collect: [ :box | 
		box isMineBox
			ifTrue: [ 1 ]
			ifFalse: [ 0 ] ]) sum
]

{ #category : #'box api' }
MBoard >> playerLoose [

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
MBoard >> playerLost [
	^ self playerWon not
]

{ #category : #'box api' }
MBoard >> playerWin [
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
MBoard >> playerWon [
	^ playerWon
]

{ #category : #printing }
MBoard >> printOn: aStream [
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
MBoard >> readableTextualRepresentation [
	| visitor |
	visitor := MFieldPrinter new.
	self accept: visitor.
	^ visitor streamContents
]

{ #category : #'box api' }
MBoard >> replaceBoxAtRow: x column: y by: aMBox [
	matrix at: x at: y put: aMBox
]

{ #category : #accessing }
MBoard >> rightFlagCountAroundAt: x at: y [ 
	^ (self flagCountAroundBoxAt: x at: y) = (self mineCountAroundBoxAt: x at: y)
]

{ #category : #accessing }
MBoard >> round [
	^ round
]

{ #category : #accessing }
MBoard >> width [
	^ matrix numberOfColumns
]
