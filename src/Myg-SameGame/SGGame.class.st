Class {
	#name : 'SGGame',
	#superclass : 'Object',
	#instVars : [
		'board',
		'points',
		'announcer',
		'scoreStrategyCalculator'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGGame >> addPoints: numberOfPoints [

	self points: points + numberOfPoints
]

{ #category : 'accessing' }
SGGame >> addPointsFor: hitList [

	self addPoints: (self scoreStrategyCalculator calculePoint: hitList)
]

{ #category : 'accessing' }
SGGame >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'accessing' }
SGGame >> grid [

	^ board
]

{ #category : 'accessing' }
SGGame >> grid: aBoard [

	board := aBoard
]

{ #category : 'initialization' }
SGGame >> initialize [

	super initialize.
	self points: 0.
	
	scoreStrategyCalculator := SGCalculeScoreDefault new.
]

{ #category : 'accessing' }
SGGame >> points [

	^ points
]

{ #category : 'accessing' }
SGGame >> points: numberOfPoints [

	points := numberOfPoints.
	
	self announcer announce: SGScoreChangedAnnouncement new.
]

{ #category : 'accessing' }
SGGame >> scoreStrategyCalculator [

	^ scoreStrategyCalculator
]
