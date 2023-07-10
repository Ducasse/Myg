Class {
	#name : #MygBoard,
	#superclass : #Object,
	#instVars : [
		'grid'
	],
	#category : #MygCore
}

{ #category : #'point functions' }
MygBoard class >> configureGrid: aCTNewArray2D [

	^ self new
		  configureGrid: aCTNewArray2D;
		  yourself
]

{ #category : #'public api - configure' }
MygBoard >> configureGrid: anArray2D [
	"anArray@d is filled up with elements. Make sure that each element has is backpointer set to the board."
	
	self grid: anArray2D.
	grid withIndexes: [ :column :row |
		(grid at: column @ row) position: column @ row;
		board: self   ]
]

{ #category : #accessing }
MygBoard >> grid [ 
	^ grid 
]

{ #category : #accessing }
MygBoard >> grid: anArray2D [
	
	grid := anArray2D.
	
]
