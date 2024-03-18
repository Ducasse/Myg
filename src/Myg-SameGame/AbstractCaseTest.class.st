"
An AbstractCaseTest is a test class for testing the behavior of AbstractCase
"
Class {
	#name : #AbstractCaseTest,
	#superclass : #TestCase,
	#instVars : [
		'abstractCase'
	],
	#category : #'Myg-SameGame-Model-Tests'
}

{ #category : #running }
AbstractCaseTest >> setUp [

	super setUp.
	abstractCase := SGNullState uniqueInstance position: 5 @ 4
]

{ #category : #test }
AbstractCaseTest >> testPosition [

	abstractCase position: 10 @ 10.
	self assert: abstractCase position equals: 10 @ 10
]

{ #category : #test }
AbstractCaseTest >> testX [

	abstractCase x: 10.
	self assert: abstractCase x equals: 10
]

{ #category : #test }
AbstractCaseTest >> testY [

	abstractCase y: 5.
	self assert: abstractCase y equals: 5
]
