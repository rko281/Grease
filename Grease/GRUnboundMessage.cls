"Filed out from Dolphin Smalltalk 7"!

GRDelayedSendMessage subclass: #GRUnboundMessage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRUnboundMessage guid: (GUID fromString: '{5c8b7b95-436e-4a3e-acb0-e4a76f17b2fa}')!
GRUnboundMessage comment: 'A delayed send that has none of the arguments defined in advance.'!
!GRUnboundMessage categoriesForClass!Grease-Core-Utilities! !
!GRUnboundMessage methodsFor!

argumentCount	^ selector numArgs!

mergeArguments: anArray	^ anArray! !
!GRUnboundMessage categoriesFor: #argumentCount!delegation!public! !
!GRUnboundMessage categoriesFor: #mergeArguments:!private! !

