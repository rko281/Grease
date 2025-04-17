"Filed out from Dolphin Smalltalk"!

GRCollectionTest subclass: #GRAbstractDictionaryTest
	instanceVariableNames: 'associations'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRAbstractDictionaryTest guid: (GUID fromString: '{b11302e0-b00d-40e6-bab7-78b4cc539d4c}')!

GRAbstractDictionaryTest comment: ''!

!GRAbstractDictionaryTest categoriesForClass!Unclassified! !

!GRAbstractDictionaryTest methodsFor!

allowsDuplicateValues	^ true!

arbitraryAssociations	^ associations ifNil: [ associations := self createArbitraryAssociations ]!

arbitraryCollection	| dict |	dict := self emptyCollection.	self arbitraryAssociations do: [ :each |		dict at: each key put: each value ].	^ dict!

createArbitraryAssociations	self subclassResponsibility!

isExtensible	^ false!

isInitializable	^ false!

isKey: anObject equivalentTo: anotherObject	self subclassResponsibility!

testAssociationsDo	| collection assocs count |	collection := self arbitraryCollection.	assocs := self arbitraryAssociations copy.	count := 0.	collection associationsDo: [ :assoc |		| size |		count := count + 1.		size := assocs size.		assocs := assocs			reject: [ :each |				(self isKey: each key equivalentTo: assoc key)					and: [ each value = assoc value ] ].		self assert: size - 1 = assocs size ].	self assert: assocs isEmpty.	self assert: count = self arbitraryAssociations size!

valuesOf: aCollection	^ aCollection values! !

!GRAbstractDictionaryTest categoriesForMethods!
allowsDuplicateValues!configuration!public! !
arbitraryAssociations!configuration!public! !
arbitraryCollection!configuration!public! !
createArbitraryAssociations!configuration!public! !
isExtensible!public!testing/ansi! !
isInitializable!public!testing/ansi! !
isKey:equivalentTo:!configuration!public! !
testAssociationsDo!public!tests! !
valuesOf:!private! !
!

!GRAbstractDictionaryTest class methodsFor!

isAbstract	^ self name = #GRAbstractDictionaryTest! !

!GRAbstractDictionaryTest class categoriesForMethods!
isAbstract!public!testing! !
!

