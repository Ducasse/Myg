Class {
	#name : 'SGGame',
	#superclass : 'Object',
	#instVars : [
		'board',
		'points'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGGame >> addPoints: numberOfPoints [

	points := points + numberOfPoints
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
	self points: 0
]

{ #category : 'accessing' }
SGGame >> points [

	^ points
]

{ #category : 'accessing' }
SGGame >> points: numberOfPoints [

	points := numberOfPoints
]
