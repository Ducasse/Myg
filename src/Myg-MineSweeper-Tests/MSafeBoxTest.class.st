"
A MEmptyTest is a test class for testing the behavior of MEmpty
"
Class {
	#name : #MSafeBoxTest,
	#superclass : #MAbstractTest,
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #'tests-clicking' }
MSafeBoxTest >> testClickInAtAtProduceAPropagateTONeighbour [

	field clickOnBox: (field boxAt: 1 at: 1).
	self
		assert: (field boxAt: 1 at: 1) isClicked;
		assert: (field boxAt: 1 at: 2) isClicked;
		assert: (field boxAt: 2 at: 1) isClicked;
		assert: (field boxAt: 2 at: 2) isClicked
]
