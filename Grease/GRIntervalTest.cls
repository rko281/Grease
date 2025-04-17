"Filed out from Dolphin Smalltalk"!

GRAbstractSequenceableCollectionTest subclass: #GRIntervalTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRIntervalTest guid: (GUID fromString: '{216c2435-c5c4-40f3-9cad-8dacda13871b}')!

GRIntervalTest comment: ''!

!GRIntervalTest categoriesForClass!Unclassified! !

!GRIntervalTest methodsFor!

allowsDuplicateValues	^ false!

arbitraryCollection	^ 1 to: 4!

collectionClass	^ Interval!

emptyCollection	^ 1 to: 0!

isExtensible	^ false!

isHomogeneous	^ true!

isInitializable	^ false!

isSequenced	^ false!

isUnique	^ false!

testBeginsWithSubCollection	self assert: ((-5 to: 10 by: 3) beginsWithSubCollection: (-5 to: 7 by: 3)).	self assert: ((-5 to: 10 by: 3) beginsWithSubCollection: (-5 to: 10 by: 3)).	self deny: ((-5 to: 10 by: 3) beginsWithSubCollection: (-8 to: 10 by: 3))!

testEndsWithSubCollection	self assert: ((-5 to: 10 by: 3) endsWithSubCollection: (-2 to: 10 by: 3)).	self assert: ((-5 to: 10 by: 3) endsWithSubCollection: (-5 to: 10 by: 3)).	self deny: ((-5 to: 10 by: 3) endsWithSubCollection: (-5 to: 13 by: 3))!

testSorted	"Unlike super implementation do not assume Interval >> #sorted returns a new object"	| sorted collection |	collection := self arbitraryCollection.	sorted := collection sorted.	self assert: sorted validSequencedResponseFrom: collection.	self assert: sorted sortedWith: [ :a :b | a <= b ].		sorted := collection sorted: [ :a :b | a > b ].	self assert: sorted validSequencedNewResponseFrom: collection.	self assert: sorted sortedWith: [ :a :b | a > b ]! !

!GRIntervalTest categoriesForMethods!
allowsDuplicateValues!configuration!public! !
arbitraryCollection!configuration!public! !
collectionClass!configuration!public! !
emptyCollection!configuration!public! !
isExtensible!public!testing/ansi! !
isHomogeneous!public!testing! !
isInitializable!public!testing/ansi! !
isSequenced!public!testing/ansi! !
isUnique!public!testing! !
testBeginsWithSubCollection!public!tests! !
testEndsWithSubCollection!public!tests! !
testSorted!public!tests! !
!

