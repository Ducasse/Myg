Class {
	#name : 'SameGameTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Model-Tests',
	#package : 'Myg-SameGame',
	#tag : 'Model-Tests'
}

{ #category : 'tests' }
SameGameTest >> testSameGameGameWithHeightReturnABoardWithTheExpectedSize [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| game board |
	game := SameGame gameWithSize: 30.
	board := game children second.
	self assert: board grid height equals: 30
]

{ #category : 'tests' }
SameGameTest >> testSameGameGameWithSizeReturnABoardWithTheExpectedSize [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| game board |
	game := SameGame gameWithSize: 30.
	board := game children second.
	self assert: board grid width equals: 30
]
