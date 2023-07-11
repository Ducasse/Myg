Class {
	#name : #MFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'Myg-MineSweeper-Elements'
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

{ #category : #'instance creation' }
MFieldElement class >> openWithMenuBar [

	| space menu bar |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Play').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Small') whenClickedDo: [
			 self launchSmall ]).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Regular') whenClickedDo: [
			 self launchRegular ]).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Large') whenClickedDo: [
			 self launchLarge ]).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Very Large') whenClickedDo: [
			 self launchVeryLarge ]).

	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar addMenu: menu.
	bar background: Color veryVeryLightGray.
	bar addFiller.
	bar border: (BlBorder paint: Color veryDarkGray).
	space := OBlSpace new.

	space root addChild: bar.
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

	^ self openWithModel: MField matrixForField
]

{ #category : #execution }
MFieldElement class >> withMatrixForFieldWithMagnifier: aNumber [

	^ self openWithModel: MField matrixForField withMagnifier: aNumber 
]

{ #category : #execution }
MFieldElement class >> withMatrixTest5x5 [

	^ self openWithModel: MField matrixTest5x5
]

{ #category : #execution }
MFieldElement class >> withMatrixTest5x5WithMagnifier: aNumber [

	^ self openWithModel: MField matrixTest5x5 withMagnifier: aNumber 
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
	game matrix do: [ :aBox |
		| boxElement |
		boxElement := (MBoxElement box: aBox) field: aMField.
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
