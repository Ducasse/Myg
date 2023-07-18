Class {
	#name : #CpSouthDirection,
	#superclass : #CpDirection,
	#category : #'Myg-Compass'
}

{ #category : #arithmetic }
CpSouthDirection >> in: distance from: aPositionable [
	"Returns the positionable at a given distance from aPositionable"

	^ aPositionable x @ (aPositionable y + distance)
]
