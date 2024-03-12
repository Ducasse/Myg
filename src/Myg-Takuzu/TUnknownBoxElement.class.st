Class {
	#name : #TUnknownBoxElement,
	#superclass : #TBoxElement,
	#category : #'Myg-Takuzu-UI'
}

{ #category : #public }
TUnknownBoxElement >> click [

	self box click.
	self updateBackgroundColor 
]

{ #category : #'actions api' }
TUnknownBoxElement >> lock [ 

	^ self
]
