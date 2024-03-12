Class {
	#name : #MgdBoard,
	#superclass : #MygBoard,
	#instVars : [
		'availableCards',
		'chosenCards'
	],
	#category : #'Myg-Memory-Model'
}

{ #category : #'as yet unclassified' }
MgdBoard class >> numbers [ 
	^ self new initializeForSymbols: { $1. $2. $3. $4. $5. $6. $7. $8 }
]

{ #category : #accessing }
MgdBoard >> availableCards [ 
	^ availableCards 
]

{ #category : #accessing }
MgdBoard >> cardsCount [ 
	^ self gridSize * self gridSize 
]

{ #category : #accessing }
MgdBoard >> chooseCard: aCard [

	(self chosenCards includes: aCard) ifTrue: [ ^ self ].
	self chosenCards add: aCard.
	aCard flip.
	self shouldCompleteStep ifTrue: [ ^ self completeStep ].
	self shouldResetStep ifTrue: [ self resetStep ]
]

{ #category : #asserting }
MgdBoard >> chosenCardMatch [ 

	|firstCard|
	firstCard := self chosenCards first.
	^ self chosenCards allSatisfy: [ :aCard | aCard isFlipped and: [ firstCard symbol = aCard symbol ] ]
]

{ #category : #accessing }
MgdBoard >> chosenCards [ 
	^chosenCards 
]

{ #category : #asserting }
MgdBoard >> completeStep [ 

	self chosenCards do: [ :aCard | aCard disappear ];
	removeAll
]

{ #category : #'as yet unclassified' }
MgdBoard >> extractCardFromAnnouncement: anAnnouncement [ 

	self chooseCard: anAnnouncement card
]

{ #category : #accessing }
MgdBoard >> gridSize [ 
	^ 4 
]

{ #category : #initialization }
MgdBoard >> initialize [

	super initialize.
	availableCards := OrderedCollection new.
	chosenCards := OrderedCollection new.
]

{ #category : #accessing }
MgdBoard >> initializeForSymbols: characters [

	| array |
	self
		assert: [ characters size = (self cardsCount / self matchesCount) ]
		description: [
			'Amount of characters must be equal to possible
          all combinations' ].
	array := (characters asArray collect: [ :aSymbol |
		                   (1 to: self matchesCount) collect: [ :i |
			                   | card |
			                   card := MgdCard new
				                   symbol: aSymbol ] ]) flattened shuffled
		                  asOrderedCollection.
	self configureGrid: (CTNewArray2D fromArray: array width: self gridSize)

]

{ #category : #accessing }
MgdBoard >> matchesCount [ 
	^ 2
]

{ #category : #asserting }
MgdBoard >> resetStep [ 

	|lastCard|
	lastCard := self chosenCards last.
	self chosenCards 
		allButLastDo: [ :aCard | aCard flip ];
		removeAll;
		add: lastCard 
]

{ #category : #asserting }
MgdBoard >> shouldCompleteStep [ 

	^ self chosenCards size = self matchesCount
	and: [ self chosenCardMatch ]
]

{ #category : #asserting }
MgdBoard >> shouldResetStep [ 
	^ self chosenCards size > self matchesCount 
]
