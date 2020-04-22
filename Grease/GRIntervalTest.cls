"Filed out from Dolphin Smalltalk 7"!

GRAbstractSequenceableCollectionTest subclass: #GRIntervalTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRIntervalTest guid: (GUID fromString: '{e76237eb-ee45-4016-8203-12611ef56246}')!
GRIntervalTest comment: ''!
!GRIntervalTest categoriesForClass!Grease-Tests-Core! !
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
!GRIntervalTest categoriesFor: #allowsDuplicateValues!configuration!public! !
!GRIntervalTest categoriesFor: #arbitraryCollection!configuration!public! !
!GRIntervalTest categoriesFor: #collectionClass!configuration!public! !
!GRIntervalTest categoriesFor: #emptyCollection!configuration!public! !
!GRIntervalTest categoriesFor: #isExtensible!public!testing/ansi! !
!GRIntervalTest categoriesFor: #isHomogeneous!public!testing! !
!GRIntervalTest categoriesFor: #isInitializable!public!testing/ansi! !
!GRIntervalTest categoriesFor: #isSequenced!public!testing/ansi! !
!GRIntervalTest categoriesFor: #isUnique!public!testing! !
!GRIntervalTest categoriesFor: #testBeginsWithSubCollection!public!tests! !
!GRIntervalTest categoriesFor: #testEndsWithSubCollection!public!tests! !
!GRIntervalTest categoriesFor: #testSorted!public!tests! !

