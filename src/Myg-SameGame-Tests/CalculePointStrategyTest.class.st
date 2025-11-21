Class {
	#name : 'CalculePointStrategyTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
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
