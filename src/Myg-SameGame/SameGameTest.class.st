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

	| space board |
	
	space:=SameGame gameWithSize: 20.
	board:= space root children first.
	self assert: board grid height equals: 20.
	
]

{ #category : 'tests' }
SameGameTest >> testSameGameGameWithSizeReturnABoardWithTheExpectedSize [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	| space board |
	
	space:=SameGame gameWithSize: 20.
	board:= space root children first.
	self assert: board grid width equals: 20.
	
]
