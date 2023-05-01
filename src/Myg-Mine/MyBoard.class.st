Class {
	#name : #MyBoard,
	#superclass : #Object,
	#instVars : [
		'map',
		'groundCharacters',
		'onTopCharacters'
	],
	#category : #'Myg-Mine-Core'
}

{ #category : #'instance creation' }
MyBoard class >> extent: aPoint [

	^ self basicNew extent: aPoint; yourself
]

{ #category : #'instance creation' }
MyBoard class >> new [

	^ self extent: 30@12
]

{ #category : #visiting }
MyBoard >> accept: aMVisitor [
	^ aMVisitor visitBoard: self
]

{ #category : #printing }
MyBoard >> asciiString [ 

	^ String streamContents: [ :st | self printNicelyOn: st ]	

]

{ #category : #accessing }
MyBoard >> atPosition: aCpPositionable [ 
	^ (map atX: aCpPositionable x atY: aCpPositionable y)
]

{ #category : #'element access' }
MyBoard >> atX: xCoord atY: yCoord [

	^ map atX: xCoord atY: yCoord
]

{ #category : #'element access' }
MyBoard >> atX: anInteger atY: anInteger2 put: anElement [
	map atX: anInteger atY: anInteger2 put: anElement 
]

{ #category : #inspector }
MyBoard >> basicPrintOnInspector [
	<inspectorPresentationOrder: 35 title: 'Myg'>

	^ SpTextPresenter new 
		text: self asciiString;
		yourself
]

{ #category : #iterating }
MyBoard >> bottomUpDo: aBlock [
	"Execute the block on each element of the board"
	
	map leftToRightFromBottomToTopDo: aBlock
]

{ #category : #building }
MyBoard >> buildLandcape [
	
	"for now we define the same neighbor computation"
	map leftToRightFromBottomToTopDo: [ :each |
		each neighBouring: [ :aTile | 
	
				aTile position eightNeighbors
					do: [ :position |		
							(each board atPosition: position) isBomb ifTrue: [ each incrementStatus ] ] ] ]
]

{ #category : #building }
MyBoard >> buildMapWidth: x height: y [

	map := CTArray2D width: x height: y.
	map rowsAndColumnsDo: [ :row :column |
		self initializeElement: self groundClass new atX: column Y: row ]
]

{ #category : #accessing }
MyBoard >> columnNumber [
	^ map numberOfColumns
]

{ #category : #iterating }
MyBoard >> cornersDo: aBlock [
	"Execute the block on each corner of the board"
	
	aBlock value: (self atX: 1 atY: 1).
	aBlock value: (self atX: 1 atY: self lineNumber).
	aBlock value:  (self atX: self columnNumber atY: self lineNumber).
	aBlock value:  (self atX: self columnNumber atY: 1).
	
]

{ #category : #iterating }
MyBoard >> do: aBlock [
	"Execute the block on each element of the board"
	
	map do: aBlock
]

{ #category : #accessing }
MyBoard >> extent: aPoint [
	
	self buildMapWidth: aPoint x height: aPoint y 
]

{ #category : #building }
MyBoard >> groundClass [

	^ MyTile
]

{ #category : #building }
MyBoard >> initializeElement: anElement atX: xCoord Y: yCoord [

	anElement setBoard: self.
	anElement basicPosition: xCoord @ yCoord.
	self atX: xCoord atY: yCoord put: anElement.
	anElement postCreationAction.
]

{ #category : #accessing }
MyBoard >> lineNumber [
	^ map numberOfRows
]

{ #category : #printing }
MyBoard >> printNicelyOn: aStream [
	
	(self lineNumber to: 1 by: -1) 
		do: [ :yCoord |
			1 to: self columnNumber do: [ :xCoord |
				| el |
				el := (self atX: xCoord atY: yCoord).
				aStream nextPut: el class textualMapCharacter]]
		separatedBy: [ aStream cr ]
]
