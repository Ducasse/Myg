Class {
	#name : 'TUnknownBoxElement',
	#superclass : 'TBoxElement',
	#category : 'Myg-Takuzu-UI',
	#package : 'Myg-Takuzu',
	#tag : 'UI'
}

{ #category : 'public' }
TUnknownBoxElement >> click [

	self box click.
	self updateBackgroundColor 
]

{ #category : 'actions api' }
TUnknownBoxElement >> lock [ 

	^ self
]
