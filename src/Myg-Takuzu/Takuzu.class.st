"
To open the game

```
Takuzu openWithMenuBar
```
"
Class {
	#name : #Takuzu,
	#superclass : #Object,
	#category : #'Myg-Takuzu-UI'
}

{ #category : #'private - menu building' }
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

{ #category : #'private - menu building' }
Takuzu class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Help'.
	menu iconImage: (Smalltalk ui icons iconNamed: #glamorousHelp).
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
		space := BlSpace new.
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

{ #category : #'private - menu building' }
Takuzu class >> menuLevel [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Levels'.
	menu iconImage: (Smalltalk ui icons iconNamed: #solidMenu).

	4 to: 12 by: 2 do: [ :index |
		| subMenu |
		subMenu := ToMenu new
			           labelText: (String streamContents: [ :out |
						            out
							            print: index;
							            nextPut: $x;
							            print: index ]);
			           yourself.
		1 to: 5 do: [ :i |
			| stream levelString |
			stream := String streamContents: [ :out |
				          out
					          nextPutAll: 'Level';
					          space;
					          print: i ].

			levelString := (TBoard levels at: index) at: i.


			subMenu addItem: (ToMenuItem new
					 labelText: stream;
					 whenClickedDo: [
						 TBoardElement openWithModel: (TBoard level: levelString) ];
					 yourself) ].
		menu addItem: subMenu ].

	^ menu
]

{ #category : #'private - menu building' }
Takuzu class >> menuRandom [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Random'.
	menu iconImage: (Smalltalk ui icons iconNamed: #solidMenu).
	menu addItem:
		(ToMenuItem new
			labelText: '4x4';
			whenClickedDo: [ TBoardElement launch4 ];
			yourself).
	menu addItem:
		(ToMenuItem new
			labelText: '6x6';
			whenClickedDo: [ TBoardElement launch6 ];
			yourself).
	"menu addItem:
		(ToMenuItem new labelText: '8x8'; whenClickedDo: [
			 TFieldElement launch8 ]).
	menu addItem:
		(ToMenuItem new labelText: '10x10'; whenClickedDo: [
			 TFieldElement launch10 ]).
	menu addItem:
		(ToMenuItem new labelText: '12x12'; whenClickedDo: [
			 TFieldElement launch12 ])."

	^ menu
]

{ #category : #opening }
Takuzu class >> open [
	<script>

	| space randomMenu levelMenu helpMenu bar title |
	randomMenu := self menuRandom.
	levelMenu := self menuLevel.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.

	bar addMenu: levelMenu.
	bar addMenu: randomMenu.
	bar addMenu: helpMenu.

	space := BlSpace new.
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

{ #category : #'see class side' }
Takuzu >> seeClassSide [
]
