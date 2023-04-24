Class {
	#name : #MTileTest,
	#superclass : #TestCase,
	#instVars : [
		'b',
		'bomb',
		't'
	],
	#category : #'Myg-Mine'
}

{ #category : #tests }
MTileTest >> setUp [

	b := MBoard extent: 100@200.
	bomb := MBomb new.
	t := MTile new. 
	t setBoard: b.
	t x: 10; y: 10.
	b buildLandcape. 
	
]

{ #category : #tests }
MTileTest >> testClean [

	| clean |
	clean := (b atX: 5 atY: 5).
	clean neighBouring value: clean.  
	self assert: (b atX: 5 atY: 5) isClean.
	
	
]

{ #category : #tests }
MTileTest >> testComputingLandscape [

	self assert: (b atX: 5 atY: 5) isClean.
	self assert: (b atX: 9 atY: 9) status equals: 1.
	
	
]

{ #category : #tests }
MTileTest >> testOneBombAround [

	| oneBomb |
	oneBomb := (b atX: 9 atY: 9).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]
