"
A MClickedTest is a test class for testing the behavior of MClicked
"
Class {
	#name : #MygMClickedTest,
	#superclass : #MygMAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper2-Tests'
}

{ #category : #running }
MygMClickedTest >> setUp [

	field := MygMBoard createWithMatrix: self matrixForField
]

{ #category : #'tests-clicking' }
MygMClickedTest >> testClickInAtAt [

	|box|
	box := field boxAt: 1 at: 1.
	self assert: box class equals: MygMUnknown.
	box click.
	self assert: (field boxAt: 1 at: 1) class equals: MygMClicked
]
