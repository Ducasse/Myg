Class {
	#name : #TFieldTool,
	#superclass : #Object,
	#instVars : [
		'lines',
		'field',
		'characterClassBinding'
	],
	#category : #'Myg-Takuzu-Core'
}

{ #category : #'as yet unclassified' }
TFieldTool class >> grid_1 [

	| grid |
	grid := 
	'_ 1 _ 1
	_ 0 0 _
	0 _ _ _
	_ _ _ _'.


	^ self new buildMapFor: grid
]

{ #category : #'as yet unclassified' }
TFieldTool class >> grid_2 [

	| grid |
	grid := '_ _ _ 0
	_ 0 _ 0
	_ _ _ _
	_ 0 0 _'.


	^ self new buildMapFor: grid
]

{ #category : #'as yet unclassified' }
TFieldTool class >> grid_3 [

	| grid |
	grid := '1 _ _ _
	_ 1 _ _
	_ 1 0 _
	_ _ _ 0'.


	^ self new buildMapFor: grid
]

{ #category : #'as yet unclassified' }
TFieldTool class >> grid_4 [

	| grid |
	grid := '1 _ _ _
	1 _ _ 1
	_ 0 _ _
	_ _ _ _'.


	^ self new buildMapFor: grid
]

{ #category : #'as yet unclassified' }
TFieldTool class >> grid_5 [

	| grid |
	grid := 
	'_ 1 _ 1
	_ 1 0 _
	_ _ _ _
	_ _ _ 0'.


	^ self new buildMapFor: grid
]

{ #category : #'as yet unclassified' }
TFieldTool >> buildArrayFor: aString [

	| array index |
	lines := self splitLines: aString.
	index := 1.
	array := CTNewArray2D
		         width: self maxLineLength
		         height: self maxLineLength.
	field := TField new.
	lines do: [ :line |
		array atRow: index put: line substrings.
		index := index + 1 ].
	^ array
]

{ #category : #'as yet unclassified' }
TFieldTool >> buildMapFor: aString [

	| array2D |
	array2D := self buildArrayFor: aString.
	field grid: (array2D collect: [ :each | (self classFor: each) copy ]).
	^ field
]

{ #category : #private }
TFieldTool >> classFor: aCharacter [ 
	^ characterClassBinding at: aCharacter ifAbsent: [ TBox unknown ]
]

{ #category : #'as yet unclassified' }
TFieldTool >> fillBindingDictionary [

	characterClassBinding := Dictionary new.
	characterClassBinding at: '_' put: TBox unknown.
	characterClassBinding at: '1' put: (TBox set: 1).
	characterClassBinding at: '0' put: (TBox set: 0)
]

{ #category : #initialization }
TFieldTool >> initialize [

	super initialize.
	self fillBindingDictionary
]

{ #category : #accessing }
TFieldTool >> maxLineLength [

	^ (lines max: [ :each | each size ]) // 2
]

{ #category : #'as yet unclassified' }
TFieldTool >> splitLines: aString [

	^ aString splitOn: Character cr
]
