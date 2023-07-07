Class {
	#name : #MygLevelImporter,
	#superclass : #Object,
	#instVars : [
		'lines',
		'characterClassBinding'
	],
	#category : #MygCore
}

{ #category : #helpers }
MygLevelImporter class >> createBindingDictionaryFromPackage: aRPackage [

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
	dictionary := self createBindingDictionaryFromPackage: aPackage.
	^ self fromString: aString withBindings: dictionary
]

{ #category : #'instance creation' }
MygLevelImporter class >> fromString: aString withBindings: aDictionary [

	| tool |
	tool := self new.
	tool fillBindingDictionary: aDictionary.
	^ tool buildGridFor: aString
]

{ #category : #private }
MygLevelImporter >> buildCharacterArrayFor: aString [

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
MygLevelImporter >> buildGridFor: aString [

	| array2D |
	array2D := self buildCharacterArrayFor: aString.
	array2D withIndexesDo: [ :columnIndex :rowIndex :value | 
		array2D atColumn: columnIndex atRow: rowIndex put: (self classFor: value) new ].
	^ array2D
]

{ #category : #'public api' }
MygLevelImporter >> classFor: aCharacter [

	^ characterClassBinding
		  at: aCharacter
		  ifAbsent: [ MygMissingCharacterError signal: 'Unknown character please specify a class textualMapCharacter method in your box domain.' ]
]

{ #category : #private }
MygLevelImporter >> fillBindingDictionary: aDictionary [

	characterClassBinding := aDictionary
]

{ #category : #private }
MygLevelImporter >> maxLineLength [

	^ (lines max: [ :each | each size ]) 
]

{ #category : #private }
MygLevelImporter >> splitLines: aString [
	^ aString splitOn: Character cr
]
