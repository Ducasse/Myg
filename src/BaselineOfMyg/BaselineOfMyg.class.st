Class {
	#name : 'BaselineOfMyg',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMyg',
	#package : 'BaselineOfMyg'
}

{ #category : 'baselines' }
BaselineOfMyg >> baseline: spec [

	<baseline>
	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://pharo-graphics/Bloc:v2.4.0/src' ].

	spec
		baseline: 'Toplo'
		with: [ spec repository: 'github://pharo-graphics/Toplo:v0.5.0/src' ].

	spec baseline: 'ContainersArray2D' with: [
		spec repository:
			'github://pharo-containers/Containers-Array2D:master/src' ].

	spec
		package: 'MygCore'
		with: [ spec requires: #( 'Bloc' 'Toplo' 'ContainersArray2D' ) ];
		package: 'MygCore-Tests' with: [ spec requires: #( 'MygCore' ) ];
		package: 'Myg-Compass';
		package: 'Myg-Takuzu' with: [ spec requires: #( 'MygCore' ) ];
		package: 'Myg-Takuzu-Tests'
		with: [ spec requires: #( 'Myg-Takuzu' ) ];
		package: 'Myg-MineSweeper' with: [ spec requires: #( 'MygCore' ) ];
		package: 'Myg-MineSweeper-Tests'
		with: [ spec requires: #( 'Myg-MineSweeper' ) ];
		package: 'Myg-Sokoban'
		with: [ spec requires: #( 'MygCore' 'Myg-Compass' ) ];
		package: 'Myg-Sokoban-Tests' 
		with: [ spec requires: #( 'Myg-Sokoban' ) ];
		package: 'Myg-Memory' 
		with: [ spec requires: #( 'MygCore' ) ];
		package: 'Myg-SameGame' 
		with: [ spec requires: #( 'MygCore' ) ];
		package: 'Myg-SameGame-tests' 
		with: [ spec requires: #( 'Myg-SameGame' ) ]
]
