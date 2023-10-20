Class {
	#name : #MgdCardFlipBackAnnouncement,
	#superclass : #Announcement,
	#category : #'Myg-Memory-Announcements'
}

{ #category : #actions }
MgdCardFlipBackAnnouncement class >> choose: aMgdCardModel [


	^ self new card: aMgdCardModel
]
