"
A MClickedTest is a test class for testing the behavior of MClicked
"
Class {
	#name : #MygMClickedTest,
	#superclass : #MygMAbstractTest,
	#category : #'Myg-MineSweeper2-Tests'
}

{ #category : #'tests-clicking' }
MygMClickedTest >> testClickInAtAt [

	| box newBox|
	box := field boxAt: 1 at: 1.
	self assert: box class equals: MygMUnknown.
	box click.
	newBox := field boxAt: 1 at: 1.
	self assert: newBox class equals: MygMClicked.
	newBox click.
	self assert: newBox class equals: MygMClicked
]
