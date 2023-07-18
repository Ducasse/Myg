"
This class contains tests
"
Class {
	#name : #MygSkStructuralBoardTest,
	#superclass : #TestCase,
	#category : #'Myg-Sokoban-Tests'
}

{ #category : #data }
MygSkStructuralBoardTest >> map1 [ 
	"Pay attention that there is no return on the last line."
^ '    #####
    #   #
    #$  #
  ###  $##
  #  $ $ #
### # ## #   ######
#   # ## #####  ..#
# $  $          ..#
##### ### #@##  ..#
    #     #########
    #######'
]

{ #category : #'tests - building' }
MygSkStructuralBoardTest >> testAtPositionLowLevel [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: self map1
			          fromPackage: MygSkBoard package) collect: [ :each | each configured ]).
	self assert:
		((board atPosition: CpDirection north * board player position)
			 isKindOf: MygSkGround).
	self assert:
		((board atPosition: CpDirection south * board player position)
			 isKindOf: MygSkWall).
	self assert:
		((board atPosition: CpDirection east * board player position)
			 isKindOf: MygSkWall).
	self assert:
		((board atPosition: CpDirection west * board player position)
			 isKindOf: MygSkWall)
]

{ #category : #'tests - building' }
MygSkStructuralBoardTest >> testIsBoxOnTargetPlaygroundCorrectlySet [

	| board box1 box2 |
	board := MygSkBoard createWithBoard: ((MygLevelImporter
			           fromString: '#@ $.*#'
			           fromPackage: MygSkBoard package) collect: [ :each |
			          each configured ]).
	box1 := board atColumn: 4 atRow: 1.
	box2 := board atColumn: 6 atRow: 1 .
	self assert: box1 background class equals: MygSkGround.
	self assert: box2 background class equals: MygSkTarget
]

{ #category : #'tests - building' }
MygSkStructuralBoardTest >> testIsBoxPlaygroundCorrectlySet [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: self map1
			          fromPackage: MygSkBoard package) collect: [ :each | each configured ]).
	board do: [ :anEl |
		(anEl isKindOf: MygSkBox) ifTrue: [
			self assert: anEl position x equals: anEl background position x.
			self assert: anEl position y equals: anEl background position y ] ]
]

{ #category : #'tests - building' }
MygSkStructuralBoardTest >> testIsPalyerOnTargetPlaygroundCorrectlySet [

	| board box |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#+ $#'
			           fromPackage: MygSkBoard package) collect: [ :each |
			          each configured ]).
	box := board atColumn: 2 atRow: 1.
	self assert: box background class equals: MygSkTarget
]

{ #category : #'tests - building' }
MygSkStructuralBoardTest >> testIsPlayerPlaygroundCorrectlySet [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: self map1
			          fromPackage: MygSkBoard package) collect: [ :each | each configured ]).
	self assert: board player position x equals: 12.
	self assert: board player position y equals: 9.

	self assert: board player background position x equals: 12.
	self assert: board player background position y equals: 9
]

{ #category : #'tests - building' }
MygSkStructuralBoardTest >> testPlayerIsAvailable [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: self map1
			          fromPackage: MygSkBoard package) collect: [ :each | each configured ]).
	self assert: board player position x equals: 12.
	self assert: board player position y equals: 9
]

{ #category : #tests }
MygSkStructuralBoardTest >> testPrintOn [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: self map1
			          fromPackage: MygSkBoard package) collect: [ :each | each configured ]).
	self assert: board asciiString equals: '    #####          
    #   #          
    #$  #          
  ###  $##         
  #  $ $ #         
### # ## #   ######
#   # ## #####  ..#
# $  $          ..#
##### ### #@##  ..#
    #     #########
    #######        '
]

{ #category : #tests }
MygSkStructuralBoardTest >> testPrintOnOneLine [

	| board |
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@  #'
			          fromPackage: MygSkBoard package) collect: [ :each | each configured ]).
	self assert: board height equals: 1.
	self assert: board width equals: '#@  #' size.
	self assert: board asciiString equals: '#@  #'
]
