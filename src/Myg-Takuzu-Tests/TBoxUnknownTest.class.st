Class {
	#name : #TBoxUnknownTest,
	#superclass : #TAbstractTest,
	#category : #'Myg-Takuzu-Tests'
}

{ #category : #tests }
TBoxUnknownTest >> testBoxUnknownClick [

	| box board |
	box := TUnknownBox new.
	board := TBoard new grid: (CTNewArray2D fromArray: { box } width: 1 ).
	box board: board.
	self assert: box value isNil.
	box click.
	self assert: box value equals: 0.
	box click.
	self assert: box value equals: 1.
	box click.
	self assert: box value isNil
]
