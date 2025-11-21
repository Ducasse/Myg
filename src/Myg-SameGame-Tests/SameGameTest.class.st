Class {
	#name : 'SameGameTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SameGameTest >> testBasicSize [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| game board |
	game := SameGame new graphicGame.
	board := game children second.
	self assert: board grid width equals: 20.
	self assert: board grid height equals: 20
]

{ #category : 'tests' }
SameGameTest >> testCreateGameAndBoardKnownEachOther [

	| gameAndBoard game board |
	gameAndBoard := SameGame new createGameAndBoard.
	game := 
	gameAndBoard first.
	board := gameAndBoard second.
	
	self assert: game  equals: board game.
	self assert: board  equals: game board.
	
	
]

{ #category : 'tests' }
SameGameTest >> testCreateGraphicGameWithoutDefiningHeight [

	| sameGame game board |
	sameGame := SameGame new.
	game := (sameGame width: 10) graphicGame.
	board := game children second.
	
	self assert: board grid height equals: sameGame baseHeight.
	self assert: board grid width equals: 10
]

{ #category : 'tests' }
SameGameTest >> testCreateGraphicGameWithoutDefiningWidth [

	| sameGame game board |
	sameGame := SameGame new.
	game := (sameGame height: 10) graphicGame.
	board := game children second.
	
	self assert: board grid width equals: sameGame baseWidth.
	self assert: board grid height equals: 10

]

{ #category : 'tests' }
SameGameTest >> testGraphicGameUseOurHeight [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| sameGame game board |
	sameGame := SameGame new.
	sameGame width: sameGame baseHeight - 1.
	game := sameGame graphicGame.
	board := game children second.
	self assert: board grid width equals: sameGame baseHeight - 1
]

{ #category : 'tests' }
SameGameTest >> testGraphicGameUseOurWidth [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| sameGame game board |
	sameGame := SameGame new.
	sameGame width: sameGame baseWidth - 1.
	game := sameGame graphicGame.
	board := game children second.
	self assert: board grid width equals: sameGame baseWidth - 1
]
