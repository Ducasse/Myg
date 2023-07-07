Class {
	#name : #TMygLevelImporterTest,
	#superclass : #TAbstractTest,
	#category : #'Myg-Takuzu-Tests'
}

{ #category : #tests }
TMygLevelImporterTest >> testBuildArrayFor [

	| tool string res |
	tool := MygLevelImporter new.
	string := '01
__'.

	res := tool buildCharacterArrayFor: string.

	self assert: res contents equals: #($0 $1 $_ $_)
]

{ #category : #tests }
TMygLevelImporterTest >> testClassFor [

	| tool box0 box1   boxUnknownClass boxOtherClass |
	tool := MygLevelImporter new fillBindingDictionary:
		        (MygLevelImporter createBindingDictionaryFromPackage:
			         (RPackageOrganizer default packageNamed: 'Myg-Takuzu')).

	box0 := tool classFor: $0.
	self assert: box0 equals: TSetBox0.
	self assert: box0 new value equals: 0.

	box1 := tool classFor: $1.
	self assert: box1 equals: TSetBox1.
	self assert: box1 new value equals: 1.

	boxUnknownClass := tool classFor: $_.
	self assert: boxUnknownClass equals: TUnknownBox.

]

{ #category : #tests }
TMygLevelImporterTest >> testClassForMissingCharacterIsRaisingAnError [

	| tool |
	tool := MygLevelImporter new fillBindingDictionary:
		        (MygLevelImporter createBindingDictionaryFromPackage:
			         (RPackageOrganizer default packageNamed: 'Myg-Takuzu')).

	self should: [ tool classFor: $x ] raise: MygMissingCharacterError 
]
