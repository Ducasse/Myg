Class {
	#name : #TBoxUnknownTest,
	#superclass : #TAbstractTest,
	#category : #'Myg-Takuzu-Tests'
}

{ #category : #tests }
TBoxUnknownTest >> testBoxUnknownClick [
	|box|
	box := TUnknownBox new.
	self assert: box value isNil.
	box click.
	self assert: box value equals: 0.
	box click.
	self assert: box value equals: 1.
	box click.
	self assert: box value isNil
]
