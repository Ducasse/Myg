"
I provide my subclasses the possibility to declare rules to perform message sends on subsets of a Bloc scene graph, i.e. a tree elements.

To ease it, the approach is similar to SUnit's TestCases: Answer collections of rules in selectors that have with the 'Rule' suffix.

Check my hierarchy for examples.
"
Class {
	#name : #MygGCGameSkin,
	#superclass : #Object,
	#category : #'Myg-GridCombineGame-UI'
}

{ #category : #accessing }
MygGCGameSkin class >> allRuleSelectors [
	"Answer all defined rules, cinluding inherited.
	Inspired on `TestCase class>>#allTestSelectors`."

	| answer pivotClass lookupRoot |
	answer := Set new.
	pivotClass := self.
	lookupRoot := MygGCGameSkin.
	[ pivotClass == lookupRoot ] whileFalse: [
		answer addAll: pivotClass ruleSelectors.
		pivotClass := pivotClass superclass ].
	
	^ answer asSortedCollection asOrderedCollection
]

{ #category : #testing }
MygGCGameSkin class >> isAbstract [

	^ self == MygGCGameSkin
]

{ #category : #'instance creation' }
MygGCGameSkin class >> on: aBlElement [

	^ self new
		baseElement: aBlElement;
		ruleSelectors: self allRuleSelectors;
		yourself
]

{ #category : #accessing }
MygGCGameSkin class >> ruleSelectors [
	"Answer defined rules locally.
	Inspired on `TestCase class>>#testSelectors`."

	^ self selectors select: [ :each |
		  (each endsWith: 'Rule') and: [ each isUnary ] ]
]

{ #category : #applying }
MygGCGameSkin >> applyGameFailedMessageSkinOn: anElement [

	self subclassResponsibility
]

{ #category : #applying }
MygGCGameSkin >> applyGameFinishedMessageSkinOn: anElement [

	self subclassResponsibility
]

{ #category : #applying }
MygGCGameSkin >> applyGameSkinOn: anElement [

	self subclassResponsibility
]

{ #category : #applying }
MygGCGameSkin >> applyGameSuccessMessageSkinOn: anElement [

	self subclassResponsibility
]

{ #category : #applying }
MygGCGameSkin >> applySlotSkinOn: anElement [

	self subclassResponsibility
]

{ #category : #applying }
MygGCGameSkin >> applyTileInsertedSkinOn: anElement [

	self subclassResponsibility
]

{ #category : #applying }
MygGCGameSkin >> applyTileSkinOn: anElement [

	self subclassResponsibility
]
