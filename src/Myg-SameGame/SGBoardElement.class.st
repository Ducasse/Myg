Class {
	#name : #SGBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'grid',
		'sameGameBoard'
	],
	#category : #'Myg-SameGame-UI'
}

{ #category : #clicking }
SGBoardElement >> clickOn: aPosition [

	self sameGameBoard hitBoxOnx: aPosition x y: aPosition y
]

{ #category : #accessing }
SGBoardElement >> grid [

	^ grid
]

{ #category : #accessing }
SGBoardElement >> grid: aSameGameBoardGrid [

	grid := CTNewArray2D
		        width: aSameGameBoardGrid width
		        height: aSameGameBoardGrid height
		        tabulate: [ :col :row |
			        | elt box |
					  box := (aSameGameBoardGrid at: col @ row).
			        elt := (SGBoxElement createWithBox: box)
				               gridPosition: col @ row;
				               board: self.
			        self addChild: elt.
			        elt ].

	self setGridLayout: aSameGameBoardGrid width
]

{ #category : #accessing }
SGBoardElement >> sameGameBoard [

	^ sameGameBoard
]

{ #category : #accessing }
SGBoardElement >> sameGameBoard: aSameGameBoard [

	sameGameBoard := aSameGameBoard
]

{ #category : #initialization }
SGBoardElement >> setGridLayout: width [

	self layout: (BlGridLayout horizontal
			 columnCount: width;
			 cellSpacing: 5).
	self background: Color veryLightGray. 
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ].
	self padding: (BlInsets all: 5)
]