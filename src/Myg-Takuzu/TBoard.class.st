Class {
	#name : #TBoard,
	#superclass : #MygBoard,
	#category : #'Myg-Takuzu-Core'
}

{ #category : #translating }
TBoard class >> generate [

	^ self generateWithSize: 4
]

{ #category : #translating }
TBoard class >> generateWithSize: aNumber [

	^ (self newSquaredSize: aNumber)
		  initializeRandomized;
		  yourself
]

{ #category : #'for tests' }
TBoard class >> gridForTest [
	"represents this grid: 
	
	| 1 | _ | _ | _ |
	| _ | _ | 1 | 0 | 
	| _ | 1 | 1 | _ |
	| _ | _ | _ | _ |"

	^ self configureGrid: ((CTNewArray2D width: 4 height: 4)
			   at: 1 @ 1 put: (TBox createFixedBox: 1);
			   at: 1 @ 2 put: TBox createUnknownBox;
			   at: 1 @ 3 put: TBox createUnknownBox;
			   at: 1 @ 4 put: TBox createUnknownBox;
			   at: 2 @ 1 put: TBox createUnknownBox;
			   at: 2 @ 2 put: TBox createUnknownBox;
			   at: 2 @ 3 put: (TBox createFixedBox: 1);
			   at: 2 @ 4 put: TBox createUnknownBox;
			   at: 3 @ 1 put: TBox createUnknownBox;
			   at: 3 @ 2 put: (TBox createFixedBox: 1);
			   at: 3 @ 3 put: (TBox createFixedBox: 1);
			   at: 3 @ 4 put: TBox createUnknownBox;
			   at: 4 @ 1 put: TBox createUnknownBox;
			   at: 4 @ 2 put: (TBox createFixedBox: 0);
			   at: 4 @ 3 put: TBox createUnknownBox;
			   at: 4 @ 4 put: TBox createUnknownBox;
			   yourself)
]

{ #category : #level10 }
TBoard class >> level10Grid1 [

	| level |
	level := '_11__1__1_
_10__10_0_
___0______
__1______1
1___0_0___
___0_10___
1_1_____0_
__1______0
_0____1_1_
1______11_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level10 }
TBoard class >> level10Grid2 [

	| level |
	level := '0_0__01_10
_________1
_1________
_0_____1_0
__1__0_1_1
____11____
_00______0
____0_____
__0__1____
_0__0_0___'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level10 }
TBoard class >> level10Grid3 [

	| level |
	level := '_1______10
___1_1_0__
__1_11____
____1____0
_0_____10_
_0_____00_
___10_____
11_____11_
_____11___
___0____1_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level10 }
TBoard class >> level10Grid4 [

	| level |
	level := '0_0___1___
1_1___11__
____1_0_0_
__00______
______1___
_11______1
____1__00_
01___0_0__
_____1__1_
1_1_1_____'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level10 }
TBoard class >> level10Grid5 [

	| level |
	level := '01_1______
_00__0____
___01__1__
0_____0___
__00___1__
_10_1____1
______1__0
_0________
__1___1_1_
___0__1_1_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level12 }
TBoard class >> level12Grid1 [

	| level |
	level := '_1__11______
__11___1____
11_________1
__00___0_0__
_____0__0___
0__0_00_00__
_101_1___0__
___1____0_1_
1___0__0_1__
__0_01_____0
_______0__01
____1__11___'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level12 }
TBoard class >> level12Grid2 [

	| level |
	level := '_____0______
0___1______1
__1___1__0_1
__11__1_____
0____00101_0
_____01_0___
_10____11__0
10_1__11_110
_1___1____0_
______11_1__
0__0_______0
1______00___'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level12 }
TBoard class >> level12Grid3 [

	| level |
	level := '0_01__01___1
0____1_1__1_
_0_0_____0__
___0___0_00_
__1_________
____0_0_0__1
_0___1___0__
_0_________1
__1____1__1_
0__0____1___
_____0_0_0_1
__0___1_____'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level12 }
TBoard class >> level12Grid4 [

	| level |
	level := '__1_______0_
_0______1___
____1_00_0__
__0_1_______
__0____0_1_0
1____0_0____
______1_00__
_1_1______1_	
____0_0__0__
11_0________
___1_1__00__
1_0__1____0_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level12 }
TBoard class >> level12Grid5 [

	| level |
	level := '__1_1__0____
___0_0_0___0
1________1__
_0___1_0___0
____1______0
______1__0__
___0_01_10__
01__________
0_____1_____
__10__1_1___
1___1__0__0_
_____1____0_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level4 }
TBoard class >> level4Grid1 [

	| level |
	level := '_1_1
_00_
0___
____'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level4 }
TBoard class >> level4Grid2 [

	| level |
	level := '___0
_0_0
____
_00_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level4 }
TBoard class >> level4Grid3 [

	| level |
	level := '1___
_1__
_10_
___0'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level4 }
TBoard class >> level4Grid4 [

	| level |
	level := '1___
1__1
_0__
____'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level4 }
TBoard class >> level4Grid5 [

	| level |
	level := '_1_1
_10_
____
___0'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level6 }
TBoard class >> level6Grid1 [

	| level |
	level := '______
_0_00_
11__1_
__0__0
______
____1_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level6 }
TBoard class >> level6Grid2 [

	| level |
	level := '______
1_11__
___1__
0____0
0_____
_0____'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level6 }
TBoard class >> level6Grid3 [

	| level |
	level := '___0__
1_____
_11___
____1_
1___0_
_11___'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level6 }
TBoard class >> level6Grid4 [

	| level |
	level := '0____1
01_1__
____1_
1__11_
______
______'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level6 }
TBoard class >> level6Grid5 [

	| level |
	level := '_____0
_1__0_
_11_0_
______
___1__
___1__'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level8 }
TBoard class >> level8Grid1 [

	| level |
	level := '0__0____
0______0
__00____
_1______
_____0_0
__0__00_
_0______
11___10_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level8 }
TBoard class >> level8Grid2 [

	| level |
	level := '____1___
_1______
0______1
__0_1___
_1_0_0_1
________
__00____
_1______'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level8 }
TBoard class >> level8Grid3 [

	| level |
	level := '__11____
1_0__1__
___0___1
__00___1
00______
________
__11__01
______0_'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level8 }
TBoard class >> level8Grid4 [

	| level |
	level := '__11____
________
_00__0_0
___0_0__
1_1_____
________
10__11__
___1____'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #level8 }
TBoard class >> level8Grid5 [

	| level |
	level := '___0___1
__0_____
0_00__0_
____11_0
1______0
____0_0_
________
0_____01'.


	^ self configureGrid:
		  (MygLevelImporter fromString: level fromPackage: self package)
]

{ #category : #'instance creation' }
TBoard class >> newSquaredSize: aNumber [

	^ self new
		  configureGrid: (CTNewArray2D
				   width: aNumber
				   height: aNumber
				   tabulate: [ :x :y | TFixedBox createBoxWithValue: nil ])
]

{ #category : #testing }
TBoard >> checkIfFinished [

	(self isFull and: [ self isValid ]) ifTrue: [ self endGame ]
]

{ #category : #actions }
TBoard >> clickOnBox: aTBox [

	| box |
	box := self grid atColumn: aTBox position x atRow: aTBox position y.

	box configureValue.
	self checkIfFinished
]

{ #category : #actions }
TBoard >> endGame [

	| container space |
	container := BlElement new
		             background: Color veryDarkGray;
		             layout: BlFrameLayout new;
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical matchParent ].

	container addChild: ((BlTextElement new text: ('Victory' asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 50)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).

	space := OBlSpace new.
	space root addChild: container.
	space
		pulse;
		extent: 300 @ 300;
		show.
	^ space
]

{ #category : #initialization }
TBoard >> initializeRandomized [

	self 
		 solve;
		  permutateLines;
		  removeRandomBoxes
]

{ #category : #testing }
TBoard >> isColumnUniqueAtIndex: aNumber [

	| testedColumn columns |
	testedColumn := TLine new contents: (self grid atColumn: aNumber).
	columns := (self grid columns) asOrderedCollection collect: [ :each | each asTLine ].
	1 to: aNumber do: [ :i | columns removeFirst ].


	^ self isThisLineUnique: testedColumn amongArray: columns
]

{ #category : #testing }
TBoard >> isColumnValidAtIndex: aNumber [

	| testedColumn |
	testedColumn := TLine new contents: (self grid atColumn: aNumber).
	^ testedColumn isValid
]

{ #category : #testing }
TBoard >> isFull [ 
	
	^ (self grid contents anySatisfy: [ :each | each value isNil ]) not
]

{ #category : #testing }
TBoard >> isRowUniqueAtIndex: aNumber [

	| testedRow rows |
	testedRow := TLine new contents: (self grid atRow: aNumber).
	rows := (self grid rows as: OrderedCollection ) collect: [ :each | each asTLine ].
	1 to: aNumber do: [ :i | rows removeFirst ].

	^ self isThisLineUnique: testedRow amongArray: rows 
]

{ #category : #testing }
TBoard >> isRowValidAtIndex: aNumber [

	^ (TLine new contents: (self grid atRow: aNumber)) isValid.

]

{ #category : #testing }
TBoard >> isThisLineUnique: aTLine amongArray: anArray [
		

	^ (anArray anySatisfy: [ :line |
		   aTLine isSimilarTo: line ]) not
]

{ #category : #testing }
TBoard >> isValid [

	| columnIndex rowIndex |
	columnIndex := 1.
	rowIndex := 1.
	self grid columnsDo: [ :column |
		| line |
		line := TLine new contents: column.
		(line isValid and: [ self isColumnUniqueAtIndex: columnIndex ])
			ifFalse: [ ^ false ].
		columnIndex := columnIndex + 1 ].

	self grid rowsDo: [ :row |
		| line |
		line := TLine new contents: row.
		(line isValid and: [ self isRowUniqueAtIndex: rowIndex ]) ifFalse: [
			^ false ].
		rowIndex := rowIndex + 1 ].
	^ true
]

{ #category : #actions }
TBoard >> permutateLine: aFirstNumber with: aSecondNumber [

	| tmp |
	aFirstNumber = aSecondNumber ifTrue: [ ^ self ].
		tmp := self grid atRow: aFirstNumber.
		self grid atRow: aFirstNumber put: (self grid atRow: aSecondNumber).
		self grid atRow: aSecondNumber put: tmp
]

{ #category : #actions }
TBoard >> permutateLines [

	| array |
	array := 1 to: self grid width.
	array do: [ :i |
		| line1 line2 |
		line1 := array atRandom.
		line2 := array atRandom.
		self permutateLine: line1 with: line2 ]
]

{ #category : #removing }
TBoard >> removeRandomBoxes [

	self removeRandomBoxesWithRatio: 65
]

{ #category : #removing }
TBoard >> removeRandomBoxesWithRatio: aNumber [

	(aNumber > 0 and: [ aNumber < 100 ]) ifFalse: [ ^ self ].
	self grid withIndexes: [ :column :row |
		100 atRandom < aNumber ifTrue: [
			self grid at: column @ row put: (TUnknownBox new position: column @ row) ] ]
]

{ #category : #actions }
TBoard >> solve [

	^ (self solveTheField: self atColumn: 1 atRow: 1) ifTrue: [ 
		  self grid ]
	ifFalse: [ Error signal: 'Field not solvable' ]
]

{ #category : #actions }
TBoard >> solveTheField: aTField atColumn: columnIndex atRow: rowIndex [

	| box currentColumn currentRow |
	currentColumn := columnIndex.
	currentRow := rowIndex.

	columnIndex = (self grid width + 1) ifTrue: [
		rowIndex = self grid height ifTrue: [ ^ true ].
		currentColumn := 1.
		currentRow := rowIndex + 1 ].

	box := aTField grid atColumn: currentColumn atRow: currentRow.

	box value
		ifNotNil: [
			^ self
				  solveTheField: aTField
				  atColumn: currentColumn + 1
				  atRow: currentRow ]
		ifNil: [
			0 to: 1 do: [ :i |
				box value: i.
				self isValid
					ifTrue: [
						(self
							 solveTheField: aTField
							 atColumn: currentColumn + 1
							 atRow: currentRow) ifTrue: [ ^ true ] ]
					ifFalse: [ box value: nil ] ].
			^ false ]
]
