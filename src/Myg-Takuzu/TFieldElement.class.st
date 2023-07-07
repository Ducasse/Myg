Class {
	#name : #TFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'field'
	],
	#category : #'Myg-Takuzu-UI'
}

{ #category : #'as yet unclassified' }
TFieldElement class >> launch10 [

	^ self openWithModel: (TField generateWithSize: 10)
]

{ #category : #'as yet unclassified' }
TFieldElement class >> launch12 [

	^ self openWithModel: (TField generateWithSize: 12)
]

{ #category : #'as yet unclassified' }
TFieldElement class >> launch4 [

	^ self openWithModel: (TField generateWithSize: 4)
]

{ #category : #'as yet unclassified' }
TFieldElement class >> launch6 [

	^ self openWithModel: (TField generateWithSize: 6)
]

{ #category : #'as yet unclassified' }
TFieldElement class >> launch8 [

	^ self openWithModel: (TField generateWithSize: 8)
]

{ #category : #'as yet unclassified' }
TFieldElement class >> openGridForTest [

	^ self openWithModel: TField gridForTest 
]

{ #category : #'as yet unclassified' }
TFieldElement class >> openRandom [

	^ self openWithModel: TField generate
]

{ #category : #'as yet unclassified' }
TFieldElement class >> openRandomFromTestGrids [ 
	| sel res |
	sel := (TFieldTool class selectors select: [ :each | each  beginsWith: 'grid_' ]) atRandom.
	res := TFieldTool perform: sel.
	^ self openWithModel: res
]

{ #category : #'as yet unclassified' }
TFieldElement class >> openWithModel: aTField [

	| aFieldElement space |
	space := BlSpace new.
	aFieldElement := self new
		                 field: aTField;
		                 yourself.
	space addChild: aFieldElement.
	space pulse
		extent: 500 @ 500;
		resizable: false;
		show
]

{ #category : #accessing }
TFieldElement >> field [ 
	^field
]

{ #category : #accessing }
TFieldElement >> field: aTField [

	field := aTField.
	self layout: (BlGridLayout horizontal cellSpacing: 5 - (field grid width // 5 )).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ].
	self padding: (BlInsets all: 5).
	self layout columnCount: field grid width.
	field grid do: [ :aBox |
		| boxElement |
		boxElement := (TBoxElement box: aBox) field: aTField.
		self addChild: boxElement ]
]

{ #category : #initialization }
TFieldElement >> initialize [

	super initialize.
	self background: (BlBackground paint: Color veryVeryDarkGray).
	
]
