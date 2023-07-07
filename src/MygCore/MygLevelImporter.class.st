Class {
	#name : #MygLevelImporter,
	#superclass : #Object,
	#instVars : [
		'lines',
		'characterClassBinding'
	],
	#category : #MygCore
}

{ #category : #'as yet unclassified' }
MygLevelImporter class >> createDictionaryFromPackage: aRPackage [

	| dictionary classes |
	dictionary := Dictionary new.
	classes := aRPackage classes asOrderedCollection select: [ :each |
		           each class selectors anySatisfy: [ :selector |
			           selector = 'textualMapCharacter' ] ].
	classes ifEmpty: [
		self error:
			'No class with #textualMapCharacter method in this package' ].
	classes do: [ :each |

		dictionary at: each textualMapCharacter put: each ].
	^ dictionary
]

{ #category : #'instance creation' }
MygLevelImporter class >> fromString: aString fromPackage: aPackage [

	| dictionary|
	dictionary := self createDictionaryFromPackage: aPackage.
	^ self fromString: aString withDictionary: dictionary
]

{ #category : #'instance creation' }
MygLevelImporter class >> fromString: aString withDictionary: aDictionary [
	|tool|
	tool := self new fillBindingDictionary: aDictionary.
	^ tool buildMapFor: aString
]

{ #category : #'as yet unclassified' }
MygLevelImporter >> buildArrayFor: aString [

	| tmpArray array |
	lines := self splitLines: aString.
	tmpArray := (lines collect: [ :line | 
		|copy|
		copy := line copy.
		line size to: self maxLineLength - 1 do: [ :i | copy := copy, {Character space} ].
		copy asArray ] ) flattened.
	array := CTNewArray2D fromArray: tmpArray width: self maxLineLength.
	^ array
]

{ #category : #private }
MygLevelImporter >> buildMapFor: aString [

	| array2D |
	array2D := self buildArrayFor: aString.
	^ array2D collect: [ :each | (self classFor: each) new ]
]

{ #category : #private }
MygLevelImporter >> classFor: aCharacter [

	^ characterClassBinding at: aCharacter ifAbsent: [ "maybe add a default value" ]
]

{ #category : #private }
MygLevelImporter >> fillBindingDictionary: aDictionary [

	characterClassBinding := aDictionary
]

{ #category : #'as yet unclassified' }
MygLevelImporter >> maxLineLength [

	^ (lines max: [ :each | each size ]) 
]

{ #category : #'as yet unclassified' }
MygLevelImporter >> splitLines: aString [
	^ aString splitOn: Character cr
]
