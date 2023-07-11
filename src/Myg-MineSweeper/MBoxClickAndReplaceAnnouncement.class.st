Class {
	#name : #MBoxClickAndReplaceAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'box'
	],
	#category : #'Myg-MineSweeper-Announcements'
}

{ #category : #replacement }
MBoxClickAndReplaceAnnouncement class >> replaceBy: aMClickedBox [
	^ self new box: aMClickedBox 
]

{ #category : #accessing }
MBoxClickAndReplaceAnnouncement >> box [
	^ box
]

{ #category : #accessing }
MBoxClickAndReplaceAnnouncement >> box: aMBox [
	box:= aMBox 
]
