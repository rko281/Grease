"Filed out from Dolphin Smalltalk"!

GRPrinter subclass: #GROrdinalizePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GROrdinalizePrinter guid: (GUID fromString: '{920977e4-df6f-4203-b612-e3f95e8676d4}')!

GROrdinalizePrinter comment: ''!

!GROrdinalizePrinter categoriesForClass!Text! !

!GROrdinalizePrinter methodsFor!

ordinalize: anInteger	^ (anInteger \\ 100 between: 11 and: 13)		ifTrue: [ 'th' ]		ifFalse: [			#('st' 'nd' 'rd')				at: anInteger \\ 10				ifAbsent: [ 'th' ] ]!

print: anObject on: aStream	aStream nextPutAll: (self ordinalize: anObject integerPart)! !

!GROrdinalizePrinter categoriesForMethods!
ordinalize:!private! !
print:on:!printing!public! !
!

