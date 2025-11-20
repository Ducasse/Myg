Class {
	#name : 'SGBuildRandomAll',
	#superclass : 'SGBuildBoxStrategy',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGBuildRandomAll >> basicsWeight [
	^ 5
]

{ #category : 'as yet unclassified' }
SGBuildRandomAll >> specialsWeight [
	^ 1
]

{ #category : 'as yet unclassified' }
SGBuildRandomAll >> updateDistribution [

	distribution := OrderedCollection new.
	registry basics do: [ :each | distribution add: each withOccurrences: self basicsWeight ].
	registry specials do: [ :each | distribution add: each withOccurrences: self specialsWeight ]
]
