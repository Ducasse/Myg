Class {
	#name : 'TakuzuCommandLineHandler',
	#superclass : 'CommandLineHandler',
	#category : 'Myg-Takuzu',
	#package : 'Myg-Takuzu'
}

{ #category : 'accessing' }
TakuzuCommandLineHandler class >> commandName [

	^ 'takuzu'
]

{ #category : 'activation' }
TakuzuCommandLineHandler >> activate [

	OSWindowDriver current startUp: true.
	AppGeneratorSupport errorHandler: AppGeneratorSDLMessageErrorHandler new.

	OSPlatform current isMacOSX
		ifTrue: [ | main |
			main := CocoaMenu new.
			main	title: 'MainMenu'; "Only informative"
				addSubmenu: 'Application' with: [ :m |
					m
						addItemWithTitle: 'Quit'
						action: [ Smalltalk snapshot: false andQuit: true ]
						shortcut: 'q' ].

			main addSubmenu: 'Levels' with: [ :m |
				4 to: 12 by: 2 do: [ :size | 
					m addSubmenu: size printString , 'x' , size printString with: [ :m2 |
						1 to: 5 do: [ :level |
							m2 addItemWithTitle: 'Level ' , level printString 
								action: [ 
									TBoardElement openWithModel: (TBoard perform: ('level',size printString,'Grid', level printString) asSymbol)] 	
						].
					] 
				]
			].
 			
			main addSubmenu: 'Random' with: [ :m |
					m addItemWithTitle: '4x4' action: [ TBoardElement launch4 ].
					m addItemWithTitle: '6x6' action: [ TBoardElement launch6 ] ];
				addSubmenu: 'Help' with: [ :m |
					m
						addItemWithTitle: 'Show Help'
						action: [ Takuzu showHelp ]
						shortcut: '' ].
			main setAsMainMenu.
			
			TBoardElement launch4 ]
		ifFalse: [
			| space |
			space := Takuzu openWithMenuBar.
			space
				when: BlSpaceClosedEvent
				do: [ :e | Smalltalk snapshot: false andQuit: true ] ]
]
