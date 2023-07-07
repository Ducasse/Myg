Class {
	#name : #BaselineOfMyg,
	#superclass : #BaselineOf,
	#category : #BaselineOfMyg
}

{ #category : #baselines }
BaselineOfMyg >> baseline: spec [
	<baseline>

	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ].
	spec
		baseline: 'LevelImporter'
		with: [
		spec repository: 'github://Enzo-Demeulenaere/LevelImporter:main' ].

	spec
		baseline: 'Toplo'
		with: [ spec repository: 'github://plantec/Toplo/src' ].

	spec baseline: 'ContainersArray2D' with: [
		spec repository:
			'github://Enzo-Demeulenaere/Containers-Array2D:master/src' ].
		
	spec
		package: 'MygCore' with: [
			spec requires: #( 'Bloc' 'Toplo' 'LevelImporter' 'ContainersArray2D' ) ];
			
		package: 'Myg-Takuzu' with: [ spec requires:  #( 'MygCore' ) ];
		package: 'Myg-Takuzu-Tests' with: [ spec requires: #( 'Myg-Takuzu' ) ];
		yourself
	
]
