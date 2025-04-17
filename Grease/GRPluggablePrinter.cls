"Filed out from Dolphin Smalltalk"!

GRPrinter subclass: #GRPluggablePrinter
	instanceVariableNames: 'block'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRPluggablePrinter guid: (GUID fromString: '{e6bb700a-7997-4b80-adf3-1eff671edc87}')!

GRPluggablePrinter comment: ''!

!GRPluggablePrinter categoriesForClass!Text! !

!GRPluggablePrinter methodsFor!

block: aBlock	block := aBlock!

initialize	super initialize.	self block: [ :value | String new ]!

print: anObject on: aStream	aStream nextPutAll: (block value: anObject)! !

!GRPluggablePrinter categoriesForMethods!
block:!accessing!public! !
initialize!initialization!public! !
print:on:!printing!public! !
!

!GRPluggablePrinter class methodsFor!

on: aBlock	^ self new block: aBlock! !

!GRPluggablePrinter class categoriesForMethods!
on:!instance creation!public! !
!

