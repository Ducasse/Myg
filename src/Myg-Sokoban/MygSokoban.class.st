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
	#category : #'Myg-Sokoban-Toplo'
}

{ #category : #'private - menu building' }
MygSokoban class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar border: (BlBorder paint: Color red).
	^ bar
]

{ #category : #'private - menu building' }
MygSokoban class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Help'.
	menu iconImage: (Smalltalk ui icons iconNamed: #glamorousHelp).
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

{ #category : #'private - menu building' }
MygSokoban class >> menuLevel [

	| menu manager subMenuMicroban subMenuLoma subMenuPack subMenuSasquatch subMenuSasquatchIII subMenuSasquatchIV subMenuSasquatchV subMenuSasquatchVI subMenuUAlberta |
	menu := ToMenu new.
	menu labelText: 'Levels'.
	menu iconImage: (Smalltalk ui icons iconNamed: #solidMenu).

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

{ #category : #opening }
MygSokoban class >> openWithMenuBar [
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

	bar addMenu: levelMenu.
	bar addMenu: helpMenu.

	space := BlSpace new.
	space root addChild: container.
	space extent: 1000 @ 1000.
	space show
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuLoma: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesLoma';
		yourself.
	MygSkGameManager mazesLoma withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesLoma'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuMicroban: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesMicroban';
		yourself.
	MygSkGameManager mazesMicroban withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesMicroban'
						at: i ];
					yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuPack: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesPack';
		yourself.
	MygSkGameManager mazesPack withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesPack'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuSasquatch: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesSasquatch';
		yourself.
	MygSkGameManager mazesSasquatch withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesSasquatch'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuSasquatchIII: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesSasquatchIII';
		yourself.
	MygSkGameManager mazesSasquatchIII withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesSasquatchIII'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuSasquatchIV: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesSasquatchIV';
		yourself.
	MygSkGameManager mazesSasquatchIV withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesSasquatchIV'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuSasquatchV: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesSasquatchV';
		yourself.
	MygSkGameManager mazesSasquatchV withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesSasquatchV'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuSasquatchVI: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesSasquatchVI';
		yourself.
	MygSkGameManager mazesSasquatchVI withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesSasquatchVI'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuTest: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesTest';
		yourself.
	MygSkGameManager mazesTest withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesTest'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #'private - menu building' }
MygSokoban class >> subMenuUAlberta: aManager [

	| subMenu |
	subMenu := ToMenu new
		labelText: 'mazesUAlberta';
		yourself.
	MygSkGameManager mazesUAlberta withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].
		subMenu addItem:
			(ToMenuItem new
				labelText: stream;
				whenClickedDo: [
					aManager
						launchFromString: string
						inDictionary: 'mazesUAlberta'
						at: i ];
				yourself) ].

	^ subMenu
]

{ #category : #accessing }
MygSokoban class >> title [

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

{ #category : #'see class side' }
MygSokoban >> seeClassSide [ 
]
