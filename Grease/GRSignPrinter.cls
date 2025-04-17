"Filed out from Dolphin Smalltalk"!

GRPrinter subclass: #GRSignPrinter
	instanceVariableNames: 'negativePrinter positivePrinter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRSignPrinter guid: (GUID fromString: '{b25f71db-cc8f-4717-a4ca-718cdba711b3}')!

GRSignPrinter comment: ''!

!GRSignPrinter categoriesForClass!Text! !

!GRSignPrinter methodsFor!

initialize	super initialize.	self negativePrinter: $-.	self positivePrinter: nil!

negativePrinter: aPrinter	"The printer to be used when the number is negative."	negativePrinter := aPrinter!

positivePrinter: aPrinter	"The printer to be used when the number is zero or positive."	positivePrinter := aPrinter!

print: anObject on: aStream	anObject negative		ifTrue: [ negativePrinter print: anObject on: aStream ]		ifFalse: [ positivePrinter print: anObject on: aStream ]! !

!GRSignPrinter categoriesForMethods!
initialize!initialization!public! !
negativePrinter:!accessing!public! !
positivePrinter:!accessing!public! !
print:on:!printing!public! !
!

