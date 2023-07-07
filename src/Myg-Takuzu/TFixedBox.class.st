Class {
	#name : #TFixedBox,
	#superclass : #TBox,
	#category : #'Myg-Takuzu-Core'
}

{ #category : #accessing }
TFixedBox class >> value: aNumber [
	^ self new value: aNumber 
]

{ #category : #'as yet unclassified' }
TFixedBox >> click [
	"will send an announcements for the ui to show other TBoxSet"
	^ self 
]

{ #category : #testing }
TFixedBox >> isTSetBox [ 
	
	^ true 
]
