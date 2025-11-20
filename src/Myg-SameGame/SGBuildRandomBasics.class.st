Class {
	#name : 'SGBuildRandomBasics',
	#superclass : 'SGBuildBoxStrategy',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGBuildRandomBasics >> buildBox [

	^ SGBox withState: registry basics atRandom uniqueInstance
]

{ #category : 'as yet unclassified' }
SGBuildRandomBasics >> updateDistribution [

	distribution := registry basics
]
