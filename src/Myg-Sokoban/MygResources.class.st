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
		at: 'Loma' put: self setUpLomaPack;
		at: 'Microban' put: self setUpMicrobanPack;
		at: 'Pack' put: self setUpPackPack;
		at: 'Sasquatch' put: self setUpSasquatchPack;
		at: 'SasquatchIII' put: self setUpSasquatchIIIPack;
		at: 'SasquatchIV' put: self setUpSasquatchIVPack;
		at: 'SasquatchV' put: self setUpSasquatchVPack;
		at: 'SasquatchVI' put: self setUpSasquatchVIPack;
		at: 'UAlberta' put: self setUpUAlbertaPack
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
MygResources class >> setUpLomaPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesLoma'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #initialization }
MygResources class >> setUpMicrobanPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesMicroban'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #initialization }
MygResources class >> setUpPackPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesPack'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #initialization }
MygResources class >> setUpSasquatchIIIPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesSasquatchIII'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #initialization }
MygResources class >> setUpSasquatchIVPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesSasquatchIV'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #initialization }
MygResources class >> setUpSasquatchPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesSasquatch'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #initialization }
MygResources class >> setUpSasquatchVIPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesSasquatchVI'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #initialization }
MygResources class >> setUpSasquatchVPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesSasquatchV'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #initialization }
MygResources class >> setUpUAlbertaPack [

	| dict pack |
	dict := Dictionary new.
	pack := 'mazesUAlberta'.
	1 to: (MygSkGameManager perform: pack asSymbol) size do: [ :i |
		| form |
		form := (self previewForButtonWithPack: pack at: i) aeAsForm.
		dict at: i put: form ].
	^ dict
]

{ #category : #'see class side' }
MygResources >> seeClassSide [ 
]
