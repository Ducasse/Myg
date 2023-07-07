Class {
	#name : #TAbstractTest,
	#superclass : #TestCase,
	#category : #'Myg-Takuzu-Tests'
}

{ #category : #'helpers for setup' }
TAbstractTest >> gridForTest [
	"represents this grid: 
	
	| 1 | _ | _ | _ |
	| _ | _ | 1 | 0 | 
	| _ | 1 | 1 | _ |
	| _ | _ | _ | _ |"

	^ TField configureGrid: ((CTNewArray2D width: 4 height: 4)
			   at: 1 @ 1 put: (TBox createFixedBox: 1);
			   at: 1 @ 2 put: TBox createUnknownBox;
			   at: 1 @ 3 put: TBox createUnknownBox;
			   at: 1 @ 4 put: TBox createUnknownBox;
			   at: 2 @ 1 put: TBox createUnknownBox;
			   at: 2 @ 2 put: TBox createUnknownBox;
			   at: 2 @ 3 put: (TBox createFixedBox: 1);
			   at: 2 @ 4 put: TBox createUnknownBox;
			   at: 3 @ 1 put: TBox createUnknownBox;
			   at: 3 @ 2 put: (TBox createFixedBox: 1);
			   at: 3 @ 3 put: (TBox createFixedBox: 1);
			   at: 3 @ 4 put: TBox createUnknownBox;
			   at: 4 @ 1 put: TBox createUnknownBox;
			   at: 4 @ 2 put: (TBox createFixedBox: 0);
			   at: 4 @ 3 put: TBox createUnknownBox;
			   at: 4 @ 4 put: TBox createUnknownBox;
			   yourself)
]
