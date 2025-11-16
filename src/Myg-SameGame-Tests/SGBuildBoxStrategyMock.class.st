"
Mocked Class of build strategy
"
Class {
	#name : 'SGBuildBoxStrategyMock',
	#superclass : 'Object',
	#instVars : [
		'count'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGBuildBoxStrategyMock >> buildBox [

	count := count + 1.
	^ SGBox new
]

{ #category : 'accessing' }
SGBuildBoxStrategyMock >> count [

	^ count
]

{ #category : 'accessing' }
SGBuildBoxStrategyMock >> count:aValue [ 
	count:=aValue.
]

{ #category : 'initialization' }
SGBuildBoxStrategyMock >> initialize [

	count := 0
]
