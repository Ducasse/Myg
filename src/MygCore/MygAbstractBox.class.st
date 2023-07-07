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
MygAbstractBox >> field [ 
	^ field 
]

{ #category : #accessing }
MygAbstractBox >> field: aTField [ 
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
