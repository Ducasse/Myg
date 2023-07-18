"
I'm a direction. I can compute position in a direction from a positionable and also at a distance

```
            North
             ^
				 |	
			W <- -> East 
             |
             V
			South
 ^
 |
 |
 |
  ------->
0@0 

```

The origin of positionables is growing upward and to the right


"
Class {
	#name : #CpDirection,
	#superclass : #Object,
	#category : #'Myg-Compass'
}

{ #category : #initialization }
CpDirection class >> east [ 
	"we will use SharedPool in the future."
	
	^ CpEastDirection new
]

{ #category : #initialization }
CpDirection class >> north [ 
	"we will use SharedPool in the future."
	
	^ CpNorthDirection new
]

{ #category : #initialization }
CpDirection class >> south [ 
	"we will use SharedPool in the future."
	
	^ CpSouthDirection new
]

{ #category : #initialization }
CpDirection class >> west [ 
	"we will use SharedPool in the future."
	
	^ CpWestDirection new
]

{ #category : #arithmetic }
CpDirection >> * aPositionable [

	^ self in: 1 from: aPositionable
]

{ #category : #arithmetic }
CpDirection >> in: distance from: aPositionable [
	"Returns the positionable at a given distance from aPositionable"
]

{ #category : #arithmetic }
CpDirection >> newPositionX: anIntegerForX y: anIntegerForY [

	^ anIntegerForX @ anIntegerForY 
]
