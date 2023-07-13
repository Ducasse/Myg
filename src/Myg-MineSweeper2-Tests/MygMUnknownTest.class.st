"
A MEmptyTest is a test class for testing the behavior of MEmpty
"
Class {
	#name : #MygMUnknownTest,
	#superclass : #MygMAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper2-Tests'
}

{ #category : #running }
MygMUnknownTest >> setUp [

	field := MygMBoard createWithMatrix: self matrixForField
]

{ #category : #'tests-clicking' }
MygMUnknownTest >> testClickInAtAtProduceAPropagateTONeighbour [

	field clickOnBox: (field boxAt: 1 at: 1).
	self
		assert: (field boxAt: 1 at: 1) isClickedBox;
		assert: (field boxAt: 1 at: 2) isClickedBox;
		assert: (field boxAt: 2 at: 1) isClickedBox;
		assert: (field boxAt: 2 at: 2) isClickedBox
]
