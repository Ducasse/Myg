"
We have a field with only one bomb


```
		0-(5@5)

...
			NW-1(9@9)		N-1(10@9)		NE-1(11@9)
			W-1	(9@10)		B(10@10)		E-1(11@10)
			SW-1(9@11)	S-1(10@11)	SE-1(11@11)
					
...

```
"
Class {
	#name : #MOneBombFieldTest,
	#superclass : #TestCase,
	#instVars : [
		'b',
		'bomb'
	],
	#category : #'Myg-Mine'
}

{ #category : #tests }
MOneBombFieldTest >> setUp [

	b := MBoard extent: 100@200.
	bomb := MBomb new.
	bomb setBoard: b.
	bomb x: 10 y: 10.
	b buildLandcape.
	 
	
]

{ #category : #tests }
MOneBombFieldTest >> testClean [

	| clean |
	clean := (b atX: 5 atY: 5).
	clean neighBouring value: clean.  
	self assert: (b atX: 5 atY: 5) isClean.
	
	
]

{ #category : #tests }
MOneBombFieldTest >> testOneBombAroundE [

	| oneBomb |
	oneBomb := (b atX: 11 atY: 10).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MOneBombFieldTest >> testOneBombAroundN [

	| oneBomb |
	oneBomb := (b atX: 10 atY: 9).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MOneBombFieldTest >> testOneBombAroundNE [

	| oneBomb |
	oneBomb := b atX: 11 atY: 9.
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MOneBombFieldTest >> testOneBombAroundNW [

	| oneBomb |
	oneBomb := (b atX: 9 atY: 9).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MOneBombFieldTest >> testOneBombAroundS [

	| oneBomb |
	oneBomb := (b atX: 10 atY: 11).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MOneBombFieldTest >> testOneBombAroundSE [

	| oneBomb |
	oneBomb := (b atX: 11 atY: 11).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MOneBombFieldTest >> testOneBombAroundSW [

	| oneBomb |
	oneBomb := (b atX: 9 atY: 11).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MOneBombFieldTest >> testOneBombAroundW [

	| oneBomb |
	oneBomb := (b atX: 9 atY: 10).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]
