"
This class contains tests
"
Class {
	#name : #MAbstractTest,
	#superclass : #TestCase,
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #'test ressources' }
MAbstractTest >> matrixForField [
	^ (Array2D rows: 5 columns: 5)
			at: 1 at: 1 put: MymBox unknown;
			at: 1 at: 2 put: MymBox unknown;
			at: 1 at: 3 put: MymBox mine;
			at: 1 at: 4 put: MymBox unknown;
			at: 1 at: 5 put: MymBox unknown;
			at: 2 at: 1 put: MymBox unknown;
			at: 2 at: 2 put: MymBox unknown;
			at: 2 at: 3 put: MymBox mine;
			at: 2 at: 4 put: MymBox unknown;
			at: 2 at: 5 put: MymBox unknown;
			at: 3 at: 1 put: MymBox mine;
			at: 3 at: 2 put: MymBox mine;
			at: 3 at: 3 put: MymBox mine;
			at: 3 at: 4 put: MymBox unknown;
			at: 3 at: 5 put: MymBox unknown;
			at: 4 at: 1 put: MymBox unknown;
			at: 4 at: 2 put: MymBox unknown;
			at: 4 at: 3 put: MymBox unknown;
			at: 4 at: 4 put: MymBox mine;
			at: 4 at: 5 put: MymBox mine;
			at: 5 at: 1 put: MymBox mine;
			at: 5 at: 2 put: MymBox unknown;
			at: 5 at: 3 put: MymBox unknown;
			at: 5 at: 4 put: MymBox unknown;
			at: 5 at: 5 put: MymBox unknown;
			yourself
]
