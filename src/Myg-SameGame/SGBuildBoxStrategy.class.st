Class {
	#name : 'SGBuildBoxStrategy',
	#superclass : 'Object',
	#instVars : [
		'registry',
		'distribution'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGBuildBoxStrategy >> buildBox [
	
	^ SGBox withState: distribution atRandom uniqueInstance 
	
	
]

{ #category : 'as yet unclassified' }
SGBuildBoxStrategy >> distribution [

	^ distribution
]

{ #category : 'initialization' }
SGBuildBoxStrategy >> initialize [

	registry := SGStateRegistry new.
	self updateDistribution
]

{ #category : 'as yet unclassified' }
SGBuildBoxStrategy >> updateDistribution [
	
	self subclassResponsibility 
]
