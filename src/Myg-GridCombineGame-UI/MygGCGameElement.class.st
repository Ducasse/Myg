"
I am a GUI for `GCGame`.

My central collaborator is a game model, which is associated at instance creation. Whatever the state of the game, I will show it's state and subscribe to it's announcements to update myself when required.

Vocabulary: 
- *tiles* are the numbered elements that the player slides
- *slots* are invisible rectangles disposed in a grid that covers the game element, and serve as a reference for positioning and sizing the tiles.

When I'm added to a parent element (e.g. a space), I subscribe to the key and mouse wheel events to respond accordingly by sliding the tiles.

See an example on my class-side.
"
Class {
	#name : #MygGCGameElement,
	#superclass : #MygGCElement,
	#instVars : [
		'game',
		'skin',
		'tilesContainer',
		'slotsContainer',
		'elementByTile',
		'keyBindingsEventHandler',
		'mouseWheelEventHandler',
		'isSlideEnabled',
		'slotElementMatrix'
	],
	#category : #'Myg-GridCombineGame-UI'
}

{ #category : #examples }
MygGCGameElement class >> example2048 [

	| game gameElement space skin |
	game := GCGame new.
	skin := MygGCClassicSkin new.
	gameElement := self on: game skin: skin.

	space := BlSpace new.
	space root addChild: gameElement.
	space
		extent: game gridExtent * (skin cellSize + (2 * skin cellMarginSize));
		show;
		inspect
]

{ #category : #examples }
MygGCGameElement class >> example32 [

	| customVariant game gameElement space skin |
	customVariant :=
		GCMockVariant new
			isSuccessBlock: [:n | n = 32 ];
			slideDoneBlock: [ :ann |
				5 timesRepeat: [
					ann game insertNewTileAt: 
						ann game availablePositions atRandom ] ];
			yourself.

	game :=
		(GCGame
			gridExtent: 5@5
			variant: customVariant)
				insertNewTileAt: 1@1;
				yourself.
	skin := MygGCClassicSkin new.
	gameElement := self on: game skin: skin.

	space := BlSpace new.
	space root addChild: gameElement.
	space
		extent: game gridExtent * (skin cellSize + (2 * skin cellMarginSize));
		show
]

{ #category : #'instance creation' }
MygGCGameElement class >> on: aGame skin: aSkin [

	^ self basicNew
		initializeWithGame: aGame skin: aSkin;
		yourself
]

{ #category : #private }
MygGCGameElement >> addTileElementFor: aTile [

	| tileElement |
	tileElement := MygGCLabelElement new
		text: aTile content asRopedText;
		yourself.
	tilesContainer addChild: tileElement.

	tileElement transformDo: [ :t |
		t translateBy: (self tilePositionFor: aTile) ].

	elementByTile
		at: aTile
		put: tileElement.

	skin applyTileSkinOn: tileElement.

	^ tileElement
]

{ #category : #accessing }
MygGCGameElement >> game [

	^ game
]

{ #category : #initialization }
MygGCGameElement >> initialize [

	super initialize.

	elementByTile := Dictionary new.

	"The tile container is an overlay on top of the slots."
	slotsContainer := MygGCElement new.
	tilesContainer := MygGCElement new.
	self
		addChild: slotsContainer;
		addChild: tilesContainer.

	"Key bindings need to be registered on the parent"
	isSlideEnabled := false.
	self addEventHandlerOn: BlElementAddedToParentEvent
			 do: [ :anEvent |
				 isSlideEnabled := true.
				 self
					 registerKeyBindings;
					 registerToMouseWheel ]
]

{ #category : #initialization }
MygGCGameElement >> initializeWithGame: aGame [

	game := aGame.

	slotsContainer layout: BlGridLayout vertical.
	slotsContainer layout rowCount: game gridExtent y.
	slotElementMatrix := Array2D
		                     rows: game gridExtent y
		                     columns: game gridExtent x
		                     tabulate: [ :row :column |
		                     self newSlotElementForRow: row column: column ].
	slotElementMatrix do: [ :each | slotsContainer addChild: each ].
	"If slots resize, then tiles must be repositioned."
	slotElementMatrix anyOne addEventHandler: (BlEventHandler
			 on: BlElementExtentChangedEvent
			 do: [ :event | self refreshOnSlotsPixelResize ]).

	game tiles do: [ :each | self addTileElementFor: each ].
	self refreshScoreInTitle.

	self subscribeToGameAnnouncements
]

{ #category : #initialization }
MygGCGameElement >> initializeWithGame: aGame skin: aSkin [

	self
		initialize;
		initializeWithSkin: aSkin;
		initializeWithGame: aGame
]

{ #category : #initialization }
MygGCGameElement >> initializeWithSkin: aSkin [

	skin := aSkin.
	skin applyGameSkinOn: self
]

{ #category : #initialization }
MygGCGameElement >> newSlotElementForRow: row column: column [

	| newSlotElement |
	newSlotElement := MygGCElement new.
	newSlotElement id: ('{1}@{2}' format: {column.row}).

	skin applySlotSkinOn: newSlotElement.
	
	^ newSlotElement
]

{ #category : #'model updates' }
MygGCGameElement >> refreshOnDeletedTile: aGCDeletedTileAnnouncement [ 
	
	| tileElement |
	tileElement := elementByTile at: aGCDeletedTileAnnouncement tile.
	
	tileElement addAnimation:
		(BlOpacityAnimation new
			duration: 0.2 seconds;
			opacity: 0.0;
			onFinishedDo: [ tileElement removeFromParent ];
			yourself)
			
 
]

{ #category : #private }
MygGCGameElement >> refreshOnFinished: ann [
	
	| label |
	self unregisterEventHandlers.

	label := MygGCLabelElement new.
	self addChild: label.

	ann isSuccess
		ifTrue: [ skin applyGameSuccessMessageSkinOn: label ]
		ifFalse: [ skin applyGameFailedMessageSkinOn: label ]
]

{ #category : #'model updates' }
MygGCGameElement >> refreshOnInsertedTile: aGCInsertedTileAnnouncement [ 
	
	| newTileElement |
	newTileElement := self addTileElementFor: aGCInsertedTileAnnouncement tile.
	
	skin applyTileInsertedSkinOn: newTileElement
]

{ #category : #'model updates' }
MygGCGameElement >> refreshOnMovedTile: aGCMovedTileAnnouncement [ 
	
	| aTile |
	aTile := aGCMovedTileAnnouncement tile.
	(elementByTile at: aTile) transformDo: [ :t |
		t translateBy: (self tilePositionFor: aTile) ]
]

{ #category : #private }
MygGCGameElement >> refreshOnSlideDone [

	self refreshScoreInTitle
]

{ #category : #'model updates' }
MygGCGameElement >> refreshOnSlotsPixelResize [
	
	elementByTile keysAndValuesDo: [ :tile :tileElement |
		tileElement transformDo: [ :t | 
			t translateBy: (self tilePositionFor: tile) ]].
]

{ #category : #'model updates' }
MygGCGameElement >> refreshOnUpgradedTile: aGCUpgradedTileAnnouncement [

	| aTile |
	aTile := aGCUpgradedTileAnnouncement tile.
	(elementByTile at: aTile) text: aTile content asRopedText
]

{ #category : #private }
MygGCGameElement >> refreshScoreInTitle [
	
	self space ifNotNil: [ :s | s title: ('Score: ', game score asString) ]
]

{ #category : #initialization }
MygGCGameElement >> registerKeyBindings [

	| selectorByKey |
	selectorByKey := {
		KeyboardKey up    -> #slideUp.
		KeyboardKey down  -> #slideDown.
		KeyboardKey left  -> #slideLeft.
		KeyboardKey right -> #slideRight.
	} asDictionary.

	keyBindingsEventHandler := BlEventHandler on: BlKeyUpEvent do: [ :evt |
		selectorByKey
			at: evt key
			ifPresent: [ :slideSelector |
				self
					slideIfEnabled: slideSelector
					andDisableDuring: 0.25 seconds ] ].

	self parent addEventHandler: keyBindingsEventHandler.
]

{ #category : #initialization }
MygGCGameElement >> registerToMouseWheel [

	mouseWheelEventHandler :=
		BlEventHandler
			on: BlMouseWheelEvent
			do: [ :evt |
				#(
					isScrollLeft 	slideLeft
					isScrollRight 	slideRight
					isScrollUp 		slideUp
					isScrollDown 	slideDown
				) pairsDo: [ :scrollSelector :slideSelector |
					(evt perform: scrollSelector) ifTrue: [
						"Quite a lot of wait, but else it is annoying on Mac"
						self
							slideIfEnabled: slideSelector
							andDisableDuring: 1 second ] ]
				].

	self parent addEventHandler: mouseWheelEventHandler.
]

{ #category : #accessing }
MygGCGameElement >> skin [

	^ skin
]

{ #category : #private }
MygGCGameElement >> slideIfEnabled: slideSelector andDisableDuring: aDuration [

	isSlideEnabled ifFalse: [ ^self ].

	"Disable slides during a period"
	isSlideEnabled := false.
	[	self space time wait: aDuration.
		isSlideEnabled := true ] fork.
	
	game perform: slideSelector
]

{ #category : #accessing }
MygGCGameElement >> slotsContainer [

	^ slotsContainer
]

{ #category : #initialization }
MygGCGameElement >> subscribeToGameAnnouncements [

	game announcer
		when: GCInsertedTileAnnouncement
			send: #refreshOnInsertedTile:
			to: self;
		when: GCMovedTileAnnouncement
			send: #refreshOnMovedTile:
			to: self;
		when: GCUpgradedTileAnnouncement
			send: #refreshOnUpgradedTile:
			to: self;
		when: GCDeletedTileAnnouncement
			send: #refreshOnDeletedTile:
			to: self;
		when: GCSlideDoneAnnouncement
			send: #refreshOnSlideDone
			to: self;
		when: GCFinishedAnnouncement
			send: #refreshOnFinished:
			to: self
]

{ #category : #private }
MygGCGameElement >> tilePositionFor: aTile [
	"Answer the local pixel position that corresponds to the tile position, which is a board position. Use the corresponding slot as a reference."

	^ (slotElementMatrix
		at: aTile position x
		at: aTile position y) position
]

{ #category : #accessing }
MygGCGameElement >> tilesContainer [

	^ tilesContainer
]

{ #category : #initialization }
MygGCGameElement >> unregisterEventHandlers [

	self parent
		removeEventHandler: keyBindingsEventHandler;
		removeEventHandler: mouseWheelEventHandler
]
