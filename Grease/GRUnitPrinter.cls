"Filed out from Dolphin Smalltalk"!

GRPrinter subclass: #GRUnitPrinter
	instanceVariableNames: 'integerPrinter fractionPrinter units base'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRUnitPrinter guid: (GUID fromString: '{f545db87-7aea-496f-bc30-6cfe89fcedc3}')!

GRUnitPrinter comment: ''!

!GRUnitPrinter categoriesForClass!Text! !

!GRUnitPrinter methodsFor!

base: anInteger	base := anInteger!

fractionPrinter: aPrinter	fractionPrinter := aPrinter!

initialize	super initialize.	self integerPrinter: (GRNumberPrinter new		precision: 0;		yourself).	self fractionPrinter: (GRNumberPrinter new		precision: 1;		yourself)!

integerPrinter: aPrinter	integerPrinter := aPrinter!

print: anObject on: aStream	anObject = 1		ifTrue: [ ^ self print: anObject unit: units first on: aStream ].	units allButFirst		inject: anObject asFloat		into: [ :value :each |			value < base				ifFalse: [ value / base ]				ifTrue: [ ^ self print: value unit: each on: aStream ] ]!

print: aNumber unit: aString on: aStream	(units first = aString or: [ units second = aString ])		ifTrue: [ integerPrinter print: aNumber on: aStream ]		ifFalse: [ fractionPrinter print: aNumber on: aStream ].	aStream nextPut: $ ; nextPutAll: aString!

units: anArray	units := anArray! !

!GRUnitPrinter categoriesForMethods!
base:!accessing!public! !
fractionPrinter:!accessing!public! !
initialize!initialization!public! !
integerPrinter:!accessing!public! !
print:on:!printing!public! !
print:unit:on:!printing!public! !
units:!accessing!public! !
!

!GRUnitPrinter class methodsFor!

base: anInteger units: anArray	^ self new		base: anInteger;		units: anArray;		yourself! !

!GRUnitPrinter class categoriesForMethods!
base:units:!instance creation!public! !
!

