Class {
	#name : 'BuildBoxStrategyTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
BuildBoxStrategyTest >> testMockStrategyIsReallyCalled [ 
	"Actually we dont have a specific strategy without random so i created a mock strat to test it properly"
	|board strat|
	board:=SGBoard new.
	"mocking"
	strat := SGBuildBoxStrategyMock new.
	board buildBoxStrategy: strat.
	board generateGridWidth: 5 height:5.

	self assert: strat count equals: 25.
]
