"
I hold information about a `GCElement` animated transition.
"
Class {
	#name : #MygGCElementTransition,
	#superclass : #Object,
	#instVars : [
		'duration',
		'easing',
		'animation'
	],
	#category : #'Myg-GridCombineGame-UI'
}

{ #category : #GC2048Skin }
MygGCElementTransition >> animation [

	^ animation
]

{ #category : #GC2048Skin }
MygGCElementTransition >> animation: aBlAnimation [

	self isRunning ifTrue: [ self notYetImplemented ].

	animation := aBlAnimation
]

{ #category : #GC2048Skin }
MygGCElementTransition >> duration [

	^ duration
]

{ #category : #GC2048Skin }
MygGCElementTransition >> duration: aDuration [

	aDuration isZero ifTrue: [
		self notYetImplemented ].
	self isRunning ifTrue: [
		self notYetImplemented ].

	duration := aDuration
]

{ #category : #GC2048Skin }
MygGCElementTransition >> easing [

	^ easing
]

{ #category : #GC2048Skin }
MygGCElementTransition >> easing: aBlInterpolator [

	self isRunning ifTrue: [ self notYetImplemented ].

	easing := aBlInterpolator
]

{ #category : #initialization }
MygGCElementTransition >> initialize [

	super initialize.
	
	duration := 0 seconds.
	easing := BlLinearInterpolator default
]

{ #category : #testing }
MygGCElementTransition >> isRunning [
	
	^ animation isNotNil and: [ animation isRunning ]
]
