"Filed out from Dolphin Smalltalk 7"!

GRAbstractDictionaryTest subclass: #GRDictionaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRDictionaryTest guid: (GUID fromString: '{1f114f78-b7de-4f1b-9b7f-cb4b944accb5}')!
GRDictionaryTest comment: ''!
!GRDictionaryTest categoriesForClass!Grease-Tests-Core! !
!GRDictionaryTest methodsFor!

collectionClass	^ Dictionary!

createArbitraryAssociations	^ OrderedCollection new		add: #c -> 3;		add: #a -> 1;		add: #b -> 2;		add: #e -> 1;		add: #d -> 4;		yourself!

isKey: anObject equivalentTo: anotherObject	^ anObject = anotherObject! !
!GRDictionaryTest categoriesFor: #collectionClass!configuration!public! !
!GRDictionaryTest categoriesFor: #createArbitraryAssociations!configuration!public! !
!GRDictionaryTest categoriesFor: #isKey:equivalentTo:!configuration!public! !

