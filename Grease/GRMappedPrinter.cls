"Filed out from Dolphin Smalltalk 7"!

GRPrinter subclass: #GRMappedPrinter
	instanceVariableNames: 'next block'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRMappedPrinter guid: (GUID fromString: '{ed16b5fa-1024-454b-9b85-09e7327296c7}')!
GRMappedPrinter comment: ''!
!GRMappedPrinter categoriesForClass!Grease-Core-Text! !
!GRMappedPrinter methodsFor!

block: aBlock	block := aBlock!

initialize	super initialize.	self block: [ :value | value ]!

next: aPrinter	next := aPrinter!

print: anObject on: aStream	next print: (block value: anObject) on: aStream! !
!GRMappedPrinter categoriesFor: #block:!accessing!public! !
!GRMappedPrinter categoriesFor: #initialize!initialization!public! !
!GRMappedPrinter categoriesFor: #next:!accessing!public! !
!GRMappedPrinter categoriesFor: #print:on:!printing!public! !

!GRMappedPrinter class methodsFor!

block: aBlock next: aPrinter	^ self new 		block: aBlock;		next: aPrinter;		yourself! !
!GRMappedPrinter class categoriesFor: #block:next:!instance creation!public! !

