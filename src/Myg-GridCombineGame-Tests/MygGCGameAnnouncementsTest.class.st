"
This class contains tests
"
Class {
	#name : #MygGCGameAnnouncementsTest,
	#superclass : #TestCase,
	#instVars : [
		'game',
		'announcements'
	],
	#category : #'Myg-GridCombineGame-Tests'
}

{ #category : #tests }
MygGCGameAnnouncementsTest >> announcementsClassNamesAsArray [

	^ announcements collect: #className as: Array
]

{ #category : #initialization }
MygGCGameAnnouncementsTest >> setUp [
	super setUp.

	game := GCGame
		gridExtent: 4@4
		variant:
			(GCMockVariant new
				isSuccessBlock: [:n | n = 16 ];
				yourself).
	
	announcements := OrderedCollection new.

	game announcer when: GCGameAnnouncement send: #add: to: announcements.
]

{ #category : #tests }
MygGCGameAnnouncementsTest >> test01Insert [

	game insertNewTileAt: 1@1.
	self
		assert: self announcementsClassNamesAsArray
		equals: #(GCInsertedTileAnnouncement)

]

{ #category : #tests }
MygGCGameAnnouncementsTest >> test02Slide [

	game
		insertNewTileAt: 1@1;
		slideDown.
	self
		assert: self announcementsClassNamesAsArray
		equals: #(GCInsertedTileAnnouncement GCMovedTileAnnouncement GCSlideDoneAnnouncement)

]

{ #category : #tests }
MygGCGameAnnouncementsTest >> test03Combine [

	game
		insertNewTileAt: 1@1;
		insertNewTileAt: 2@1;
		slideLeft.
	self
		assert: self announcementsClassNamesAsArray
		equals: #(
			GCInsertedTileAnnouncement
			GCInsertedTileAnnouncement
			
			GCDeletedTileAnnouncement
			GCUpgradedTileAnnouncement
			GCMovedTileAnnouncement

			GCSlideDoneAnnouncement)

]

{ #category : #tests }
MygGCGameAnnouncementsTest >> test04Success [

	game
		insertNewTileAt: 1@1;
		insertNewTileAt: 1@2;
		slideDown; "- - - 4"
		insertNewTileAt: 1@1;
		insertNewTileAt: 1@2;
		slideDown; "- - 4 4"
		insertNewTileAt: 1@1;
		insertNewTileAt: 1@2;
		slideDown; "- - 4 8"
		insertNewTileAt: 1@1;
		insertNewTileAt: 1@2;
		slideDown; "- 4 4 8"
		slideDown; "- - 8 8"
		slideDown. "- - - 16"

	self
		assert: self announcementsClassNamesAsArray last
		equals: #GCFinishedAnnouncement.
	self assert: announcements last isSuccess.
	self
		assert: (self announcementsClassNamesAsArray occurrencesOf: #GCSlideDoneAnnouncement)
		equals: 5. "Last slide is only a finish"
	self
		assert: (self announcementsClassNamesAsArray occurrencesOf: #GCInsertedTileAnnouncement)
		equals: 8.
	self
		assert: (self announcementsClassNamesAsArray occurrencesOf: #GCDeletedTileAnnouncement)
		equals: 7

]

{ #category : #tests }
MygGCGameAnnouncementsTest >> test05Full [

	game availablePositions do: [ :each |
		game insertNewTileAt: each ].
	
	self
		assert: self announcementsClassNamesAsArray last
		equals: #GCFinishedAnnouncement.
	self deny: announcements last isSuccess
]
