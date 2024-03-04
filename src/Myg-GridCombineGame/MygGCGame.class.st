"
I model a generalization of a well-known game called 2048.

This game consists on:

- The board is a rectangular grid whose slots can have a tile.
- On each turn, the player moves all tiles in the board in one of the following directions: up, down, left, right. We call this ""a slide"". 
- Each tile has a value, and a slide produces the combination of two adjacent tiles if they have the same value. In the combination, one of the tiles is delete and the other is upgraded. This upgrade means a change in the tile value.
- When 
"
Class {
	#name : #MygGCGame,
	#superclass : #Object,
	#instVars : [
		'variant',
		'gridExtent',
		'tiles',
		'columns',
		'rows',
		'score',
		'announcer'
	],
	#category : #'Myg-GridCombineGame'
}

{ #category : #'instance creation' }
MygGCGame class >> gridExtent: aPoint variant: aVariant [
	
	^ self basicNew
		initializeWithGridExtent: aPoint variant: aVariant;
		yourself
]

{ #category : #'instance creation' }
MygGCGame class >> new [

	^ self gridExtent: 4 @ 4 variant: MygGC2048Variant new
]

{ #category : #accessing }
MygGCGame >> announcer [

	^ announcer
]

{ #category : #accessing }
MygGCGame >> availablePositions [
		
	^ Array streamContents: [ :stream |
		columns withIndexDo: [ :each :columnIndex |
			each withIndexDo: [ :slot :rowIndex |
				slot ifNil: [
					stream nextPut: columnIndex @ rowIndex ] ] ] ]
]

{ #category : #private }
MygGCGame >> deleteTile: aTile [ 

	(columns at: aTile position x) at: aTile position y put: nil.
	(rows at: aTile position y)    at: aTile position x put: nil.

	tiles remove: aTile.
	
	announcer announce:
		(MygGCDeletedTileAnnouncement new
			game: self;
			tile: aTile;
			yourself)
]

{ #category : #accessing }
MygGCGame >> gridExtent [

	^ gridExtent
]

{ #category : #initialization }
MygGCGame >> initializeWithGridExtent: aPoint [

	self initialize.

	announcer := Announcer new.
	tiles := OrderedCollection new.
	score := 0.

	gridExtent := aPoint.
	columns := (1 to: gridExtent x) collect: [ :each |
		MygGCGridLine new: gridExtent y ].
	rows := (1 to: gridExtent y) collect: [ :each |
		MygGCGridLine new: gridExtent x ].

	self variant: MygGC2048Variant new
]

{ #category : #initialization }
MygGCGame >> initializeWithGridExtent: aPoint variant: aVariant [

	self initialize.

	announcer := Announcer new.
	tiles := OrderedCollection new.
	score := 0.

	gridExtent := aPoint.
	columns := (1 to: gridExtent x) collect: [ :each |
		MygGCGridLine new: gridExtent y ].
	rows := (1 to: gridExtent y) collect: [ :each |
		MygGCGridLine new: gridExtent x ].

	variant := aVariant.
	variant game: self
]

{ #category : #actions }
MygGCGame >> insertNewTileAt: aPosition [
	"Insert a new tile at certain position. Signal an error if the slot is not available."

	| newTile |
	newTile := MygGCTile new
		game: self;
		content: variant nextInitialTileValue;
		position: aPosition;
		yourself.
	
	tiles add: newTile.
	(columns at: newTile position x)
		at: newTile position y
		put: newTile.
	(rows at: newTile position y)
		at: newTile position x
		put: newTile.
	
	announcer announce:
		(MygGCInsertedTileAnnouncement new
			game: self;
			tile: newTile;
			yourself).
			
	self isFull ifTrue: [ 
		announcer announce:
			(MygGCFinishedAnnouncement newFullOn: self) ]
]

{ #category : #testing }
MygGCGame >> isFinished [
	
	^ self isFull or: [ self isSuccess ]
]

{ #category : #testing }
MygGCGame >> isFull [
	
	^ tiles size = (gridExtent x * gridExtent y)
]

{ #category : #testing }
MygGCGame >> isSuccess [

	^ tiles anySatisfy: [ :each |
		 variant isSuccessTileValue: each content ]
]

{ #category : #private }
MygGCGame >> moveTile: aTile to: newPosition [

	| oldPosition |
	oldPosition := aTile position.
	
	"Delete"
	(columns at: oldPosition x) at: oldPosition y put: nil.
	(rows at: oldPosition y)    at: oldPosition x put: nil.
	
	"Insert"
	(columns at: newPosition x) at: newPosition y put: aTile.
	(rows at: newPosition y)    at: newPosition x put: aTile.
	
	aTile position: newPosition.
	
	announcer announce:
		(MygGCMovedTileAnnouncement new
			game: self;
			tile: aTile;
			oldPosition: oldPosition;
			newPosition: newPosition;
			yourself)

]

{ #category : #accessing }
MygGCGame >> score [

	^ score
]

{ #category : #actions }
MygGCGame >> slideDown [

	self slideIsVertical: true isToEnd: true
]

{ #category : #actions }
MygGCGame >> slideIsVertical: isVertical isToEnd: isToEnd [

	| lines |
	lines := isVertical ifTrue: [ columns ] ifFalse: [ rows ].
	lines withIndexDo: [ :eachLine :lineIndex |
		eachLine
			slideTiles: isToEnd
			movesDo: [ :tile :otherIndex |
				self
					moveTile: tile
					to: (isVertical
						ifTrue: [ lineIndex @ otherIndex ]
						ifFalse: [ otherIndex @ lineIndex ]) ]
			combinesDo: [ :tile1 :tile2 :otherIndex |
				self deleteTile: tile1.
				self upgradeTile: tile2.
				self
					moveTile: tile2
					to: (isVertical
						ifTrue: [ lineIndex @ otherIndex ]
						ifFalse: [ otherIndex @ lineIndex ]) ] ].

	announcer announce: (self isSuccess
		ifTrue: [ MygGCFinishedAnnouncement newSuccessOn: self ]
		ifFalse: [ MygGCSlideDoneAnnouncement new
			game: self;
			isVertical: isVertical;
			isToEnd: isToEnd;
			yourself ])
]

{ #category : #actions }
MygGCGame >> slideLeft [

	self slideIsVertical: false isToEnd: false
]

{ #category : #actions }
MygGCGame >> slideRight [

	self slideIsVertical: false isToEnd: true
]

{ #category : #actions }
MygGCGame >> slideUp [

	self slideIsVertical: true isToEnd: false
]

{ #category : #accessing }
MygGCGame >> tiles [

	^ tiles
]

{ #category : #private }
MygGCGame >> upgradeTile: aTile [ 

	| oldValue newValue |
	oldValue := aTile content.
	newValue := variant nextAfterCombining: oldValue.
	aTile content: newValue.
	score := score + newValue.
	
	announcer announce:
		(MygGCUpgradedTileAnnouncement new
			game: self;
			tile: aTile;
			oldValue: oldValue;
			newValue: newValue;
			yourself)
]

{ #category : #accessing }
MygGCGame >> variant [

	^ variant
]
