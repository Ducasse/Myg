Class {
	#name : #TFieldTest,
	#superclass : #TAbstractTest,
	#category : #'Myg-Takuzu-Tests'
}

{ #category : #tests }
TFieldTest >> testIsColumnUniqueAtIndex [

	| field box0 box1 |
	box0 := TFixedBox value: 0.
	box1 := TFixedBox value: 1.
	field := self gridForTest.
	field grid atColumn: 2 atRow: 2 put: box1.

	self deny: (field isColumnUniqueAtIndex: 2).
	self assert: (field isColumnUniqueAtIndex: 3)
]

{ #category : #tests }
TFieldTest >> testIsColumnValidAtIndex [

	| field box0 box1 |
	box0 := TFixedBox value: 0.
	box1 := TFixedBox value: 1.
	field := self gridForTest.
	field grid atColumn: 2 atRow: 1 put: box1.
	self assert: (field isColumnValidAtIndex: 2).
	field grid atColumn: 2 atRow: 2 put: box1.
	self deny: (field isColumnValidAtIndex: 2).
	field grid atColumn: 2 atRow: 2 put: box0.
	self assert: (field isColumnValidAtIndex: 2).
	field grid atColumn: 2 atRow: 4 put: box1.
	self deny: (field isColumnValidAtIndex: 2).
]

{ #category : #tests }
TFieldTest >> testIsFull [

	| field |
	field := TField configureGrid:
		         (CTNewArray2D
			          width: 4
			          height: 4
			          tabulate: [ :x :y | TSetBox0 new]).
	self assert: field isFull.
	(field grid at: 1 @ 1) value: nil.
	self deny: field isFull
]

{ #category : #tests }
TFieldTest >> testIsRowUniqueAtIndex [

	| field box0 box1 |
	box0 := TFixedBox value: 0.
	box1 := TFixedBox value: 1.
	field := self gridForTest.
	field grid atColumn: 2 atRow: 2 put: box1.

	self deny: (field isRowUniqueAtIndex: 2).
	self assert:
		(field isRowUniqueAtIndex: 3).
]

{ #category : #tests }
TFieldTest >> testIsRowValidAtIndex [

	| field box0 box1 |
	box0 := TFixedBox value: 0.
	box1 := TFixedBox value: 1.
	field := self gridForTest.
	field grid atColumn: 1 atRow: 2 put: box1.
	self assert: (field isRowValidAtIndex: 2).
	field grid atColumn: 2 atRow: 2 put: box1.
	self deny: (field isRowValidAtIndex: 2).
	field grid atColumn: 2 atRow: 2 put: box0.
	self assert: (field isRowValidAtIndex: 2).
	field grid atColumn: 4 atRow: 2 put: box1.
	self deny: (field isRowValidAtIndex: 2)
]

{ #category : #tests }
TFieldTest >> testIsThisLineUniqueAmongArray [

	| field box0 box1 boxNil originalLine line1 line2 line3 |
	field := TField new.
	box0 := TFixedBox value: 0.
	box1 := TFixedBox value: 1.
	boxNil := TUnknownBox.
	originalLine := TLine new contents: (OrderedCollection
			                 with: box0
			                 with: box0
			                 with: box1
			                 with: box1).
	line1 := TLine new contents: (OrderedCollection
			          with: box0
			          with: box0
			          with: box1
			          with: box1).
	line2 := TLine new contents: (OrderedCollection
			          with: box0
			          with: box0
			          with: box1
			          with: boxNil).
	line3 := TLine new contents: (OrderedCollection
			          with: box0
			          with: box0
			          with: boxNil
			          with: boxNil).
	self deny:
		(field isThisLineUnique: originalLine amongArray: { line1 }).
	self deny:
		(field isThisLineUnique: originalLine amongArray: { line2 }).
	self deny:
		(field isThisLineUnique: originalLine amongArray: { line3 })
]

{ #category : #tests }
TFieldTest >> testIsValid [

	| field box0 box1 |
	box0 := TFixedBox value: 0.
	box1 := TFixedBox value: 1.
	field := self gridForTest.
	self assert: field isValid.
	field grid atColumn: 2 atRow: 2 put: box1.
	"we try to unvalidate it with similar lines"
	self deny: field isValid.
	field grid atColumn: 2 atRow: 2 put: TBox createUnknownBox.
	field grid atColumn: 3 atRow: 1 put: box1.
	"we try to unvalidate it with unvalid row"
	self deny: field isValid.
	field grid atColumn: 3 atRow: 1 put: TBox createUnknownBox.
	field grid atColumn: 1 atRow: 3 put: box1.
	"we try to unvalidate it with unvalid column"
	self deny: field isValid
]

{ #category : #tests }
TFieldTest >> testPermutateLineWith [ 
	|field line1 line2|
	field := TField gridForTest.
	line1 := field grid atRow: 1.
	line2 := field grid atRow: 2.
	field permutateLine: 1 with: 2.
	self assert: line1 equals: (field grid atRow: 2).
	self assert: line2 equals: (field grid atRow: 1). 
]

{ #category : #tests }
TFieldTest >> testSolveTheFieldAtColumnAtRow [

	| field box1 |
	field := TField gridForTest.
	box1 := TFixedBox value: 1.
	self assert: (field solveTheField: field atColumn: 1 atRow: 1).
	field := TField gridForTest.
	field grid at: 1 @ 3 put: box1.
	self deny: (field solveTheField: field atColumn: 1 atRow: 1)
]
