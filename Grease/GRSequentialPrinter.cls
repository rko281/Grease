"Filed out from Dolphin Smalltalk"!

GRPrinter subclass: #GRSequentialPrinter
	instanceVariableNames: 'parts'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRSequentialPrinter guid: (GUID fromString: '{3e3f7a56-4286-4b1f-83fb-e0ae3b11f34c}')!

GRSequentialPrinter comment: ''!

!GRSequentialPrinter categoriesForClass!Text! !

!GRSequentialPrinter methodsFor!

, aConverter	parts add: aConverter!

initialize	super initialize.	parts := OrderedCollection new!

print: anObject on: aStream	parts do: [ :each | each print: anObject on: aStream ]! !

!GRSequentialPrinter categoriesForMethods!
,!operators!public! !
initialize!initialization!public! !
print:on:!printing!public! !
!

