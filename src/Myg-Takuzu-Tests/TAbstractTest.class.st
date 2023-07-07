Class {
	#name : #TAbstractTest,
	#superclass : #TestCase,
	#category : #'Myg-Takuzu-Tests'
}

{ #category : #'as yet unclassified' }
TAbstractTest >> gridForTest [
	"represents this grid: 
	
	| 1 | _ | _ | _ |
	| _ | _ | 1 | 0 | 
	| _ | 1 | 1 | _ |
	| _ | _ | _ | _ |"

	^ TField grid: ((CTNewArray2D width: 4 height: 4)
			   at: 1 @ 1 put: (TBox set: 1);
			   at: 1 @ 2 put: TBox unknown;
			   at: 1 @ 3 put: TBox unknown;
			   at: 1 @ 4 put: TBox unknown;
			   at: 2 @ 1 put: TBox unknown;
			   at: 2 @ 2 put: TBox unknown;
			   at: 2 @ 3 put: (TBox set: 1);
			   at: 2 @ 4 put: TBox unknown;
			   at: 3 @ 1 put: TBox unknown;
			   at: 3 @ 2 put: (TBox set: 1);
			   at: 3 @ 3 put: (TBox set: 1);
			   at: 3 @ 4 put: TBox unknown;
			   at: 4 @ 1 put: TBox unknown;
			   at: 4 @ 2 put: (TBox set: 0);
			   at: 4 @ 3 put: TBox unknown;
			   at: 4 @ 4 put: TBox unknown;
			   yourself)
]
