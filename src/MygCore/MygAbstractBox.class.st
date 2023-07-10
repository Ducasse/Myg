Class {
	#name : #MygAbstractBox,
	#superclass : #Object,
	#instVars : [
		'field',
		'position'
	],
	#category : #MygCore
}

{ #category : #accessing }
MygAbstractBox >> board [ 
	^ field 
]

{ #category : #accessing }
MygAbstractBox >> board: aTField [ 
	field := aTField 
]

{ #category : #accessing }
MygAbstractBox >> position [ 
	^ position
]

{ #category : #accessing }
MygAbstractBox >> position: aPoint [ 
	position := aPoint 
]
