Class {
	#name : #TLineTest,
	#superclass : #TAbstractTest,
	#category : #'Myg-Takuzu-Tests'
}

{ #category : #tests }
TLineTest >> testIsSimilarTo [

	| line1 line2 box0 box1 boxNil |
	box0 := TFixedBox value: 0.
	box1 := TFixedBox value: 1.
	boxNil := TFixedBox value: nil.
	line1 := {
		         box0.
		         box0.
		         box1.
		         box0.
		         box1.
		         box1 } asTLine.
	line2 := {
		         box0.
		         box0.
		         boxNil.
		         box0.
		         boxNil.
		         boxNil } asTLine.
	self assert: (line1 isSimilarTo: line2).
	line2 := {
		         boxNil.
		         boxNil.
		         box1.
		         boxNil.
		         box1.
		         box1 } asTLine.
	self assert: (line1 isSimilarTo: line2).
	line1 := {
		         box0.
		         box0.
		         boxNil.
		         box0.
		         boxNil.
		         boxNil } asTLine.
	self assert: (line1 isSimilarTo: line2).
]

{ #category : #tests }
TLineTest >> testIsValid [

	| line box0 box1 |
	box0 := TFixedBox value: 0.
	box1 := TFixedBox value: 1.
	line := TLine new contents: (OrderedCollection
			         with: box0
			         with: box0
			         with: box0
			         with: box1
			         with: box1
			         with: box1).
	self deny: line isValid.
	line contents at: 1 put: box1.
	line contents at: 5 put: box0.
	self assert: line isValid.
	line contents at: 3 put: nil.
	self assert: line isValid
]
