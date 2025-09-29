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
	#name : 'Sokoban',
	#superclass : 'Object',
	#category : 'Myg-Sokoban-Toplo',
	#package : 'Myg-Sokoban',
	#tag : 'Toplo'
}

{ #category : 'private - menu building' }
Sokoban class >> menuBar [

	| bar |
	bar := ToMenuPane new
		       hMatchParent;
		       vFitContent.
	bar border: (BlBorder paint: Color lightGray).
	^ bar
]

{ #category : 'private - menu building' }
Sokoban class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Help'.
	menu iconImage: (Smalltalk ui icons iconNamed: #glamorousHelp).
	menu clickAction: [
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

{ #category : 'private - menu building' }
Sokoban class >> menuLevel [

	| menu manager |
	menu := ToMenu new.
	menu labelText: 'Levels'.
	menu iconImage: (Smalltalk ui icons iconNamed: #solidMenu).

	manager := MygSkGameManager menu: menu.

	menu addItem:
			(self subMenuPack: 'mazesLoma' withManager: manager);
			addItem:
			(self subMenuPack: 'mazesMicroban' withManager: manager);
			addItem:
			(self subMenuPack: 'mazesPack' withManager: manager);
			addItem:
			(self subMenuPack: 'mazesSasquatch' withManager: manager);
			addItem:
			(self subMenuPack: 'mazesSasquatchIII' withManager: manager);
			addItem:
			(self subMenuPack: 'mazesSasquatchIV' withManager: manager);
			addItem:
			(self subMenuPack: 'mazesSasquatchV' withManager: manager);
			addItem:
			(self subMenuPack: 'mazesSasquatchVI' withManager: manager);
			addItem:
			(self subMenuPack: 'mazesUAlberta' withManager: manager).

	^ menu
]

{ #category : 'opening' }
Sokoban class >> open [

	<script>
	| space container levelMenu helpMenu bar title paging |
	levelMenu := self menuLevel.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.
	paging := MygToploPaging levelPaging.
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

	bar addItem: levelMenu.
	bar addItem: helpMenu.

	space := BlSpace new.
	space root addChild: container.
	space extent: 1000 @ 1000.
	space show
]

{ #category : 'private - menu building' }
Sokoban class >> subMenuPack: aPack withManager: aManager [

	| subMenu dict keys |
	subMenu := ToMenu new
		labelText: aPack;
		yourself.
		
	dict := (MygSkGameManager perform: aPack asSymbol).
	keys := dict keys sorted.
	keys do: [ :key |
		| stream string |
		string := dict at: key.
		stream := String streamContents: [ :out | out print: key ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				clickAction:  [
					aManager
						launchFromString: string
						inDictionary: aPack
						at: key  ];
				yourself) ].

	^ subMenu
]

{ #category : 'accessing' }
Sokoban class >> title [

	| title |
	title := BlElement new.
	title size: 50 @ 200.
	title constraintsDo: [ :c | c horizontal matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Sokoban' asRopedText
				   fontName: 'Phosphate';
				   fontSize: 100)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]

{ #category : 'see class side' }
Sokoban >> seeClassSide [ 
]
