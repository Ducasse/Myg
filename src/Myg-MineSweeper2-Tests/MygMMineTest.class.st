"
A MMineTest is a test class for testing the behavior of MMine
"
Class {
	#name : #MygMMineTest,
	#superclass : #MygMAbstractTest,
	#category : #'Myg-MineSweeper2-Tests'
}

{ #category : #'tests-clicking' }
MygMMineTest >> testClickInAtAt [

	self deny: field gameEnded.
	(field boxAt: 1 at: 3) click.
	self assert: field gameEnded
]
