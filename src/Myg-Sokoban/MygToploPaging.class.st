Class {
	#name : #MygToploPaging,
	#superclass : #Object,
	#category : #'Myg-Sokoban-Toplo'
}

{ #category : #'as yet unclassified' }
MygToploPaging class >> levelPaging [

	| aNotebook manager scrollbar |
	aNotebook := ToNotebook new
		             background: Color lightRed darker;
		             margin: (BlInsets all: 50).
	manager := MygSkGameManager notebook: aNotebook.

	scrollbar := BlVerticalScrollbarElement new.
	scrollbar
		constraintsDo: [ :c | c margin: (BlInsets right: 5) ];
		attachTo: aNotebook.

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
MygToploPaging class >> pagingPack: aPack managedBy: aManager [

	| grid bigContainer root scrollbar |
	bigContainer := BlElement new
		                constraintsDo: [ :c |
			                c horizontal matchParent.
			                c vertical matchParent ];
		                yourself.
	grid :=
		BlElement new
			layout: (BlGridLayout horizontal
				         columnCount: 5;
				         cellSpacing: 10);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ];
			yourself.

	(MygSkGameManager perform: aPack asSymbol) withIndexDo: [ :string :i |
		| stream |
		stream := String streamContents: [ :out |
			          out
				          nextPutAll: 'Level ';
				          print: i ].
		grid
			addChild: 
				(ToButton new
					labelText: stream;
					whenClickedDo: [
						aManager
							launchFromString: string
							inDictionary: aPack
							at: i ];
					layout: BlFrameLayout new;
					constraintsDo: [ :c |
						c horizontal matchParent.
						c frame vertical alignCenter.
						c frame horizontal alignCenter ];
					yourself)
			as: i asString ].

	root := grid asScrollableElement.

	scrollbar := BlVerticalScrollbarElement new
		             constraintsDo: [ :c |
			             c ignoreByLayout.
			             c margin: (BlInsets right: 2).
			             c ignored horizontal alignRight.
			             c ignored vertical alignBottom ];
		             attachTo: root.
	bigContainer
		addChild: root;
		addChild: scrollbar.
	^ bigContainer
]

{ #category : #'see class side' }
MygToploPaging >> seeClassSide [

	
]
