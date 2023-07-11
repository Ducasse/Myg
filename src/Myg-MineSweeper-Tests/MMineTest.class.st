"
A MMineTest is a test class for testing the behavior of MMine
"
Class {
	#name : #MMineTest,
	#superclass : #MAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #running }
MMineTest >> setUp [
	field := MField matrix: self matrixForField
]

{ #category : #'tests-clicking' }
MMineTest >> testClickInAtAt [
	| loose |
	loose := false.
	field announcer when: MPlayerLoose do: [ loose := true ].
	(field boxAt: 1 at: 3) clickIn: field at: 1 at: 3.
	self assert: loose
]
