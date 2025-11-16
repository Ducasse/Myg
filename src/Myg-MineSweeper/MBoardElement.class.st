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
	#name : 'MBoardElement',
	#superclass : 'BlElement',
	#instVars : [
		'game'
	],
	#category : 'Myg-MineSweeper-UI',
	#package : 'Myg-MineSweeper',
	#tag : 'UI'
}

{ #category : 'instance creation' }
MBoardElement class >> launchLarge [
	^ self withMatrixTest5x5WithMagnifier: 2
]

{ #category : 'instance creation' }
MBoardElement class >> launchRegular [
	^ self withMatrixTest5x5 
]

{ #category : 'instance creation' }
MBoardElement class >> launchSmall [
	^ self withMatrixTest5x5WithMagnifier: 0.5
]

{ #category : 'instance creation' }
MBoardElement class >> launchVeryLarge [
	^ self withMatrixTest5x5WithMagnifier: 4
]

{ #category : 'instance creation' }
MBoardElement class >> open [
	<script>

	| butSmall butRegular butLarge butVeryLarge space elt |
	butSmall := ToButtonModel new.
	butSmall labelText: ('Small' asRopedText fontSize: 50).
	butSmall whenClickedDo: [ self launchSmall ].

	butRegular := ToButtonModel new.
	butRegular labelText: ('Regular' asRopedText fontSize: 50).
	butRegular whenClickedDo: [ self launchRegular ].

	butLarge := ToButtonModel new.
	butLarge labelText: ('Large' asRopedText fontSize: 50).
	butLarge whenClickedDo: [ self launchLarge ].

	butVeryLarge := ToButtonModel new.
	butVeryLarge labelText: ('Very Large' asRopedText fontSize: 50).
	butVeryLarge whenClickedDo: [ self launchVeryLarge ].

	elt := BlElement new.
	elt layout: (BlGridLayout horizontal cellSpacing: 5).
	elt constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	elt layout columnCount: 2.

	space := BlSpace new.
	elt addChild: (butSmall onWidget
			 padding: (BlInsets all: 5);
			 constraintsDo: [ :c |
				 c horizontal matchParent.
				 c vertical matchParent ];
			yourself).
	elt addChild:
		(butRegular onWidget
			padding: (BlInsets all: 5);
			constraintsDo: [ :c |
				 c horizontal matchParent.
				 c vertical matchParent ];
			yourself).
	elt addChild:
		(butLarge onWidget
			padding: (BlInsets all: 5);
			constraintsDo: [ :c |
				 c horizontal matchParent.
				 c vertical matchParent ];
			yourself).
	elt addChild:
		(butVeryLarge onWidget
			padding: (BlInsets all: 5);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			yourself).
	space root addChild: elt.
	space extent: 500 @ 250.
	space show
]

{ #category : 'instance creation' }
MBoardElement class >> openWithModel: aModel [

	^ self openWithModel: aModel withMagnifier: 1
]

{ #category : 'instance creation' }
MBoardElement class >> openWithModel: aModel withMagnifier: aNumber [

	| aGameElement space |
	space := BlSpace new.
	"Create the game model and the Bloc element."
	aGameElement := self new
		                game: (aModel magnifier: aNumber);
		                yourself.

	"The space represents the window"

	space root addChild: aGameElement.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: aGameElement extent.
	space resizable: false.
	space show.
	^ space
]

{ #category : 'execution' }
MBoardElement class >> withMatrixForField [

	^ self openWithModel: MBoard matrixForField
]

{ #category : 'execution' }
MBoardElement class >> withMatrixForFieldWithMagnifier: aNumber [

	^ self openWithModel: MBoard matrixForField withMagnifier: aNumber 
]

{ #category : 'execution' }
MBoardElement class >> withMatrixTest5x5 [

	^ self openWithModel: MBoard matrixTest5x5
]

{ #category : 'execution' }
MBoardElement class >> withMatrixTest5x5WithMagnifier: aNumber [

	^ self openWithModel: MBoard matrixTest5x5 withMagnifier: aNumber 
]

{ #category : 'accessing' }
MBoardElement >> game [ 
	^ game
]

{ #category : 'accessing' }
MBoardElement >> game: aMBoard [

	game := aMBoard.
	self padding: (BlInsets all: 5 * game magnifier).
	self layout columnCount: game width.
	game grid do: [ :aBox |
		| boxElement |
		boxElement := MBoxElement createWithBox: aBox.
		self addChild: boxElement ]
]

{ #category : 'initialization' }
MBoardElement >> initialize [

	super initialize.
	self background: (BlBackground paint: Color veryVeryLightGray).
	self layout: (BlGridLayout horizontal cellSpacing: 5).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]
