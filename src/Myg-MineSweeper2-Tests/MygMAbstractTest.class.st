"
This class contains tests
"
Class {
	#name : #MygMAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper2-Tests'
}

{ #category : #'test ressources' }
MygMAbstractTest >> matrixForField [

	^ (CTNewArray2D
			    width: 5
			    height: 5
			    tabulate: [ :column :row | MygMBox unknown ])
			   at: 1 @ 3 put: MygMBox mine;
			   at: 1 @ 5 put: MygMBox mine;
			   at: 2 @ 3 put: MygMBox mine;
			   at: 3 @ 1 put: MygMBox mine;
			   at: 3 @ 2 put: MygMBox mine;
			   at: 3 @ 3 put: MygMBox mine;
			   at: 4 @ 4 put: MygMBox mine;
			   at: 5 @ 4 put: MygMBox mine;
			   yourself
]

{ #category : #running }
MygMAbstractTest >> setUp [

	field := MygMBoard createWithMatrix: self matrixForField
]
