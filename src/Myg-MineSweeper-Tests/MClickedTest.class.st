"
A MClickedTest is a test class for testing the behavior of MClicked
"
Class {
	#name : #MClickedTest,
	#superclass : #MAbstractTest,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #running }
MClickedTest >> setUp [
	field := MField matrix: self matrixForField
]

{ #category : #'tests-clicking' }
MClickedTest >> testClickInAtAt [
	| bool |
	bool := false.
	field clickOnBoxAt: 1 at: 1.
	field announcer when: MFieldUpdate , MPlayerLoose , MPlayerWin do: [ 
		bool := true ].
	(field boxAt: 1 at: 1) clickIn: field at: 1 at: 1.
	self deny: bool
]
