"Filed out from Dolphin Smalltalk 7"!

GRPrinter subclass: #GRSequentialPrinter
	instanceVariableNames: 'parts'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRSequentialPrinter guid: (GUID fromString: '{a89071a5-3de4-47bc-a094-3f5b47bf6ead}')!
GRSequentialPrinter comment: ''!
!GRSequentialPrinter categoriesForClass!Grease-Core-Text! !
!GRSequentialPrinter methodsFor!

, aConverter	parts add: aConverter!

initialize	super initialize.	parts := OrderedCollection new!

print: anObject on: aStream 	parts do: [ :each | each print: anObject on: aStream ]! !
!GRSequentialPrinter categoriesFor: #,!operators!public! !
!GRSequentialPrinter categoriesFor: #initialize!initialization!public! !
!GRSequentialPrinter categoriesFor: #print:on:!printing!public! !

