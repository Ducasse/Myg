Class {
	#name : #MygResources,
	#superclass : #Object,
	#classInstVars : [
		'packs'
	],
	#category : #'Myg-Sokoban-Toplo'
}

{ #category : #'class initialization' }
MygResources class >> initialize [

	self initializePacks
]

{ #category : #initialization }
MygResources class >> initializePacks [

	self packs: Dictionary new.
	self packs
		at: 'Loma' put: (self setUpPack: 'mazesLoma') ;
		at: 'Microban' put: (self setUpPack: 'mazesMicroban') ;
		at: 'Pack' put: (self setUpPack: 'mazesPack');
		at: 'Sasquatch' put: (self setUpPack: 'mazesSasquatch' );
		at: 'SasquatchIII' put: (self setUpPack: 'mazesSasquatchIII');
		at: 'SasquatchIV' put: (self setUpPack: 'mazesSasquatchIV');
		at: 'SasquatchV' put: (self setUpPack: 'mazesSasquatchV');
		at: 'SasquatchVI' put: (self setUpPack: 'mazesSasquatchVI');
		at: 'UAlberta' put: (self setUpPack: 'mazesUAlberta')
]

{ #category : #initialization }
MygResources class >> packs [

	^ packs
]

{ #category : #initialization }
MygResources class >> packs: aDictionary [

	packs := aDictionary
]

{ #category : #initialization }
MygResources class >> previewForButtonWithPack: aPack at: i [

	| iconImage string board space |
	iconImage := MygSkBoardElement new.
	space := BlSpace new extent: 150 @ 150.
	space root addChild: iconImage.

	string := (MygSkGameManager perform: aPack asSymbol) at: i.
	board := MygSkBoard createWithBoard:
		         (MygSkGameManager importFromString: string).
	iconImage boardPreview: board.
	iconImage parent: nil.
	^ iconImage
]

{ #category : #initialization }
MygResources class >> setUpPack: aPack [

	| dict |
	dict := Dictionary new.
	1 to: (MygSkGameManager perform: aPack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: aPack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #'see class side' }
MygResources >> seeClassSide [ 
]
