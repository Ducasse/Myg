"
A MEmptyTest is a test class for testing the behavior of MEmpty
"
Class {
	#name : #MUnknownTest,
	#superclass : #MAbstractTest,
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #'tests-clicking' }
MUnknownTest >> testClickInAtAtProduceAPropagateTONeighbour [

	field clickOnBox: (field boxAt: 1 at: 1).
	self
		assert: (field boxAt: 1 at: 1) isClickedBox;
		assert: (field boxAt: 1 at: 2) isClickedBox;
		assert: (field boxAt: 2 at: 1) isClickedBox;
		assert: (field boxAt: 2 at: 2) isClickedBox
]
