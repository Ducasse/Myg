Class {
	#name : #Takuzu,
	#superclass : #Object,
	#category : #'Myg-Takuzu-Core'
}

{ #category : #'as yet unclassified' }
Takuzu class >> menuBar [

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
Takuzu class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Help').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousHelp)).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: ('How to play:
		 
Takuzu is a japanese puzzle game also known as binary sudoku.

The goal is to fill the grid with red or blue cells following these 3 rules :

	- You can''t have more than 2 cells of the same color aligned.
	- The must be as many red and blue cells on each row and column
	- Rows and Columns must be all different one to another
	
-----

You can start playing with the ''Levels'' menu, with non-ambiguous levels from size 4x4 to 12x12.

You can also play on 4x4 and 6x6 randomly generated levels in the ''Random'' menu.
The random generation is a bit messy so you may encounter ambiguous levels, improvements might appear in the future.
			
Have fun !' asRopedText foreground: Color white).
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color veryDarkGray;
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
				c horizontal matchParent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #'as yet unclassified' }
Takuzu class >> menuLevel [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Levels').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).

	4 to: 12 by: 2 do: [ :index |
		| subMenu |
		subMenu := ToMenu new label:
			           (ToLabel new text: (String streamContents: [ :out |
					             out
						             print: index;
						             nextPut: $x;
						             print: index ])).
		1 to: 5 do: [ :i |
			| stream selector tmp |
			stream := String streamContents: [ :out |
				          out
					          nextPutAll: 'Level';
					          space;
					          print: i ].
			selector := String streamContents: [ :out |
				            out
					            nextPutAll: 'level';
					            print: index;
					            nextPutAll: 'Grid';
					            print: i ].
			tmp := TFieldElement class selectors select: [ :each |
				       each = selector ].
			subMenu addItem:
				((ToButtonMenuItem new labelText: stream) whenClickedDo: [
					 TFieldElement openWithModel: (TField perform: selector asSymbol) ]) ].
		menu addItem: subMenu ].

	^ menu
]

{ #category : #'as yet unclassified' }
Takuzu class >> menuRandom [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Random').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).
	menu addItem:
		((ToButtonMenuItem new labelText: '4x4') whenClickedDo: [
			 TFieldElement launch4 ]).
	menu addItem:
		((ToButtonMenuItem new labelText: '6x6') whenClickedDo: [
			 TFieldElement launch6 ]).
	"menu addItem:
		((ToButtonMenuItem new labelText: '8x8') whenClickedDo: [
			 TFieldElement launch8 ]).
	menu addItem:
		((ToButtonMenuItem new labelText: '10x10') whenClickedDo: [
			 TFieldElement launch10 ]).
	menu addItem:
		((ToButtonMenuItem new labelText: '12x12') whenClickedDo: [
			 TFieldElement launch12 ])."

	^ menu
]

{ #category : #'as yet unclassified' }
Takuzu class >> openWithMenuBar [

	| space randomMenu levelMenu helpMenu bar title |
	randomMenu := self menuRandom.
	levelMenu := self menuLevel.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.

	bar addMenu: levelMenu.
	bar addMenu: randomMenu.
	bar addMenu: helpMenu.
	space := OBlSpace new.


	space root addChild: title.
	space root addChild: bar.
	space extent: 300 @ 300.
	space show
]

{ #category : #accessing }
Takuzu class >> title [

	| title |
	title := BlElement new background: Color veryDarkGray.
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Takuzu' asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 50)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
