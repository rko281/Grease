﻿"Filed out from Dolphin Smalltalk 7"!

GRStringTest subclass: #GRDolphinStringTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRDolphinStringTest guid: (GUID fromString: '{a383d99e-b6f2-4309-966a-8a84eedc6545}')!
GRDolphinStringTest comment: ''!
!GRDolphinStringTest categoriesForClass!Grease-Tests-Core! !
!GRDolphinStringTest methodsFor!

testSubStrings

	"Use greaseSubStrings: since Dolphin subStrings: differs from ANSI"

!GRDolphinStringTest categoriesFor: #testSubStrings!public!tests! !

!GRDolphinStringTest class methodsFor!

allTestSelectors

	^self subStringsTestSelectors!

testSelectors

	^self subStringsTestSelectors! !
!GRDolphinStringTest class categoriesFor: #allTestSelectors!public! !
!GRDolphinStringTest class categoriesFor: #testSelectors!public! !
