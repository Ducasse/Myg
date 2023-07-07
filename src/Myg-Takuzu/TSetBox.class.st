Class {
	#name : #TSetBox,
	#superclass : #TBox,
	#category : #'Myg-Takuzu-Core'
}

{ #category : #accessing }
TSetBox class >> value: aNumber [
	^ self new value: aNumber 
]

{ #category : #'as yet unclassified' }
TSetBox >> click [
	"will send an announcements for the ui to show other TBoxSet"
	^ self 
]

{ #category : #testing }
TSetBox >> isTSetBox [ 
	
	^ true 
]
