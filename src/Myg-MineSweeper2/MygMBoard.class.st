"
I am a mine field.

I you want to play with me, have a look at 'player api' protocol.

You may want to subscribe to my announcer to react to what is going on during the game. Access it using #announcer accessor. See MFieldAnnouncement to know what I can announce.
"
Class {
	#name : #MygMBoard,
	#superclass : #MygBoard,
	#instVars : [
		'round',
		'gameEnded',
		'playerWon',
		'announcer',
		'magnifier'
	],
	#category : #'Myg-MineSweeper2-Model'
}

{ #category : #'instance creation' }
MygMBoard class >> createWithMatrix: aMatrix [

	^ self new
		  configureGrid: aMatrix;
		  yourself
]

{ #category : #'test ressources' }
MygMBoard class >> matrixForField [

	^ self createWithMatrix: ((CTNewArray2D
			    width: 5
			    height: 5
			    tabulate: [ :column :row | MygMBox unknown ])
			   at: 1 @ 3 put: MygMBox mine;
			at: 1 @ 5 put: MygMBox mine;
			   at: 2 @ 3 put: MygMBox mine;
			   at: 3 @ 1 put: MygMBox mine;
			   at: 3 @ 2 put: MygMBox mine;
			   at: 3 @ 3 put: MygMBox mine;
			   at: 4 @ 4 put: MygMBox mine;
			   at: 5 @ 4 put: MygMBox mine;
			   yourself)
]

{ #category : #'instance creation' }
MygMBoard class >> matrixTest5x5 [

	^ self createWithMatrix:
		  (CTNewArray2D width: 5 height: 5 tabulate: [ :column :row |
			   MygMBox randomCase ])
]

{ #category : #visiting }
MygMBoard >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMField: self
]

{ #category : #accessing }
MygMBoard >> announcer [
	^ announcer
]

{ #category : #enumerating }
MygMBoard >> anyBoxSatisfy: aBlock [

	^ grid anySatisfy: aBlock
]

{ #category : #accessing }
MygMBoard >> boxAt: x at: y [

	^ grid at: x @ y
]

{ #category : #enumerating2 }
MygMBoard >> boxesAroundBox: aBox anySatisfy: aBlock [

	self
		boxesAroundBox: aBox
		do: [ :box | (aBlock value: box) ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #enumerating2 }
MygMBoard >> boxesAroundBox: aBox collect: aBlock [

	| collected |
	collected := OrderedCollection new.
	self
		boxesAroundBox: aBox
		do: [ :box | collected add: (aBlock value: box) ].
	^ collected
]

{ #category : #enumerating2 }
MygMBoard >> boxesAroundBox: aBox do: aBlock [

	self
		boxesAroundBox: aBox
		doWithIndexes: [ :box :i :j | aBlock value: box ]
]

{ #category : #enumerating2 }
MygMBoard >> boxesAroundBox: aBox doWithIndexes: aBlock [

	|x y|
	x := aBox position x.
	y := aBox position y.
	^ (x - 1 to: x + 1) collect: [ :i |
		  (y - 1 to: y + 1) collect: [ :j |
			  ((i = x and: [ j = y ]) or: [
				   i < 1 or: [
					   j < 1 or: [ i > self height or: [ j > self width ] ] ] ])
				  ifFalse: [
				  aBlock value: (self boxAt: i at: j) value: i value: j ] ] ]
]

{ #category : #enumerating2 }
MygMBoard >> boxesAroundBox: aBox select: aBlock [

	| collected |
	collected := OrderedCollection new.
	self
		boxesAroundBox: aBox
		do: [ :box | (aBlock value: box) ifTrue: [ collected add: box ] ].
	^ collected
]

{ #category : #enumerating }
MygMBoard >> boxesDoWithIndices: aBlock [
	1 to: self height do: [ :i |
		1 to: self width do: [ :j |
			aBlock value: (self boxAt: i at: j) value: i value: j ] ]
]

{ #category : #enumerating }
MygMBoard >> boxesSelect: aBlock [
	
	| selected |
	selected := OrderedCollection new.
	grid do: [ :box | (aBlock value: box) ifTrue: [ selected add: box ] ].
	^ selected
]

{ #category : #'player api' }
MygMBoard >> clickOnBox: aBox [

	| x y |
	gameEnded ifTrue: [ ^ self ].
	x := aBox position x.
	y := aBox position y.
	(self boxAt: x at: y) click
]

{ #category : #'box api' }
MygMBoard >> flagCountAroundBox: aBox [

	^ (self boxesAroundBox: aBox collect: [ :box |
		   box isFlagged
			   ifTrue: [ 1 ]
			   ifFalse: [ 0 ] ]) sum
]

{ #category : #accessing }
MygMBoard >> gameEnded [
	^ gameEnded
]

{ #category : #testing }
MygMBoard >> hasClickedBoxAroundBox: aBox [

	^ self boxesAroundBox: aBox anySatisfy: #isClickedBox
]

{ #category : #testing }
MygMBoard >> hasMineBoxAroundBox: aBox [

	^ self boxesAroundBox: aBox anySatisfy: #isMineBox 
]

{ #category : #testing }
MygMBoard >> hasUnknownBox [
	^ self anyBoxSatisfy: #isUnknownBox
]

{ #category : #accessing }
MygMBoard >> height [

	^ grid height
]

{ #category : #'box api' }
MygMBoard >> incrementRound [
	round := round + 1
]

{ #category : #initialization }
MygMBoard >> initialize [
	super initialize.
	round := 0.
	announcer := Announcer new.
	gameEnded := false.
	playerWon := false
]

{ #category : #accessing }
MygMBoard >> magnifier [ 
	^ magnifier
]

{ #category : #accessing }
MygMBoard >> magnifier: aNumber [
	magnifier := aNumber 
]

{ #category : #'player api' }
MygMBoard >> mineCount [
	^ (self boxesSelect: #isMineBox) size
]

{ #category : #'box api' }
MygMBoard >> mineCountAroundBox: aBox [

	^ (self boxesAroundBox: aBox collect: [ :box |
		   box isMineBox
			   ifTrue: [ 1 ]
			   ifFalse: [ 0 ] ]) sum
]

{ #category : #'box api' }
MygMBoard >> playerLoose [

	playerWon := false.
	gameEnded := true.
	self revealBoard.
	
]

{ #category : #accessing }
MygMBoard >> playerLost [
	^ self playerWon not
]

{ #category : #'box api' }
MygMBoard >> playerWin [

	gameEnded ifTrue: [ ^ self ].
	playerWon := true.
	gameEnded := true.
	self revealBoard
]

{ #category : #accessing }
MygMBoard >> playerWon [
	^ playerWon
]

{ #category : #printing }
MygMBoard >> printOn: aStream [
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

{ #category : #'box api' }
MygMBoard >> replaceBox: aBox by: aNewBox [

	| x y |
	x := aBox position x.
	y := aBox position y.
	grid at: x @ y put: aNewBox
]

{ #category : #'as yet unclassified' }
MygMBoard >> revealBoard [

	self boxesDoWithIndices: [ :aBox :i :j |
		| newBox |
		newBox := MygMClicked new
			          position: i @ j;
			          board: self.
		aBox isUnknownBox ifTrue: [
			self replaceBox: aBox by: newBox].
			aBox announcer announce:
				(MygMBoxClickAndReplaceAnnouncement replaceBy: newBox)]
]

{ #category : #accessing }
MygMBoard >> rightFlagCountAroundBox: aBox [

	^ (self flagCountAroundBox: aBox)
	  = (self mineCountAroundBox: aBox)
]

{ #category : #accessing }
MygMBoard >> round [
	^ round
]

{ #category : #accessing }
MygMBoard >> width [

	^ grid width
]
