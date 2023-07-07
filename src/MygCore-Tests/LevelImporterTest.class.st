Class {
	#name : #LevelImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'importer'
	],
	#category : #'MygCore-Tests'
}

{ #category : #accessing }
LevelImporterTest >> importer [ 
	^ importer
]

{ #category : #running }
LevelImporterTest >> setUp [

	| dictionary |
	super setUp.
	dictionary := self setUpDictionary.
	importer := LevelImporter new fillBindingDictionary: dictionary.
]

{ #category : #running }
LevelImporterTest >> setUpDictionary [

	| dictionary |
	dictionary := Dictionary new
		              at: $a put: Array;
		              at: $s put: Set;
		              at: $o put: OrderedCollection;
		              yourself.
	^ dictionary
]

{ #category : #tests }
LevelImporterTest >> testBuildArrayFor [

	| string res |
	string := '01
__'.

	res := self importer buildArrayFor: string.

	self assert: res contents equals: #( $0 $1 $_ $_ )
]

{ #category : #tests }
LevelImporterTest >> testBuildMapFor [

	| string res |
	string := 'aa
so'.

	res := self importer buildMapFor: string.

	self assert: (res contents at: 1) class equals: Array.
	self assert: (res contents at: 2) class equals: Array.
	self assert: (res contents at: 3) class equals: Set.
	self assert: (res contents at: 4) class equals: OrderedCollection
]
