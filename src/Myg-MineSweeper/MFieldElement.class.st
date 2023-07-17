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
	game:		<Object>


    Implementation Points
"
Class {
	#name : #MFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'Myg-MineSweeper-UI'
}

{ #category : #'as yet unclassified' }
MFieldElement class >> launchLarge [
	^ self withMatrixTest5x5WithMagnifier: 2
]

{ #category : #'as yet unclassified' }
MFieldElement class >> launchRegular [
	^ self withMatrixTest5x5 
]

{ #category : #'as yet unclassified' }
MFieldElement class >> launchSmall [
	^ self withMatrixTest5x5WithMagnifier: 0.5
]

{ #category : #'as yet unclassified' }
MFieldElement class >> launchVeryLarge [
	^ self withMatrixTest5x5WithMagnifier: 4
]

{ #category : #'instance creation' }
MFieldElement class >> open [

	| butSmall butRegular butLarge butVeryLarge space elt |
	butSmall := ToButtonModel new label:
		            (ToLabel text: ('Small' asRopedText fontSize: 50)) matchParent
			            alignCenter.
	butSmall whenClickedDo: [ self launchSmall ].
	butRegular := ToButtonModel new label:
		              (ToLabel text: ('Regular' asRopedText fontSize: 50))
			              matchParent alignCenter.
	butRegular whenClickedDo: [ self launchRegular ].
	butLarge := ToButtonModel new label:
		            (ToLabel text: ('Large' asRopedText fontSize: 50))
			            matchParent alignCenter.
	butLarge whenClickedDo: [ self launchLarge ].
	butVeryLarge := ToButtonModel new label:
		                (ToLabel text:
			                 ('Very Large' asRopedText fontSize: 50))
			                matchParent alignCenter.
	butVeryLarge whenClickedDo: [ self launchVeryLarge ].

	elt := BlElement new layout: (BlGridLayout horizontal cellSpacing: 5).
	elt constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	elt layout columnCount: 2.

	space := OBlSpace new.
	elt addChild: (butSmall onWidget
			 padding: (BlInsets all: 5);
			 constraintsDo: [ :c |
				 c horizontal matchParent.
				 c vertical matchParent ]).
	elt addChild: (butRegular onWidget
			 padding: (BlInsets all: 5);
			 constraintsDo: [ :c |
				 c horizontal matchParent.
				 c vertical matchParent ]).
	elt addChild: (butLarge onWidget
			 padding: (BlInsets all: 5);
			 constraintsDo: [ :c |
				 c horizontal matchParent.
				 c vertical matchParent ]).
	elt addChild: (butVeryLarge onWidget
			 padding: (BlInsets all: 5);
			 constraintsDo: [ :c |
				 c horizontal matchParent.
				 c vertical matchParent ]).

	space root addChild: elt.
	space extent: 300 @ 300.
	space show
]

{ #category : #'as yet unclassified' }
MFieldElement class >> openWithModel: aModel [

	^ self openWithModel: aModel withMagnifier: 1
]

{ #category : #'as yet unclassified' }
MFieldElement class >> openWithModel: aModel withMagnifier: aNumber [

	| aGameElement space |
	space := BlSpace new.
	"Create the game model and the Bloc element."
	aGameElement := self new
		                game: (aModel magnifier: aNumber);
		                yourself.

	"The space represents the window"

	space addChild: aGameElement.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: aGameElement extent.
	space resizable: false.
	space show.
	^ space
]

{ #category : #execution }
MFieldElement class >> withMatrixForField [

	^ self openWithModel: MBoard matrixForField
]

{ #category : #execution }
MFieldElement class >> withMatrixForFieldWithMagnifier: aNumber [

	^ self openWithModel: MBoard matrixForField withMagnifier: aNumber 
]

{ #category : #execution }
MFieldElement class >> withMatrixTest5x5 [

	^ self openWithModel: MBoard matrixTest5x5
]

{ #category : #execution }
MFieldElement class >> withMatrixTest5x5WithMagnifier: aNumber [

	^ self openWithModel: MBoard matrixTest5x5 withMagnifier: aNumber 
]

{ #category : #accessing }
MFieldElement >> game [ 
	^ game
]

{ #category : #accessing }
MFieldElement >> game: aMField [

	game := aMField.
	self padding: (BlInsets all: 5 * game magnifier).
	self layout columnCount: game width.
	game grid do: [ :aBox |
		| boxElement |
		boxElement := (MBoxElement createWithBox: aBox)
			              field: aMField;
			              positionInField: aBox position.
		self addChild: boxElement ]
]

{ #category : #initialization }
MFieldElement >> initialize [

	super initialize.
	self background: (BlBackground paint: Color veryVeryLightGray).
	self layout: (BlGridLayout horizontal cellSpacing: 5).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]
