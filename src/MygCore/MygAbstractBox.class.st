Class {
	#name : #MygAbstractBox,
	#superclass : #Object,
	#instVars : [
		'position',
		'board'
	],
	#category : 'MygCore'
}

{ #category : #accessing }
MygAbstractBox >> board [ 
	^ board 
]

{ #category : #accessing }
MygAbstractBox >> board: aMygBoard [

	board := aMygBoard
]

{ #category : #accessing }
MygAbstractBox >> position [ 
	^ position
]

{ #category : #accessing }
MygAbstractBox >> position: aPoint [ 
	position := aPoint 
]
