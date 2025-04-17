"Filed out from Dolphin Smalltalk"!

GRPrinter subclass: #GRMappedPrinter
	instanceVariableNames: 'next block'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRMappedPrinter guid: (GUID fromString: '{cf59097b-67ef-41a7-8849-0f99febf1627}')!

GRMappedPrinter comment: ''!

!GRMappedPrinter categoriesForClass!Text! !

!GRMappedPrinter methodsFor!

block: aBlock	block := aBlock!

initialize	super initialize.	self block: [ :value | value ]!

next: aPrinter	next := aPrinter!

print: anObject on: aStream	next print: (block value: anObject) on: aStream! !

!GRMappedPrinter categoriesForMethods!
block:!accessing!public! !
initialize!initialization!public! !
next:!accessing!public! !
print:on:!printing!public! !
!

!GRMappedPrinter class methodsFor!

block: aBlock next: aPrinter	^ self new		block: aBlock;		next: aPrinter;		yourself! !

!GRMappedPrinter class categoriesForMethods!
block:next:!instance creation!public! !
!

