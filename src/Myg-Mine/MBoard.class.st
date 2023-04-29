Class {
	#name : #MBoard,
	#superclass : #Object,
	#instVars : [
		'map',
		'groundCharacters',
		'onTopCharacters'
	],
	#category : #'Myg-Mine'
}

{ #category : #'instance creation' }
MBoard class >> extent: aPoint [

	^ self basicNew extent: aPoint; yourself
]

{ #category : #'instance creation' }
MBoard class >> new [

	^ self extent: 30@12
]

{ #category : #printing }
MBoard >> asciiString [ 

	^ String streamContents: [ :st | self printNicelyOn: st ]	

]

{ #category : #'low level access' }
MBoard >> at: anInteger at: anInteger2 put: anElement [
	map at: anInteger at: anInteger2 put: anElement 
]

{ #category : #accessing }
MBoard >> atPosition: aCpPositionable [ 
	^ (map atX: aCpPositionable x atY: aCpPositionable y)
]

{ #category : #'low level access' }
MBoard >> atX: xCoord atY: yCoord [

	^ map atX: xCoord atY: yCoord
]

{ #category : #'low level access' }
MBoard >> atX: anInteger atY: anInteger2 put: anElement [
	map atX: anInteger atY: anInteger2 put: anElement 
]

{ #category : #inspector }
MBoard >> basicPrintOnInspector [
	<inspectorPresentationOrder: 35 title: 'Myg'>

	^ SpTextPresenter new 
		text: self asciiString;
		yourself
]

{ #category : #building }
MBoard >> bottomUpDo: aBlock [
	"Execute the block on each element of the board"
	
	map leftToRightFromBottomToTopDo: aBlock
]

{ #category : #building }
MBoard >> buildLandcape [
	
	"for now we define the same neighbor computation"
	map leftToRightFromBottomToTopDo: [ :each |
		each neighBouring: [ :aTile | 
	
				aTile position eightNeighbors
					do: [ :position |		
							(each board atPosition: position) isBomb ifTrue: [ each incrementStatus ] ] ] ]
]

{ #category : #building }
MBoard >> buildMapWidth: x height: y [

	map := CTArray2D 
				width: x height: y.
	map rowsAndColumnsDo: [ :row :column |
			self initializeElement: self groundClass new atX: column Y: row ]
]

{ #category : #accessing }
MBoard >> columnNumber [
	^ map numberOfColumns
]

{ #category : #building }
MBoard >> do: aBlock [
	"Execute the block on each element of the board"
	
	map do: aBlock
]

{ #category : #accessing }
MBoard >> extent: aPoint [

	self buildMapWidth: aPoint x height: aPoint y 
]

{ #category : #building }
MBoard >> groundClass [

	^ MTile
]

{ #category : #accessing }
MBoard >> height [
	^ map height
]

{ #category : #building }
MBoard >> initializeElement: anElement atX: xCoord Y: yCoord [

	anElement setBoard: self.
	anElement basicPosition: xCoord @ yCoord.
	self atX: xCoord atY: yCoord put: anElement.
	anElement postCreationAction.
]

{ #category : #accessing }
MBoard >> lineNumber [
	^ map numberOfRows
]

{ #category : #printing }
MBoard >> printNicelyOn: aStream [
	
	(self height to: 1 by: -1) 
		do: [ :yCoord |
			1 to: self width do: [ :xCoord |
				| el |
				el := (self atX: xCoord atY: yCoord).
				aStream nextPut: el class textualMapCharacter]]
		separatedBy: [ aStream cr ]
]

{ #category : #accessing }
MBoard >> width [
	^ map width
]
