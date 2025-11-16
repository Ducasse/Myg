Class {
	#name : 'SGBuildRandom',
	#superclass : 'SGBuildBoxStrategy',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
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
