Class {
	#name : #CpEastDirection,
	#superclass : #CpDirection,
	#category : #'Myg-Compass'
}

{ #category : #arithmetic }
CpEastDirection >> in: distance from: aPositionable [
	"Returns the positionable at a given distance from aPositionable"
	
	^ aPositionable x + distance @ aPositionable y
]
