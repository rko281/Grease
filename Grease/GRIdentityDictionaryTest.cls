"Filed out from Dolphin Smalltalk"!

GRAbstractDictionaryTest subclass: #GRIdentityDictionaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRIdentityDictionaryTest guid: (GUID fromString: '{fdf1785c-43d0-4f18-a2d8-dc3547543410}')!

GRIdentityDictionaryTest comment: ''!

!GRIdentityDictionaryTest categoriesForClass!Unclassified! !

!GRIdentityDictionaryTest methodsFor!

collectionClass	^ IdentityDictionary!

createArbitraryAssociations	^ OrderedCollection new		add: 'c' -> 3;		add: 'a' -> 1;		add: 'b' -> 2;		add: 'd' -> 1;		add: 'b' copy -> 4;		yourself!

isKey: anObject equivalentTo: anotherObject	^ anObject == anotherObject! !

!GRIdentityDictionaryTest categoriesForMethods!
collectionClass!configuration!public! !
createArbitraryAssociations!configuration!public! !
isKey:equivalentTo:!configuration!public! !
!

