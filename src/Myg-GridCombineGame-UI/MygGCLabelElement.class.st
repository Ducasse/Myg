"
I'm an element that wraps a `BlTextElement` that is convenient to do a graphical representation of a `GCTile` as well as an overlay message that is shown when the game finishes.
"
Class {
	#name : #MygGCLabelElement,
	#superclass : #MygGCElement,
	#instVars : [
		'label'
	],
	#category : #'Myg-GridCombineGame-UI'
}

{ #category : #initialization }
MygGCLabelElement >> initialize [

	super initialize.

	label := BlTextElement new.

	self addChild: label as: #label
]

{ #category : #accessing }
MygGCLabelElement >> label [

	^ label
]

{ #category : #accessing }
MygGCLabelElement >> text: aBlRopedText [
	
	label text: aBlRopedText
]
