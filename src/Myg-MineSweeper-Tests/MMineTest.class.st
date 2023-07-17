"
A MMineTest is a test class for testing the behavior of MMine
"
Class {
	#name : #MMineTest,
	#superclass : #MAbstractTest,
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #'tests-clicking' }
MMineTest >> testClickInAtAt [

	self deny: field gameEnded.
	(field boxAt: 1 at: 3) click.
	self assert: field gameEnded
]
