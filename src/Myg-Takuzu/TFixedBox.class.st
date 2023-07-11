Class {
	#name : #TFixedBox,
	#superclass : #TBox,
	#category : #'Myg-Takuzu-Core'
}

{ #category : #accessing }
TFixedBox class >> createBoxWithValue: aNumber [

	^ self new value: aNumber
]

{ #category : #interaction }
TFixedBox >> click [
	"will send an announcements for the ui to show other TBoxSet"
	^ self 
]

{ #category : #testing }
TFixedBox >> isTFixedBox [ 
	
	^ true 
]
