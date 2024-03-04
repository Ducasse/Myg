"
I'm an extension to `BlElement` that provides animated transitions to certain element properties.
"
Class {
	#name : #MygGCElement,
	#superclass : #BlElement,
	#instVars : [
		'transitionByName'
	],
	#category : #'Myg-GridCombineGame-UI'
}

{ #category : #initialization }
MygGCElement >> initialize [

	super initialize.
	
	transitionByName := Dictionary new
]

{ #category : #'instance creation' }
MygGCElement >> newOpacityAnimationFrom: from to: to [

	^ BlNumberTransition new
			from: from;
			to: to;
			onStepDo: [ :f | super opacity: f ];
			yourself
]

{ #category : #'instance creation' }
MygGCElement >> newTransformationAnimationFrom: startElementTransformation to: endElementTransformation [

	| cachedTransformation fromMatrix toMatrix |
	cachedTransformation :=
		endElementTransformation asCachedTransformation.
	cachedTransformation boundingRectangle:
		self bounds inLocal asRectangle.

	fromMatrix := startElementTransformation matrix copy.
	toMatrix := cachedTransformation matrix.

"	toMatrix = fromMatrix ifTrue: [ 'same matrix!' traceCr ]."

	^ BlNumberTransition new
			from: 0.0;
			to: 1.0;
			onStepDo: [ :f |
				super transformation:
					(BlElementAbsoluteTransformation matrix:
						(fromMatrix interpolate: f to: toMatrix)) ];
			yourself
]

{ #category : #accessing }
MygGCElement >> opacity: aNumber [

	| aTransition anAnimation |
	aNumber = self opacity ifTrue: [ ^self ].

	aTransition := transitionByName
		at: #opacity
		ifAbsent: [ ^ super opacity: aNumber ].
	
	aTransition duration isZero ifTrue: [
		^ super opacity: aNumber ].

	aTransition isRunning ifTrue: [
		self notYetImplemented ].

	anAnimation :=
		(self newOpacityAnimationFrom: self opacity to: aNumber)
			duration: aTransition duration;
			easing: aTransition easing;
			yourself.

	aTransition animation: anAnimation.
	self addAnimation: anAnimation
]

{ #category : #accessing }
MygGCElement >> transformation: anElementTransformation [

	| aTransition |
	aTransition := transitionByName
		at: #transformation
		ifAbsent: [ ^ super transformation: anElementTransformation ].
	
	aTransition isRunning ifTrue: [
		self notYetImplemented ].

	self whenLayoutedDoOnce: [
		| anAnimation |
		anAnimation :=
			(self
				newTransformationAnimationFrom: self transformation
				to: anElementTransformation)
					duration: aTransition duration;
					easing: aTransition easing;
					yourself.

		aTransition animation: anAnimation.
		self addAnimation: anAnimation ]
]

{ #category : #accessing }
MygGCElement >> transitionAt: aName [

	^ transitionByName
			at: aName
			ifAbsentPut: [ MygGCElementTransition new ]
]

{ #category : #accessing }
MygGCElement >> transitionAt: aName duration: aDuration [

	(self transitionAt: aName) duration: aDuration

]

{ #category : #accessing }
MygGCElement >> transitionAt: aName easing: aBlInterpolator [

	(self transitionAt: aName) easing: aBlInterpolator
]
