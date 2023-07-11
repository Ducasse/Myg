"
A MEmptyTest is a test class for testing the behavior of MEmpty
"
Class {
	#name : #MUnknownTest,
	#superclass : #MAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #running }
MUnknownTest >> setUp [

	field := MBoard createWithMatrix: self matrixForField
]

{ #category : #'tests-clicking' }
MUnknownTest >> testClickInAtAtProduceAPropagateTONeighbour [
	field clickOnBoxAt: 1 at: 1.
	self
		assert: (field boxAt: 1 at: 1) isClickedBox;
		assert: (field boxAt: 1 at: 2) isClickedBox;
		assert: (field boxAt: 2 at: 1) isClickedBox;
		assert: (field boxAt: 2 at: 2) isClickedBox
]
