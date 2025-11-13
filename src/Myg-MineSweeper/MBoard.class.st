"
I am a mine field.

I you want to play with me, have a look at 'player api' protocol.

You may want to subscribe to my announcer to react to what is going on during the game. Access it using #announcer accessor. See MFieldAnnouncement to know what I can announce.
"
Class {
	#name : 'MBoard',
	#superclass : 'MygBoard',
	#instVars : [
		'gameEnded',
		'announcer',
		'magnifier'
	],
	#category : 'Myg-MineSweeper-Model',
	#package : 'Myg-MineSweeper',
	#tag : 'Model'
}

{ #category : 'instance creation' }
MBoard class >> createWithMatrix: aMatrix [

	^ self new
		  configureGrid: aMatrix;
		  yourself
]

{ #category : 'test ressources' }
MBoard class >> matrixForField [

	^ self createWithMatrix: ((CTNewArray2D
			    width: 5
			    height: 5
			    tabulate: [ :column :row | MBox safe ])
			   at: 1 @ 3 put: MBox mine;
			at: 1 @ 5 put: MBox mine;
			   at: 2 @ 3 put: MBox mine;
			   at: 3 @ 1 put: MBox mine;
			   at: 3 @ 2 put: MBox mine;
			   at: 3 @ 3 put: MBox mine;
			   at: 4 @ 4 put: MBox mine;
			   at: 5 @ 4 put: MBox mine;
			   yourself)
]

{ #category : 'instance creation' }
MBoard class >> matrixTest5x5 [

	^ self createWithMatrix:
		  (CTNewArray2D width: 5 height: 5 tabulate: [ :column :row |
			   MBox randomCase ])
]

{ #category : 'accessing' }
MBoard >> announcer [
	^ announcer
]

{ #category : 'enumerating' }
MBoard >> anyBoxSatisfy: aBlock [

	^ grid anySatisfy: aBlock
]

{ #category : 'accessing' }
MBoard >> boxAt: x at: y [

	^ grid at: x @ y
]

{ #category : 'enumerating2' }
MBoard >> boxesAroundBox: aBox anySatisfy: aBlock [

	self
		boxesAroundBox: aBox
		do: [ :box | (aBlock value: box) ifTrue: [ ^ true ] ].
	^ false
]

{ #category : 'enumerating2' }
MBoard >> boxesAroundBox: aBox collect: aBlock [

	| collected |
	collected := OrderedCollection new.
	self
		boxesAroundBox: aBox
		do: [ :box | collected add: (aBlock value: box) ].
	^ collected
]

{ #category : 'enumerating2' }
MBoard >> boxesAroundBox: aBox do: aBlock [

	self
		boxesAroundBox: aBox
		doWithIndexes: [ :box :i :j | aBlock value: box ]
]

{ #category : 'enumerating2' }
MBoard >> boxesAroundBox: aBox doWithIndexes: aBlock [

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

{ #category : 'enumerating2' }
MBoard >> boxesAroundBox: aBox select: aBlock [

	| collected |
	collected := OrderedCollection new.
	self
		boxesAroundBox: aBox
		do: [ :box | (aBlock value: box) ifTrue: [ collected add: box ] ].
	^ collected
]

{ #category : 'enumerating' }
MBoard >> boxesDoWithIndices: aBlock [
	1 to: self height do: [ :i |
		1 to: self width do: [ :j |
			aBlock value: (self boxAt: i at: j) value: i value: j ] ]
]

{ #category : 'enumerating' }
MBoard >> boxesSelect: aBlock [
	
	| selected |
	selected := OrderedCollection new.
	grid do: [ :box | (aBlock value: box) ifTrue: [ selected add: box ] ].
	^ selected
]

{ #category : 'player api' }
MBoard >> clickOnBox: aBox [

	| x y |
	gameEnded ifTrue: [ ^ self ].
	x := aBox position x.
	y := aBox position y.
	(self boxAt: x at: y) click
]

{ #category : 'box api' }
MBoard >> flagCountAroundBox: aBox [

	^ (self boxesAroundBox: aBox collect: [ :box |
		   box isFlagged
			   ifTrue: [ 1 ]
			   ifFalse: [ 0 ] ]) sum
]

{ #category : 'accessing' }
MBoard >> gameEnded [
	^ gameEnded
]

{ #category : 'testing' }
MBoard >> hasBeenCleared [

	^ (self boxesSelect: #isSafeBox) allSatisfy: #isClicked
]

{ #category : 'testing' }
MBoard >> hasClickedBoxAroundBox: aBox [

	^ self boxesAroundBox: aBox anySatisfy: #isClicked
]

{ #category : 'testing' }
MBoard >> hasMineBoxAroundBox: aBox [

	^ self boxesAroundBox: aBox anySatisfy: #isMineBox 
]

{ #category : 'accessing' }
MBoard >> height [

	^ grid height
]

{ #category : 'initialization' }
MBoard >> initialize [
	super initialize.
	announcer := Announcer new.
	gameEnded := false.
]

{ #category : 'accessing' }
MBoard >> magnifier [ 
	^ magnifier
]

{ #category : 'accessing' }
MBoard >> magnifier: aNumber [
	magnifier := aNumber 
]

{ #category : 'player api' }
MBoard >> mineCount [
	^ (self boxesSelect: #isMineBox) size
]

{ #category : 'box api' }
MBoard >> mineCountAroundBox: aBox [

	^ (self boxesAroundBox: aBox collect: [ :box |
		   box isMineBox
			   ifTrue: [ 1 ]
			   ifFalse: [ 0 ] ]) sum
]

{ #category : 'box api' }
MBoard >> playerLoose [

	gameEnded := true.
	self revealBoard.
	
]

{ #category : 'box api' }
MBoard >> playerWin [

	gameEnded ifTrue: [ ^ self ].
	gameEnded := true.
	self revealBoard
]

{ #category : 'printing' }
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

{ #category : 'box api' }
MBoard >> replaceBox: aBox by: aNewBox [

	| x y |
	x := aBox position x.
	y := aBox position y.
	grid at: x @ y put: aNewBox
]

{ #category : 'as yet unclassified' }
MBoard >> revealBoard [

	self boxesDoWithIndices: [ :aBox :i :j |
		aBox isSafeBox
			ifTrue: [ aBox announcer announce: MBoxClickedAnnouncement new ]
			ifFalse: [ aBox announcer announce: MBoxExplosionAnnouncement new ] ]
]

{ #category : 'accessing' }
MBoard >> rightFlagCountAroundBox: aBox [

	^ (self flagCountAroundBox: aBox)
	  = (self mineCountAroundBox: aBox)
]

{ #category : 'accessing' }
MBoard >> width [

	^ grid width
]
