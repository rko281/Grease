"Filed out from Dolphin Smalltalk"!

GRAbstractDictionaryTest subclass: #GRDictionaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDictionaryTest guid: (GUID fromString: '{49e42652-3d8a-44d7-9f8a-a7e6549e78c1}')!

GRDictionaryTest comment: ''!

!GRDictionaryTest categoriesForClass!Unclassified! !

!GRDictionaryTest methodsFor!

collectionClass	^ Dictionary!

createArbitraryAssociations	^ OrderedCollection new		add: #c -> 3;		add: #a -> 1;		add: #b -> 2;		add: #e -> 1;		add: #d -> 4;		yourself!

isKey: anObject equivalentTo: anotherObject	^ anObject = anotherObject! !

!GRDictionaryTest categoriesForMethods!
collectionClass!configuration!public! !
createArbitraryAssociations!configuration!public! !
isKey:equivalentTo:!configuration!public! !
!

