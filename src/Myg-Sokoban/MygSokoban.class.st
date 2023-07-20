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
	#name : #MygSokoban,
	#superclass : #Object,
	#category : #'Myg-Sokoban-Model'
}

{ #category : #'as yet unclassified' }
MygSokoban class >> levelPaging [

	| aNotebook manager |
	aNotebook := ToNotebook new
		             background: Color lightRed darker;
		             margin: (BlInsets all: 50).
	manager := MygSkGameManager new.

	aNotebook
		addPageTitle: 'Loma'
		bodyFactory: [ self pagingPack: 'mazesLoma' managedBy: manager ];
		addPageTitle: 'Microban'
		bodyFactory: [ self pagingPack: 'mazesMicroban' managedBy: manager ];
		addPageTitle: 'Pack'
		bodyFactory: [ self pagingPack: 'mazesPack' managedBy: manager ];
		addPageTitle: 'Sasquatch'
		bodyFactory: [ self pagingPack: 'mazesSasquatch' managedBy: manager ];
		addPageTitle: 'SasquatchIII'
		bodyFactory: [
			self pagingPack: 'mazesSasquatchIII' managedBy: manager ];
		addPageTitle: 'SasquatchIV'
		bodyFactory: [
			self pagingPack: 'mazesSasquatchIV' managedBy: manager ];
		addPageTitle: 'SasquatchV'
		bodyFactory: [
			self pagingPack: 'mazesSasquatchV' managedBy: manager ];
		addPageTitle: 'SasquatchVI'
		bodyFactory: [
			self pagingPack: 'mazesSasquatchVI' managedBy: manager ];
		addPageTitle: 'UAlberta'
		bodyFactory: [ self pagingPack: 'mazesUAlberta' managedBy: manager ].

	^ aNotebook
]

{ #category : #'as yet unclassified' }
MygSokoban class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar border: (BlBorder paint: Color red).
	^ bar
]

{ #category : #'as yet unclassified' }
MygSokoban class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Help').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousHelp)).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: 'How to play:
		 
Sokoban is a puzzle video game in which the player pushes boxes around in a warehouse, trying to get them to storage locations. 
The game was designed in 1981 by Hiroyuki Imabayashi, and first published in December 1982.

The game is played on a board of squares, where each square is a floor or a wall. 
Some floor squares contain boxes, and some floor squares are marked as storage locations.

The player is confined to the board and may move horizontally or vertically onto empty squares (never through walls or boxes). 
The player can move a box by walking up to it and push it to the square beyond. 
Boxes cannot be pulled, and they cannot be pushed to squares with walls or other boxes. 
The number of boxes equals the number of storage locations. 
The puzzle is solved when all boxes are placed at storage locations
	
-----

Bindings :

Arrows : to move the player around
Spacebar : to reset the level or replay it when finished
Escape : to exit the current level

-----
You can start playing with the ''Levels'' menu and choose a level you would like to play
			
Have fun !' asRopedText.
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color lightRed;
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

{ #category : #'as yet unclassified' }
MygSokoban class >> menuLevel [

	| menu manager subMenuMicroban subMenuLoma subMenuPack subMenuSasquatch subMenuSasquatchIII subMenuSasquatchIV subMenuSasquatchV subMenuSasquatchVI subMenuUAlberta |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Levels').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).

	manager := MygSkGameManager menu: menu.

	subMenuLoma := self subMenuLoma: manager.
	subMenuMicroban := self subMenuMicroban: manager.
	subMenuPack := self subMenuPack: manager.
	subMenuSasquatch := self subMenuSasquatch: manager.
	subMenuSasquatchIII := self subMenuSasquatchIII: manager.
	subMenuSasquatchIV := self subMenuSasquatchIV: manager.
	subMenuSasquatchV := self subMenuSasquatchV: manager.
	subMenuSasquatchVI := self subMenuSasquatchVI: manager.
	subMenuUAlberta := self subMenuUAlberta: manager.

	menu addItem: subMenuLoma.
	menu addItem: subMenuMicroban.
	menu addItem: subMenuPack.
	menu addItem: subMenuSasquatch.
	menu addItem: subMenuSasquatchIII.
	menu addItem: subMenuSasquatchIV.
	menu addItem: subMenuSasquatchV.
	menu addItem: subMenuSasquatchVI.
	menu addItem: subMenuUAlberta.
	menu addItem: (self subMenuTest: manager).

	^ menu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> openWithMenuBar [

	| space container levelMenu helpMenu bar title paging |
	levelMenu := self menuLevel.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.
	paging := self levelPaging.
	container := BlElement new
		             background: Color lightRed;
		             layout: BlLinearLayout vertical;
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical matchParent ].
	container addChildren: {
			bar.
			title.
			paging }.

	bar addMenu: levelMenu.
	bar addMenu: helpMenu.
	space := BlSpace new.

	space root addChild: container.
	space extent: 1750 @ 1750.
	space show
]

{ #category : #'as yet unclassified' }
MygSokoban class >> pagingPack: aPack managedBy: aManager [

	| container |
	container := BlElement new layout: (BlGridLayout horizontal
			              columnCount: 5;
			              cellSpacing: 10).

	1 to: (MygSkGameManager perform: aPack asSymbol) size do: [ :i |
		| stream |
		stream := String streamContents: [ :out |
			          out
				          nextPutAll: 'Level ';
				          print: i ].
		container addChild: ((ToButton new
				  labelText: stream;
				  constraintsDo: [ :c | c horizontal matchParent ])
				 whenClickedDo: [
					 | string |
					 string := (MygSkGameManager perform: aPack asSymbol) at: i.
					 aManager launchFromString: string inDictionary: aPack at: i ];
				 layout: BlFrameLayout new;
				 constraintsDo: [ :c |
					 c frame vertical alignCenter.
					 c frame horizontal alignCenter ]) ].
	^ container
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuLoma: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesLoma').
	1 to: MygSkGameManager mazesLoma size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesLoma at: i.
				 aManager launchFromString: string inDictionary: 'mazesLoma' at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuMicroban: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesMicroban').
	1 to: MygSkGameManager mazesMicroban size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesMicroban at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesMicroban'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuPack: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesPack').
	1 to: MygSkGameManager mazesPack size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesPack at: i.
				 aManager launchFromString: string inDictionary: 'mazesPack' at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuSasquatch: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatch').
	1 to: MygSkGameManager mazesSasquatch size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesSasquatch at: i.
				 aManager launchFromString: string inDictionary: 'mazesSasquatch' at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuSasquatchIII: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatchIII').
	1 to: MygSkGameManager mazesSasquatchIII size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesSasquatchIII at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesSasquatchIII'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuSasquatchIV: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatchIV').
	1 to: MygSkGameManager mazesSasquatchIV size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesSasquatchIV at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesSasquatchIV'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuSasquatchV: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatchV').
	1 to: MygSkGameManager mazesSasquatchV size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesSasquatchV at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesSasquatchV'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuSasquatchVI: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatchVI').
	1 to: MygSkGameManager mazesSasquatchVI size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesSasquatchVI at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesSasquatchVI'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuTest: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesTest').
	1 to: MygSkGameManager mazesTest size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesTest at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesTest'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
MygSokoban class >> subMenuUAlberta: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesUAlberta').
	1 to: MygSkGameManager mazesUAlberta size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := MygSkGameManager mazesUAlberta at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesUAlberta'
					 at: i ]) ].
	^ subMenu
]

{ #category : #accessing }
MygSokoban class >> title [

	| title |
	title := BlElement new size: 50 @ 200.
	title constraintsDo: [ :c | c horizontal matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Sokoban' asRopedText
				   fontName: 'Phosphate';
				   fontSize: 100)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]

{ #category : #'see class side' }
MygSokoban >> seeClassSide [ 
]
