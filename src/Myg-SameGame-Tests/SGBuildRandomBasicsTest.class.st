"
A SGBuildRandomBasicsTest is a test class for testing the behavior of SGBuildRandomBasics
"
Class {
	#name : 'SGBuildRandomBasicsTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SGBuildRandomBasicsTest >> testDitributionUseAllBasics [

	self assert: SGBuildRandomBasics new distribution size equals: SGBasicState subclasses size
]
