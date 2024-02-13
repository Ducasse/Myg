"
This class contains tests
"
Class {
	#name : #MAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #'test ressources' }
MAbstractTest >> matrixForField [

	^ (CTNewArray2D
			    width: 5
			    height: 5
			    tabulate: [ :column :row | MBox safe ])
			   at: 1 @ 3 put: MBox mine;
			   at: 1 @ 5 put: MBox mine;
			   at: 2 @ 3 put: MBox mine;
			   at: 3 @ 1 put: MBox mine;
			   at: 3 @ 2 put: MBox mine;
			   at: 3 @ 3 put: MBox mine;
			   at: 4 @ 4 put: MBox mine;
			   at: 5 @ 4 put: MBox mine;
			   yourself
]

{ #category : #running }
MAbstractTest >> setUp [

	field := MBoard createWithMatrix: self matrixForField
]
