"Filed out from Dolphin Smalltalk"!

GRDelayedSendMessage subclass: #GRUnboundMessage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRUnboundMessage guid: (GUID fromString: '{d8ea6a43-2c2d-40a5-a030-e00433419db5}')!

GRUnboundMessage comment: 'A delayed send that has none of the arguments defined in advance.'!

!GRUnboundMessage categoriesForClass!Utilities! !

!GRUnboundMessage methodsFor!

argumentCount	^ selector numArgs!

mergeArguments: anArray	^ anArray! !

!GRUnboundMessage categoriesForMethods!
argumentCount!delegation!public! !
mergeArguments:!private! !
!

