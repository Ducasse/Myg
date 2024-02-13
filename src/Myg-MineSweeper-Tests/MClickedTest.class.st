"
A MClickedTest is a test class for testing the behavior of MClicked
"
Class {
	#name : #MClickedTest,
	#superclass : #MAbstractTest,
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #'tests-clicking' }
MClickedTest >> testClickInAtAt [

	| box newBox|
	box := field boxAt: 1 at: 1.
	self assert: box class equals: MSafeBox.
	box click.
	newBox := field boxAt: 1 at: 1.
	self assert: newBox class equals: MClicked.
	newBox click.
	self assert: newBox class equals: MClicked
]
