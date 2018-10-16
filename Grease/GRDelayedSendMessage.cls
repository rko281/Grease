﻿"Filed out from Dolphin Smalltalk 7"!

GRObject subclass: #GRDelayedSendMessage
	instanceVariableNames: 'selector'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRDelayedSendMessage guid: (GUID fromString: '{aa1727fa-e6b9-4bb1-90b7-8b075450dde0}')!
GRDelayedSendMessage comment: 'GRDelayedSendMessage is an abstract base for objects that provide currying functionality for GRDelayedSend'!
!GRDelayedSendMessage categoriesForClass!Grease-Core-Utilities! !
!GRDelayedSendMessage methodsFor!

argumentCount

basicPerformFor: receiver withArguments: anArray

initializeWithSelector: aSymbol

invalidArgumentCount

mergeArguments: anArray

printOn: aStream

valueFor: receiver withArguments: anArray

valueFor: receiver withPossibleArguments: anArray
!GRDelayedSendMessage categoriesFor: #argumentCount!delegation!public! !
!GRDelayedSendMessage categoriesFor: #basicPerformFor:withArguments:!private! !
!GRDelayedSendMessage categoriesFor: #initializeWithSelector:!initialization!public! !
!GRDelayedSendMessage categoriesFor: #invalidArgumentCount!private! !
!GRDelayedSendMessage categoriesFor: #mergeArguments:!private! !
!GRDelayedSendMessage categoriesFor: #printOn:!printing!public! !
!GRDelayedSendMessage categoriesFor: #valueFor:withArguments:!delegation!public! !
!GRDelayedSendMessage categoriesFor: #valueFor:withPossibleArguments:!delegation!public! !

!GRDelayedSendMessage class methodsFor!

new

selector: aSymbol
!GRDelayedSendMessage class categoriesFor: #new!instance creation!public! !
!GRDelayedSendMessage class categoriesFor: #selector:!instance creation!public! !
