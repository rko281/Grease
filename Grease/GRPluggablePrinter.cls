"Filed out from Dolphin Smalltalk 7"!

GRPrinter subclass: #GRPluggablePrinter
	instanceVariableNames: 'block'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRPluggablePrinter guid: (GUID fromString: '{6923360d-5f0c-4ee3-bc7b-8365e0852d52}')!
GRPluggablePrinter comment: ''!
!GRPluggablePrinter categoriesForClass!Grease-Core-Text! !
!GRPluggablePrinter methodsFor!

block: aBlock	block := aBlock!

initialize	super initialize.	self block: [ :value | String new ]!

print: anObject on: aStream	aStream nextPutAll: (block value: anObject)! !
!GRPluggablePrinter categoriesFor: #block:!accessing!public! !
!GRPluggablePrinter categoriesFor: #initialize!initialization!public! !
!GRPluggablePrinter categoriesFor: #print:on:!printing!public! !

!GRPluggablePrinter class methodsFor!

on: aBlock	^ self new block: aBlock! !
!GRPluggablePrinter class categoriesFor: #on:!instance creation!public! !

