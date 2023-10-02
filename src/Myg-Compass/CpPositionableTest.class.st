Class {
	#name : #CpPositionableTest,
	#superclass : #TestCase,
	#category : #'Myg-Compass'
}

{ #category : #tests }
CpPositionableTest >> testEastInDistanceReturnRightPosition [

	| newPos |
	newPos := CpDirection east in: 3 from: (3 @ 2).
	self assert:  newPos x equals: 6. 
	self assert:  newPos y equals: 2. 

]

{ #category : #tests }
CpPositionableTest >> testEastReturnRightPosition [

	" 
	position 3@2 * Direction east 
	>>	3@3
	"
	| newPos |
	newPos := CpDirection east * (3 @ 2).
	self assert: newPos x equals: 4. 
	self assert: newPos y equals: 2. 

]

{ #category : #tests }
CpPositionableTest >> testNorthInDistanceReturnRightPosition [

	| newPos |
	newPos := CpDirection north in: 3 from: (3 @ 5).
	self assert:  newPos x equals: 3. 
	self assert:  newPos y equals: 2. 

]

{ #category : #tests }
CpPositionableTest >> testNorthReturnOneRowUpPosition [

	"
	position 3@2 * Direction north 
	>>	3@1
	"
	| newPos |
	newPos := CpDirection north * (4 @ 2).
	self assert: newPos x equals: 4. 
	self assert: newPos y equals: 1. 

]

{ #category : #tests }
CpPositionableTest >> testSouthInDistanceReturnRightPosition [

	| newPos |
	newPos := CpDirection south in: 3 from: (3 @ 5).
	self assert:  newPos x equals: 3. 
	self assert:  newPos y equals: 8. 

]

{ #category : #tests }
CpPositionableTest >> testSouthReturnOneRowDownPosition [

	"
	position 3@2 * Direction south 
	>>	3@3
	"
	| newPos |
	newPos := CpDirection south * (3 @ 2).
	self assert: newPos x equals: 3. 
	self assert: newPos y equals: 3. 

]

{ #category : #tests }
CpPositionableTest >> testWestInDistanceReturnRightPosition [

	| newPos |
	newPos := CpDirection west in: 3 from: (3 @ 2).
	self assert:  newPos x equals: 0. 
	self assert:  newPos y equals: 2. 

]

{ #category : #tests }
CpPositionableTest >> testWestReturnLeftPosition [

	"  1 2  3  4  5  6
	-----------------
1	| 01 02 03 04 05 06
2	| 07 08 09 10 11 12
3	| 13 14 15 16 17 18

	position 3@2 * Direction east 
	>>	3@3
	"
	| newPos |
	newPos := CpDirection west * (3 @ 2).
	self assert: newPos x equals: 2. 
	self assert: newPos y equals: 2. 

]
