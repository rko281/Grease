"Filed out from Dolphin Smalltalk 7"!

GRAbstractDictionaryTest subclass: #GRIdentityDictionaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRIdentityDictionaryTest guid: (GUID fromString: '{a1e2c8f3-c510-4746-860b-31694d3d2afb}')!
GRIdentityDictionaryTest comment: ''!
!GRIdentityDictionaryTest categoriesForClass!Grease-Tests-Core! !
!GRIdentityDictionaryTest methodsFor!

collectionClass	^ IdentityDictionary!

createArbitraryAssociations	^ OrderedCollection new		add: 'c' -> 3;		add: 'a' -> 1;		add: 'b' -> 2;		add: 'd' -> 1;		add: 'b' copy -> 4;		yourself!

isKey: anObject equivalentTo: anotherObject	^ anObject == anotherObject! !
!GRIdentityDictionaryTest categoriesFor: #collectionClass!configuration!public! !
!GRIdentityDictionaryTest categoriesFor: #createArbitraryAssociations!configuration!public! !
!GRIdentityDictionaryTest categoriesFor: #isKey:equivalentTo:!configuration!public! !

