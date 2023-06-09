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


    Implementation Points
"
Class {
	#name : #MineSweeper,
	#superclass : #Object,
	#category : #'Myg-MineSweeper-Model'
}

{ #category : #'as yet unclassified' }
MineSweeper class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color veryVeryLightGray;
		border: (BlBorder paint: Color veryDarkGray).
	^ bar
]

{ #category : #'as yet unclassified' }
MineSweeper class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Help').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousHelp)).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: 'How to play:
		 
The Minesweeper is a famous game where you need to clear a field without touching any bomb.

- You can click on a cell to uncover it and reveal the number of bombs around this cell.
- Right-click on a cell to flag it and avoid clicking on it, right-click again to unflag.
- When you flagged as many neighbouring cells as bombs around a cell, you can click on this cell to uncover all unflagged neighbouring cells.
			
The game ends when you have cleared all safe cells.
			
Have fun !'.
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color lightGreen;
			             padding: (BlInsets all: 15);
			             layout: BlLinearLayout vertical;
			             constraintsDo: [ :c |
				             c horizontal fitContent.
				             c vertical fitContent ].
		container addChild: lab.
		space := OBlSpace new.
		space root
			layout: BlFrameLayout new;
			addChild: container;
			constraintsDo: [ :c |
				c horizontal fitContent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #'as yet unclassified' }
MineSweeper class >> menuPlay [ 
	|menu|
	menu := ToMenu new.
	menu label: (ToLabel text: 'Play').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Small') whenClickedDo: [
			 MFieldElement launchSmall ]).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Regular') whenClickedDo: [
			 MFieldElement launchRegular ]).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Large') whenClickedDo: [
			 MFieldElement launchLarge ]).
	menu addItem:
		((ToButtonMenuItem new labelText: 'Very Large') whenClickedDo: [
			 MFieldElement launchVeryLarge ]).
		
	^ menu
]

{ #category : #'instance creation' }
MineSweeper class >> open [

	| space playMenu helpMenu bar title |
	playMenu := self menuPlay.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.

	bar addMenu: playMenu.
	bar addMenu: helpMenu.
	space := OBlSpace new.


	space root addChild: title.
	space root addChild: bar.
	space extent: 300 @ 300.
	space show
]

{ #category : #accessing }
MineSweeper class >> title [ 
	|title|
	title := BlElement new background: Color lightBlue.
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text:
			  (('Minesweeper' asRopedText fontName: 'Phosphate') fontSize: 50))
			 constraintsDo: [ :c |
				 c frame horizontal alignCenter.
				 c frame vertical alignCenter ]).
	^ title 
]
