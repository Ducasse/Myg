"
I am an abstract announcement from a mine field.
"
Class {
	#name : #MFieldAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper-Announcements'
}

{ #category : #'instance creation' }
MFieldAnnouncement class >> field: aMField [
	^ self new
		field: aMField;
		yourself
]

{ #category : #accessing }
MFieldAnnouncement >> field [
	^ field
]

{ #category : #accessing }
MFieldAnnouncement >> field: anObject [
	field := anObject
]
