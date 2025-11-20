"
A SGStateRegistryTest is a test class for testing the behavior of SGStateRegistry
"
Class {
	#name : 'SGStateRegistryTest',
	#superclass : 'TestCase',
	#instVars : [
		'registry'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGStateRegistryTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	registry := SGStateRegistry new.
]

{ #category : 'tests' }
SGStateRegistryTest >> testAllBasicsStateAreRegistered [

	self assertCollection: registry basics hasSameElements: SGBasicState subclasses 
]

{ #category : 'tests' }
SGStateRegistryTest >> testAllSpecialsStateAreRegistered [

	self assertCollection: registry specials hasSameElements: SGSpecialState subclasses 
]
