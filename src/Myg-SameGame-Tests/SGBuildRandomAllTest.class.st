"
A SGBuildRandomAllTest is a test class for testing the behavior of SGBuildRandomAll
"
Class {
	#name : 'SGBuildRandomAllTest',
	#superclass : 'TestCase',
	#instVars : [
		'strategy'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGBuildRandomAllTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	strategy := SGBuildRandomAll new.
]

{ #category : 'tests' }
SGBuildRandomAllTest >> testDitributionUseAllStatesAndIsWeighted [

	| expectedSize |
	expectedSize := SGBasicState subclasses size * strategy basicsWeight + (SGSpecialState subclasses size * strategy specialsWeight).
	self assert: strategy distribution size equals: expectedSize
]
