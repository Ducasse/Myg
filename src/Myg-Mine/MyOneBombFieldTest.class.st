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
	#name : #MyOneBombFieldTest,
	#superclass : #TestCase,
	#instVars : [
		'b',
		'bomb'
	],
	#category : #'Myg-Mine-Core'
}

{ #category : #tests }
MyOneBombFieldTest >> setUp [

	b := MyBoard extent: 100@200.
	bomb := MyBomb new.
	bomb setBoard: b.
	bomb x: 10 y: 10.
	b buildLandcape.
	 
	
]

{ #category : #tests }
MyOneBombFieldTest >> testClean [

	| clean |
	clean := (b atX: 5 atY: 5).
	clean neighBouring value: clean.  
	self assert: (b atX: 5 atY: 5) isClean.
	
	
]

{ #category : #tests }
MyOneBombFieldTest >> testOneBombAroundE [

	| oneBomb |
	oneBomb := (b atX: 11 atY: 10).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MyOneBombFieldTest >> testOneBombAroundN [

	| oneBomb |
	oneBomb := (b atX: 10 atY: 9).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MyOneBombFieldTest >> testOneBombAroundNE [

	| oneBomb |
	oneBomb := b atX: 11 atY: 9.
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MyOneBombFieldTest >> testOneBombAroundNW [

	| oneBomb |
	oneBomb := (b atX: 9 atY: 9).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MyOneBombFieldTest >> testOneBombAroundS [

	| oneBomb |
	oneBomb := (b atX: 10 atY: 11).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MyOneBombFieldTest >> testOneBombAroundSE [

	| oneBomb |
	oneBomb := (b atX: 11 atY: 11).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MyOneBombFieldTest >> testOneBombAroundSW [

	| oneBomb |
	oneBomb := (b atX: 9 atY: 11).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]

{ #category : #tests }
MyOneBombFieldTest >> testOneBombAroundW [

	| oneBomb |
	oneBomb := (b atX: 9 atY: 10).
	oneBomb neighBouring value: oneBomb.  
	self assert: oneBomb status equals: 1
	
	
]
