Class {
	#name : 'SGBoard',
	#superclass : 'MygBoard',
	#instVars : [
		'game',
		'hitList'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'compute' }
SGBoard >> boxAt: aPoint [

	^ self grid at: aPoint x @ aPoint y
]

{ #category : 'compute' }
SGBoard >> calculePoint [

	^ hitList size * hitList size
]

{ #category : 'accessing' }
SGBoard >> game [

	^ game
]

{ #category : 'accessing' }
SGBoard >> game: aGame [

	game := aGame
]

{ #category : 'reorganize' }
SGBoard >> generateGridWidth: width height: height [

	| array2D |
	array2D := CTNewArray2D
		           width: width
		           height: height
		           tabulate: [ :col :row | self randomBox ].
	self configureGrid: array2D
]

{ #category : 'hit' }
SGBoard >> hitBox: aBox [

	aBox hasNullState ifTrue: [ ^ self ].
	aBox propagateClick.
	self hitList size > 1 ifTrue: [
		self hitList do: [ :each | each state: SGNullState uniqueInstance ] ].

	self game addPoints: self calculePoint.

	self hitList do: [ :each | self reorganizeColumn: each x ].

	self hitList removeAll.

	self reorganizeForEmptyColumn
]

{ #category : 'hit' }
SGBoard >> hitBoxOnx: x y: y [

	(self grid at: x @ y) hasNullState ifTrue: [ ^ self ].
	(self grid at: x @ y) propagateClick.
	self hitList size > 1 ifTrue: [
		self hitList do: [ :each | each state: SGNullState uniqueInstance  ] ].

	self game addPoints: self calculePoint.

	self hitList do: [ :each | self reorganizeColumn: each x ].

	self hitList removeAll.

	self reorganizeForEmptyColumn
]

{ #category : 'accessing' }
SGBoard >> hitList [ 

	^ hitList 
]

{ #category : 'initialization' }
SGBoard >> initialize [

	super initialize.
	hitList := OrderedCollection new.
	"stackHit := Stack new -> has no reference"
	"stock les cases touchées"
]

{ #category : 'accessing' }
SGBoard >> isColumnEmpty: x [

	1 to: self grid height do: [ :i |
	(self boxAt: x @ i) hasNullState ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'random subclass instance creation' }
SGBoard >> randomBox [

	| states |
	states := {
		          SGBlueState.
		          SGRedState.
		          SGGreenState.
		          SGYellowState }.
	^ SGBox withState: states atRandom uniqueInstance 
]

{ #category : 'reorganize' }
SGBoard >> reorganizeColumn: x [

	| col newCol |
	col := self grid atColumn: x.
	newCol := col reject: [ :each | each hasNullState ].
	1 to: newCol size do: [ :i | (col at: i) state: (newCol at: i) state ].
	newCol size + 1 to: col size do: [ :j |
	(col at: j) state: SGNullState uniqueInstance ]
]

{ #category : 'reorganize' }
SGBoard >> reorganizeForEmptyColumn [

	| cpt |
	cpt := 0.
	1 to: self grid width do: [ :i |
		(self isColumnEmpty: i - cpt) ifTrue: [
			i - cpt to: self grid width - 1 - cpt do: [ :j |
				self switchColumn: j withColumn: j + 1 ].
			cpt := cpt + 1 ] ]
]

{ #category : 'compute' }
SGBoard >> switchBox: aPoint1 with: aPoint2 [

	| box1 box2 tmpState |
	box1 := self boxAt: aPoint1.
	box2 := self boxAt: aPoint2.
	box1 state = box2 state ifTrue: [ ^ self ].
	"This will avoid calling announcements later"
	tmpState := box1 state.
	box1 state: box2 state.
	box2 state: tmpState 
]

{ #category : 'compute' }
SGBoard >> switchColumn: firstColumn withColumn: secondColumn [

	1 to: self grid height do: [ :i |
	self switchBox: firstColumn @ i with: secondColumn @ i ]
]
