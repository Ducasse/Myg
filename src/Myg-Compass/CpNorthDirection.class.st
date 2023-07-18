Class {
	#name : #CpNorthDirection,
	#superclass : #CpDirection,
	#category : #'Myg-Compass'
}

{ #category : #arithmetic }
CpNorthDirection >> in: distance from: aPositionable [
	"Returns the positionable at a given distance from aPositionable"

	^ aPositionable x @ (aPositionable y - distance)
]
