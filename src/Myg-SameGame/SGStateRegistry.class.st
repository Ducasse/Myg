Class {
	#name : 'SGStateRegistry',
	#superclass : 'Object',
	#instVars : [
		'null',
		'basics',
		'specials'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'initialization' }
SGStateRegistry >> basics [
	^ basics
]

{ #category : 'initialization' }
SGStateRegistry >> initialize [

	null := SGNullState.
	basics := SGBasicState subclasses.
	specials := SGSpecialState subclasses
]

{ #category : 'initialization' }
SGStateRegistry >> specials [
	^ specials
]
