Class {
	#name : 'SGBuildRandomWithWeightTuning',
	#superclass : 'SGBuildBoxStrategy',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGBuildRandomWithWeightTuning >> buildBox [
	| rand |
	rand:= 100 atRandom.
	
	rand <= 10 ifTrue: [^ SGBox withState:SGBlueState uniqueInstance].
	rand <= 30 ifTrue: [^ SGBox withState:SGRedState uniqueInstance].
	rand <=60 ifTrue: [^ SGBox withState:SGGreenState uniqueInstance].
	rand > 60 ifTrue: [^ SGBox withState:SGYellowState uniqueInstance].
]
