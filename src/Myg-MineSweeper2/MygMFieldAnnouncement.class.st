"
I am an abstract announcement from a mine field.
"
Class {
	#name : #MygMFieldAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'field'
	],
	#category : #'Myg-MineSweeper2-Announcements'
}

{ #category : #'instance creation' }
MygMFieldAnnouncement class >> field: aMField [
	^ self new
		field: aMField;
		yourself
]

{ #category : #accessing }
MygMFieldAnnouncement >> field [
	^ field
]

{ #category : #accessing }
MygMFieldAnnouncement >> field: anObject [
	field := anObject
]
