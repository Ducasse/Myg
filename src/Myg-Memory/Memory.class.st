Class {
	#name : #Memory,
	#superclass : #Object,
	#category : #'Myg-Memory-Toplo'
}

{ #category : #'as yet unclassified' }
Memory class >> menuBar [

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
Memory class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Help'.
	menu iconImage: (Smalltalk ui icons iconNamed: #glamorousHelp).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: 'How to play:
		 
The Memory game is a famous game where you need to find all pairs and clear the board.

You can click on a card to flip it and reveal the symbol behind.
Click on another card to flip it, if both symbols match the pair disappear otherwise both cards flip back
			
The game ends when you have cleared all cards.
			
Have fun !'.
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color lightOrange;
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
				c horizontal fitContent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #'as yet unclassified' }
Memory class >> menuPlay [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Play'.
	menu iconImage: (Smalltalk ui icons iconNamed: #solidMenu).
	menu addItem:
		(ToMenuItem new
			labelText: 'Small';
			whenClickedDo: [ MgdBoardElement openWithNumbers ];
			yourself).

	^ menu
]

{ #category : #'instance creation' }
Memory class >> open [
	<script>

	| space playMenu helpMenu bar title |
	playMenu := self menuPlay.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.

	bar addMenu: playMenu.
	bar addMenu: helpMenu.
	space := BlSpace new.


	space root addChild: title.
	space root addChild: bar.
	space extent: 300 @ 300.
	space show
]

{ #category : #accessing }
Memory class >> title [ 
	|title|
	title := BlElement new background: Color lightOrange.
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text:
			  (('Memory' asRopedText fontName: 'Phosphate') fontSize: 50))
			 constraintsDo: [ :c |
				 c frame horizontal alignCenter.
				 c frame vertical alignCenter ]).
	^ title 
]
