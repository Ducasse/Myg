Class {
	#name : #SGCaseElementTest,
	#superclass : #TestCase,
	#category : #'Myg-SameGame-UI-Tests'
}

{ #category : #tests }
SGCaseElementTest >> testDrawBlueCase [

	| case |
	self skip.
	case := SGBoxElement new.
	case drawBlueCase.

	self
		assert: case background paint color
		equals: #( 0.8 1.0 1.0 )
]

{ #category : #tests }
SGCaseElementTest >> testDrawGreenCase [

	| case |
	self skip.
	case := SGBoxElement new.
	case drawGreenCase.

	self
		assert: case background paint color rgbTriplet
		equals: #( 0.8 1.0 0.6 )
]

{ #category : #tests }
SGCaseElementTest >> testDrawNullCase [

	| case |
	self skip.
	case := SGBoxElement new.
	case drawNullCase.

	self
		assert: case background paint color rgbTriplet
		equals: #( 0.62 0.62 0.62 )
]

{ #category : #tests }
SGCaseElementTest >> testDrawRedCase [

	| case |
	self skip.
	case := SGBoxElement new.
	case drawRedCase.

	self
		assert: case background paint color rgbTriplet
		equals: #( 1.0 0.8 0.8 )
]

{ #category : #tests }
SGCaseElementTest >> testDrawYellowCase [

	| case |
	self skip.
	case := SGBoxElement new.
	case drawYellowCase.

	self
		assert: case background paint color rgbTriplet
		equals: #( 1.0 1.0 0.8 )
]
