Class {
	#name : #MAbstractTest,
	#superclass : #TestCase,
	#category : #'Myg-MineSweeper-Tests'
}

{ #category : #'test ressources' }
MAbstractTest >> matrixForField [
	^ (Array2D rows: 5 columns: 5)
			at: 1 at: 1 put: MBox unknown;
			at: 1 at: 2 put: MBox unknown;
			at: 1 at: 3 put: MBox mine;
			at: 1 at: 4 put: MBox unknown;
			at: 1 at: 5 put: MBox unknown;
			at: 2 at: 1 put: MBox unknown;
			at: 2 at: 2 put: MBox unknown;
			at: 2 at: 3 put: MBox mine;
			at: 2 at: 4 put: MBox unknown;
			at: 2 at: 5 put: MBox unknown;
			at: 3 at: 1 put: MBox mine;
			at: 3 at: 2 put: MBox mine;
			at: 3 at: 3 put: MBox mine;
			at: 3 at: 4 put: MBox unknown;
			at: 3 at: 5 put: MBox unknown;
			at: 4 at: 1 put: MBox unknown;
			at: 4 at: 2 put: MBox unknown;
			at: 4 at: 3 put: MBox unknown;
			at: 4 at: 4 put: MBox mine;
			at: 4 at: 5 put: MBox mine;
			at: 5 at: 1 put: MBox mine;
			at: 5 at: 2 put: MBox unknown;
			at: 5 at: 3 put: MBox unknown;
			at: 5 at: 4 put: MBox unknown;
			at: 5 at: 5 put: MBox unknown;
			yourself
]
