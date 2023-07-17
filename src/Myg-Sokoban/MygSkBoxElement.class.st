"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them.

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	board:		<Object>
	box:		<Object>
	positionInField:		<Object>


    Implementation Points
"
Class {
	#name : #MygSkBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'board',
		'positionInField'
	],
	#category : #'Myg-Sokoban-UI'
}

{ #category : #accessing }
MygSkBoxElement class >> box: aBox [ 

	^ self new box: aBox
]

{ #category : #'as yet unclassified' }
MygSkBoxElement >> backgroundPaint [ 
	^ Color transparent
]

{ #category : #accessing }
MygSkBoxElement >> board [ 
	^ board 
]

{ #category : #accessing }
MygSkBoxElement >> board: aSkBoard [

	board := aSkBoard.

	self
		constraintsDo: [ :c | c horizontal matchParent ]
		"addEventHandlerOn: BlElementBackgroundChangedEvent do: [ :evt |
			self transformDo: [ :builder |
					builder
						topLeftOrigin;
						scaleBy: evt currentTarget extent / self background image extent.
					self halt ] ]"
]

{ #category : #accessing }
MygSkBoxElement >> box [ 
	^ box 
]

{ #category : #accessing }
MygSkBoxElement >> box: aSkElement [

	box := aSkElement.
]

{ #category : #'as yet unclassified' }
MygSkBoxElement >> boxAnimationMovingInDirection: aCpDirection [

	^ (BlTransformAnimation translate:
		   aCpDirection * (0 @ 0) * self width) duration: 150 milliSeconds
]

{ #category : #accessing }
MygSkBoxElement >> boxForForeground [

	self box:
		(((self board atPosition: self positionInField) class inheritsFrom:
			  MygSkMovable)
			 ifFalse: [ MygSkGround new ]
			 ifTrue: [ (self board atPosition: self positionInField) ])
]

{ #category : #initialization }
MygSkBoxElement >> initialize [

	super initialize.

	self
		background: self backgroundPaint;
		geometry: BlSquareGeometry new;
		layout: BlSquaredLayout new
		
]

{ #category : #'geometry position' }
MygSkBoxElement >> positionInField [

	^ positionInField
]

{ #category : #'geometry position' }
MygSkBoxElement >> positionInField: aPoint [

	positionInField := aPoint
]

{ #category : #initialization }
MygSkBoxElement >> resetAnimation [ 

	self transformation: BlElementIdentityTransformation uniqueInstance
]

{ #category : #'as yet unclassified' }
MygSkBoxElement >> textChild [

	| text |
	text := BlTextElement new.
	self childNamed: 'text' ifFound: [ self removeChildNamed: 'text' ].
	self addChild: text as: 'text'.
	text text: self positionInField asString asRopedText.

	text text fontSize: 50.
	text text fontName: 'Source Sans Pro'.
]

{ #category : #accessing }
MygSkBoxElement >> updateBackgroundColor [

	| bg |
	bg := self box backgroundRepresentation.
	bg class = Form ifTrue: [
		| size |
		"magic numbers :
		- 1000 is the size of the space
		- 2 is the size of the cellSpacing"
		size := 1000 / self parent parent board width - 2.
		bg := bg scaledIntoFormOfSize: size ].
	self background: bg
]
