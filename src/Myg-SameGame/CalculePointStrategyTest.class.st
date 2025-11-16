Class {
	#name : 'CalculePointStrategyTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Model-Tests',
	#package : 'Myg-SameGame',
	#tag : 'Model-Tests'
}

{ #category : 'tests' }
CalculePointStrategyTest >> testRedDoublePointStrat [

	| hitlist score strat |
	strat := SGCalculeScoreRedDouble new.
	hitlist := OrderedCollection new.
	hitlist
		add: (SGBox new state:SGRedState uniqueInstance );
		add: (SGBox new state:SGRedState uniqueInstance);
		add: (SGBox new state:SGGreenState uniqueInstance).
	score := strat calculePoint: hitlist.
	self assert: score equals: 25
]
