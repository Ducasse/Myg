Class {
	#name : #MgdGameModel,
	#superclass : #Object,
	#instVars : [
		'availableCards',
		'chosenCards'
	],
	#category : #'Myg-Memory-Model'
}

{ #category : #'as yet unclassified' }
MgdGameModel class >> numbers [ 
	^ self new initializeForSymbols: { $1. $2. $3. $4. $5. $6. $7. $8 }
]

{ #category : #accessing }
MgdGameModel >> availableCards [ 
	^ availableCards 
]

{ #category : #accessing }
MgdGameModel >> cardsCount [ 
	^ self gridSize * self gridSize 
]

{ #category : #accessing }
MgdGameModel >> chooseCard: aCard [

	(self chosenCards includes: aCard) ifTrue: [ ^ self ].
	self chosenCards add: aCard.
	aCard flip.
	self shouldCompleteStep ifTrue: [ ^ self completeStep ].
	self shouldResetStep ifTrue: [ self resetStep ]
]

{ #category : #asserting }
MgdGameModel >> chosenCardMatch [ 

	|firstCard|
	firstCard := self chosenCards first.
	^ self chosenCards allSatisfy: [ :aCard | aCard isFlipped and: [ firstCard symbol = aCard symbol ] ]
]

{ #category : #accessing }
MgdGameModel >> chosenCards [ 
	^chosenCards 
]

{ #category : #asserting }
MgdGameModel >> completeStep [ 

	self chosenCards do: [ :aCard | aCard disappear ];
	removeAll
]

{ #category : #'as yet unclassified' }
MgdGameModel >> extractCardFromAnnouncement: anAnnouncement [ 

	self chooseCard: anAnnouncement card
]

{ #category : #accessing }
MgdGameModel >> gridSize [ 
	^ 4 
]

{ #category : #initialization }
MgdGameModel >> initialize [

	super initialize.
	availableCards := OrderedCollection new.
	chosenCards := OrderedCollection new.
]

{ #category : #accessing }
MgdGameModel >> initializeForSymbols: characters [

	self
		assert: [ characters size = (self cardsCount / self matchesCount) ]
		description: [
			'Amount of characters must be equal to possible
          all combinations' ].
	availableCards := (characters asArray collect: [ :aSymbol |
		                   (1 to: self matchesCount) collect: [ :i |
			                   | card |
			                   card := MgdCardModel new
				                   symbol: aSymbol ] ]) flattened shuffled
		                  asOrderedCollection
]

{ #category : #accessing }
MgdGameModel >> matchesCount [ 
	^ 2
]

{ #category : #asserting }
MgdGameModel >> resetStep [ 

	|lastCard|
	lastCard := self chosenCards last.
	self chosenCards 
		allButLastDo: [ :aCard | aCard flip ];
		removeAll;
		add: lastCard 
]

{ #category : #asserting }
MgdGameModel >> shouldCompleteStep [ 

	^ self chosenCards size = self matchesCount
	and: [ self chosenCardMatch ]
]

{ #category : #asserting }
MgdGameModel >> shouldResetStep [ 
	^ self chosenCards size > self matchesCount 
]
