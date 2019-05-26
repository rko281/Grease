"Filed out from Dolphin Smalltalk 7"!

GRPrinter subclass: #GROrdinalizePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GROrdinalizePrinter guid: (GUID fromString: '{78b07ac9-8667-47c1-b2ee-226da6ac922c}')!
GROrdinalizePrinter comment: ''!
!GROrdinalizePrinter categoriesForClass!Grease-Core-Text! !
!GROrdinalizePrinter methodsFor!

ordinalize: anInteger	^ (anInteger \\ 100 between: 11 and: 13)		ifTrue: [ 'th' ]		ifFalse: [ 			#('st' 'nd' 'rd')				at: anInteger \\ 10 				ifAbsent: [ 'th' ] ]!

print: anObject on: aStream	aStream nextPutAll: (self ordinalize: anObject integerPart)! !
!GROrdinalizePrinter categoriesFor: #ordinalize:!private! !
!GROrdinalizePrinter categoriesFor: #print:on:!printing!public! !

