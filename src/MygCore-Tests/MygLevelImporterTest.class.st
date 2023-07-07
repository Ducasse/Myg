Class {
	#name : #MygLevelImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'importer'
	],
	#category : #'MygCore-Tests'
}

{ #category : #accessing }
MygLevelImporterTest >> importer [ 
	^ importer
]

{ #category : #running }
MygLevelImporterTest >> setUp [

	| dictionary |
	super setUp.
	dictionary := self setUpDictionary.
	importer := MygLevelImporter new fillBindingDictionary: dictionary.
]

{ #category : #running }
MygLevelImporterTest >> setUpDictionary [

	| dictionary |
	dictionary := Dictionary new
		              at: $a put: Array;
		              at: $s put: Set;
		              at: $o put: OrderedCollection;
		              yourself.
	^ dictionary
]

{ #category : #tests }
MygLevelImporterTest >> testBuildArrayFor [

	| string res |
	string := '01
__'.

	res := self importer buildCharacterArrayFor: string.

	self assert: res contents equals: #( $0 $1 $_ $_ )
]

{ #category : #tests }
MygLevelImporterTest >> testBuildCharacterArrayFor [

	| string res |
	string := '01
__'.

	res := self importer buildCharacterArrayFor: string.
	self assert: res contents equals: #( $0 $1 $_ $_ )
]

{ #category : #tests }
MygLevelImporterTest >> testBuildGridFor [

	| string res |
	string := 'aa
so'.

	res := self importer buildGridFor: string.

	self assert: (res contents at: 1) class equals: Array.
	self assert: (res contents at: 2) class equals: Array.
	self assert: (res contents at: 3) class equals: Set.
	self assert: (res contents at: 4) class equals: OrderedCollection
]
