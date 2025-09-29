Class {
	#name : #TLine,
	#superclass : #Object,
	#type : #variable,
	#instVars : [
		'contents'
	],
	#category : 'Myg-Takuzu-Core'
}

{ #category : #'filter streaming' }
TLine >> contents [ 
	^ contents
]

{ #category : #'filter streaming' }
TLine >> contents: anArray [

	contents := anArray
]

{ #category : #accessing }
TLine >> count: aFullBlockClosure [ 
	^contents count: aFullBlockClosure
]

{ #category : #testing }
TLine >> isSimilarTo: aTLine [

	| halfSize selfNbOf0 selfNbOf1 lineNbOf0 lineNbOf1 |
	halfSize := self contents size // 2.
	selfNbOf0 := self nbOf0.
	selfNbOf1 := self nbOf1.
	lineNbOf0 := aTLine nbOf0.
	lineNbOf1 := aTLine nbOf1.

	(selfNbOf0 = halfSize and: [ selfNbOf0 = lineNbOf0 ]) ifTrue: [
		self contents with: aTLine contents do: [ :item :other |
			(item value = 0 and: [ other value ~= item value ]) ifTrue: [ ^ false ] ].
		^ true ].

	(selfNbOf1 = halfSize and: [ selfNbOf1 = lineNbOf1 ]) ifTrue: [
		self contents with: aTLine contents do: [ :item :other |
			(item value = 1 and: [ other value ~= item value ]) ifTrue: [ ^ false ] ].
		^ true ].

	((selfNbOf1 = halfSize and: [ lineNbOf0 = halfSize ]) or: [
		 selfNbOf0 = halfSize and: [ lineNbOf1 = halfSize ] ]) ifTrue: [
		self contents with: aTLine contents do: [ :item :other |
			({
				 item value.
				 other value } count: #isNil) = 1 ifFalse: [ ^ false ] ].
		^ true ].
	^ false
]

{ #category : #testing }
TLine >> isValid [

	| nbOf0 nbOf1 length |
	nbOf0 := self nbOf0.
	nbOf1 := self nbOf1.
	length := self contents size.
	1 to: length - 2 do: [ :index |
		(self contents at: index) value ifNotNil: [
			(self contents at: index) value
			= (self contents at: index + 1) value and: [
				(self contents at: index + 1) value
				= (self contents at: index + 2) value ifTrue: [ ^ false ] ] ] ].

	^ (nbOf0 = nbOf1 and: [ nbOf0 = (length // 2) ]) or: [
		  nbOf0 <= (length // 2) and: [ nbOf1 <= (length // 2) ] ]
]

{ #category : #accessing }
TLine >> nbOf0 [ 
	^ self contents count: [ :box | box value = 0] 
]

{ #category : #accessing }
TLine >> nbOf1 [

	^ self contents count: [ :box | box value = 1 ]
]

{ #category : #printing }
TLine >> printOn: aStream [

	super printOn: aStream.
	aStream space.
	aStream nextPut: $[.
	self contents do: [ :each | aStream print: each ] separatedBy: [
		aStream nextPut: $,.
		aStream space.
		 ].
	aStream nextPut: $]
]
