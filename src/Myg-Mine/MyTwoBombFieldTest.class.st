"
We have a field with two bombs


```


...
			B(9@9)		N-2(10@9)		NE-1(11@9)
			W-2	(9@10)		B(10@10)		E-1(11@10)
			SW-1(9@11)	S-1(10@11)	SE-1(11@11)
					
...

```
"
Class {
	#name : #MyTwoBombFieldTest,
	#superclass : #TestCase,
	#instVars : [
		'b',
		'bomb',
		'bomb2'
	],
	#category : #'Myg-Mine-Core'
}

{ #category : #tests }
MyTwoBombFieldTest >> setUp [

	b := MyBoard extent: 100@200.
	bomb := MyBomb new.
	bomb setBoard: b.
	bomb x: 10 y: 10.
	bomb2 := MyBomb new.
	bomb2 setBoard: b.
	bomb2 x: 9 y: 9.
	b buildLandcape.
	 
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testClean [

	| clean |
	clean := (b atX: 5 atY: 5).
	clean neighBouring value: clean.  
	self assert: (b atX: 5 atY: 5) isClean.
	
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testOneBombAroundE [

	| e |
	e := (b atX: 11 atY: 10).
	e neighBouring value: e.  
	self assert: e status equals: 1
	
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testOneBombAroundN [

	| n |
	n := (b atX: 10 atY: 9).
	n neighBouring value: n.  
	self assert: n status equals: 2
	
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testOneBombAroundNE [

	| ne |
	ne := b atX: 11 atY: 9.
	ne neighBouring value: ne.  
	self assert: ne status equals: 1
	
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testOneBombAroundNW [

	| nw |
	nw := (b atX: 9 atY: 9).
	nw neighBouring value: nw.  
	self assert: nw status equals: 1
	
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testOneBombAroundS [

	| s |
	s := (b atX: 10 atY: 11).
	s neighBouring value: s.  
	self assert: s status equals: 1
	
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testOneBombAroundSE [

	| se |
	se := (b atX: 11 atY: 11).
	se neighBouring value: se.  
	self assert: se status equals: 1
	
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testOneBombAroundSW [

	| sw |
	sw := (b atX: 9 atY: 11).
	sw neighBouring value: sw.  
	self assert: sw status equals: 1
	
	
]

{ #category : #tests }
MyTwoBombFieldTest >> testOneBombAroundW [

	| w |
	w := (b atX: 9 atY: 10).
	w neighBouring value: w.  
	self assert: w status equals: 2
	
	
]
