Class {
	#name : #MygBoardTest,
	#superclass : #TestCase,
	#category : #'MygCore-Tests'
}

{ #category : #tests }
MygBoardTest >> testConfigureGridIsOK [

	| field |
	field := MygBoard configureGrid:
		         (CTNewArray2D
			          width: 4
			          height: 4
			          tabulate: [ :x :y | MygAbstractBox  new ]).
	self assert: (field grid at: 1 @ 1) board equals: field.
	self assert: (field grid at: 1 @ 1) position equals: 1 @ 1.
	self assert: (field grid at: 2 @ 1) position equals: 2 @ 1
]
