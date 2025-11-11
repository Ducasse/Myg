Class {
	#name : 'SGBuildRandom',
	#superclass : 'SGBuildBoxStrategy',
	#category : 'Myg-SameGame',
	#package : 'Myg-SameGame'
}

{ #category : 'as yet unclassified' }
SGBuildRandom >> buildBox [

	| states |
	states := {
		          SGBlueState.
		          SGRedState.
		          SGGreenState.
		          SGYellowState }.
	^ SGBox withState: states atRandom uniqueInstance
]
