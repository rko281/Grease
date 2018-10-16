﻿"Filed out from Dolphin Smalltalk 7"!

GRPrinter subclass: #GRMappedPrinter
	instanceVariableNames: 'next block'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRMappedPrinter guid: (GUID fromString: '{867e0435-dee5-4c1d-802c-88ddac5491ce}')!
GRMappedPrinter comment: ''!
!GRMappedPrinter categoriesForClass!Grease-Core-Text! !
!GRMappedPrinter methodsFor!

block: aBlock

initialize

next: aPrinter

print: anObject on: aStream
!GRMappedPrinter categoriesFor: #block:!accessing!public! !
!GRMappedPrinter categoriesFor: #initialize!initialization!public! !
!GRMappedPrinter categoriesFor: #next:!accessing!public! !
!GRMappedPrinter categoriesFor: #print:on:!printing!public! !

!GRMappedPrinter class methodsFor!

block: aBlock next: aPrinter
!GRMappedPrinter class categoriesFor: #block:next:!instance creation!public! !
