"
I represent a 2 dimensional space of elements. In fact, internally I maintain a list of elements so that I can simply push and pop elements when the movable elements are moving. An alternate strategy would be to always keep the currently occupied one to restore after. 
It looks like a space tradeoff and we do not have space problem. 

Todo:
- revisit position (rename position into basic + position with update)
- game logic
-- all on target

Extensions
- Make sure that we cannot push multiple boxes.
- Count the number of move.
- Support game replay or revert.
"
Class {
	#name : 'MygSkBoard',
	#superclass : 'MygBoard',
	#instVars : [
		'player',
		'boxes',
		'ended',
		'gameManager'
	],
	#category : 'Myg-Sokoban-Model',
	#package : 'Myg-Sokoban',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
MygSkBoard class >> boardTest [

	^ self createWithBoard: (MygSkGameManager importFromString: self microban1TestBoard).
]

{ #category : 'initialization' }
MygSkBoard class >> createWithBoard: aCTNewArray2D [

	^ self new
		  configureGrid: aCTNewArray2D;
		  yourself
]

{ #category : 'initialization' }
MygSkBoard class >> createWithBoard: aCTNewArray2D managedBy: aSkGameManager [

	^ (self createWithBoard: aCTNewArray2D)
		  gameManager: aSkGameManager;
		  yourself
]

{ #category : 'example' }
MygSkBoard class >> example [ 
	<sampleInstance>
	
	^ MygLevelImporter fromString: '    #####
    #   #
    #$  #
  ###  $##
  #  $ $ #
### # ## #   ######
#   # ## #####  ..#
# $  $          ..#
##### ### #@##  ..#
    #     #########
    #######' fromPackage: self package
]

{ #category : 'mazes' }
MygSkBoard class >> microban1TestBoard [
	"sasquatch/sokoban/microban.html"

	^ '####
# .#
#  ###
#*@  #
#  $ #
#  ###
####'
]

{ #category : 'printing' }
MygSkBoard >> asciiString [ 

	^ String streamContents: [ :st |
		self printOn: st ]	

]

{ #category : 'low level access' }
MygSkBoard >> at: anInteger at: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : 'low level access' }
MygSkBoard >> at: anInteger at: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : 'low level access' }
MygSkBoard >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : 'low level access' }
MygSkBoard >> atColumn: anInteger atRow: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : 'accessing' }
MygSkBoard >> atPosition: aCpPositionable [ 
	^ (grid at: aCpPositionable x @ aCpPositionable y)
]

{ #category : 'accessing' }
MygSkBoard >> boxes [ 

	^ boxes
]

{ #category : 'accessing' }
MygSkBoard >> boxes: aCollection [

	boxes := aCollection 
]

{ #category : 'accessing' }
MygSkBoard >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
	self
		setBoxes;
		setPlayer
]

{ #category : 'building' }
MygSkBoard >> do: aBlock [

	grid do: aBlock
]

{ #category : 'ending' }
MygSkBoard >> endGame [

	ended ifTrue: [ ^ self ].
	ended := true.
	gameManager ifNotNil: [ gameManager registerLevel ]
]

{ #category : 'accessing' }
MygSkBoard >> ended [ 

	^ ended 
]

{ #category : 'accessing' }
MygSkBoard >> gameManager [ 
	
	^ gameManager 
]

{ #category : 'accessing' }
MygSkBoard >> gameManager: aSkGameManager [

	gameManager:= aSkGameManager 
]

{ #category : 'accessing' }
MygSkBoard >> height [
	^ grid height
]

{ #category : 'initialization' }
MygSkBoard >> initialize [

	super initialize.
	ended := false.
	boxes := OrderedCollection new
]

{ #category : 'testing' }
MygSkBoard >> isFinished [

	^ self boxes allSatisfy: [ :each | each background isTarget ]
]

{ #category : 'move' }
MygSkBoard >> moveSteps: aCollectionOfDirection [

	aCollectionOfDirection do: [ :each | player move: each ]
]

{ #category : 'accessing' }
MygSkBoard >> player [
	^ player
]

{ #category : 'printing' }
MygSkBoard >> printOn: aStream [

	(1 to: grid height)
		do: [ :rowNumber |
			1 to: grid width do: [ :columnNumber |
				| el elClass |
				el := self atColumn: columnNumber atRow: rowNumber.
				elClass := (el class inheritsFrom: MygSkMovable)
					           ifFalse: [ el class ]
					           ifTrue: [
						           el background class = MygSkGround
							           ifTrue: [ el class ]
							           ifFalse: [
							           self class environment at:
								           (el class asString , 'OnTarget') asSymbol] ].
				aStream nextPut: elClass textualMapCharacter ] ]
		separatedBy: [ aStream cr ]
]

{ #category : 'initialization' }
MygSkBoard >> reset [

	self gameManager launchAgain
]

{ #category : 'initialization' }
MygSkBoard >> setBoxes [

	self boxes: (grid select: [ :e | e class = MygSkBox ]).
]

{ #category : 'initialization' }
MygSkBoard >> setPlayer [

	player := grid contents detect: #isPlayer
]

{ #category : 'move' }
MygSkBoard >> updatePositionOf: aSkMovable from: previousPosition [
	"Put back the previous position element."

	self
		atColumn: previousPosition x
		atRow: previousPosition y
		put: aSkMovable background.
	"put the current position element as previous background of the moving element."
	aSkMovable background:
		(self atColumn: aSkMovable position x atRow: aSkMovable position y).
	"finally place the moving element to its new location"
	self
		atColumn: aSkMovable position x
		atRow: aSkMovable position y
		put: aSkMovable.
	self isFinished ifTrue: [ self endGame ]
]

{ #category : 'accessing' }
MygSkBoard >> width [
	^ grid width
]
