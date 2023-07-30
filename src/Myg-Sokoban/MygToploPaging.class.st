Class {
	#name : #MygToploPaging,
	#superclass : #Object,
	#category : #'Myg-Sokoban-Toplo'
}

{ #category : #'accessing - structure variables' }
MygToploPaging class >> buttonWithPack: aPack withManager: aManager andIndex: i [

	| stream container button previewForm |
	stream := String streamContents: [ :out |
		          out
			          nextPutAll: 'Level ';
			          print: i ].
	" optimization to avoid having too much elements in a button "
	previewForm := (self previewForButtonWithPack: aPack at: i) aeAsForm asElement.
	container := BlElement new layout: BlFrameLayout new; size: 150@150 ; addChild: previewForm.
	button := ToButton new beVertical
		          iconImage: container;
		          labelText: stream;
		          constraintsDo: [ :c |
			          c horizontal matchParent.
			          c frame vertical alignCenter.
			          c frame horizontal alignCenter ];
		          whenClickedDo: [
			          | string |
			          string := (MygSkGameManager perform: aPack asSymbol) at:
					                    i.
			          aManager
				          launchFromString: string
				          inDictionary: aPack
				          at: i ].

	^ button
]

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
	grid := BlElement new
		        layout: (BlGridLayout horizontal
				         columnCount: 5;
				         cellSpacing: 10);
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical fitContent ].

	1 to: (MygSkGameManager perform: aPack asSymbol) size do: [ :i |
		grid addChild: (self buttonWithPack: aPack withManager: aManager andIndex: i ) as: i asString ].

	root := grid asScrollableElement.

	scrollbar := BlVerticalScrollbarElement new
		             constraintsDo: [ :c |
			             c ignoreByLayout.
			             c margin: (BlInsets right: 2).
			             c ignored horizontal alignRight.
			             c ignored vertical alignBottom ];
		             attachTo: root.
	bigContainer addChildren: {
			root.
			scrollbar }.
	^ bigContainer
]

{ #category : #'as yet unclassified' }
MygToploPaging class >> previewForButtonWithPack: aPack at: i [

	| iconImage string board space elt |
	iconImage := MygSkBoardElement new.
	space := BlSpace new extent: 150 @ 150.
	space root addChild: iconImage.

	string := (MygSkGameManager perform: aPack asSymbol) at: i.
	board := MygSkBoard createWithBoard:
		         (MygSkGameManager importFromString: string).
	iconImage boardPreview: board.
	iconImage parent: nil.
	elt := BlElement new
		       background: Color purple;
		       size: 150 @ 150.
	^ iconImage
]

{ #category : #'see class side' }
MygToploPaging >> seeClassSide [

	
]
