"Filed out from Dolphin Smalltalk 7"!

GRSmallDictionaryTest subclass: #GROrderedMultiMapTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GROrderedMultiMapTest guid: (GUID fromString: '{613af43f-5d59-456a-b4c6-ea4bc5f78ce3}')!
GROrderedMultiMapTest comment: ''!
!GROrderedMultiMapTest categoriesForClass!Grease-Tests-Core! !
!GROrderedMultiMapTest methodsFor!

allowsDuplicateKeys	^ true!

collectionClass	^ GROrderedMultiMap!

testAllAt	self assert: (collection allAt: '1') = #().	collection at: '1' add: 'foo'.	collection at: '1' add: 'bar'.	self assert: (collection allAt: '1') = #( 'foo' 'bar' )!

testAllAtIfAbsent	self assert: (collection allAt: '1' ifAbsent: [ 'absent' ]) = 'absent'.	collection at: '1' add: 'foo'.	collection at: '1' add: 'bar'.	self assert: (collection allAt: '1' ifAbsent: [ 'absent' ]) = #( 'foo' 'bar' )!

testAtAdd	collection at: '1' add: 'foo'.	collection at: '1' add: 'bar'.	self assertAssociations: (Array with: '1' -> 'foo' with: '1' -> 'bar')!

testKeysAndAllValuesDo	| seen |	collection at: '1' add: 'foo'.	collection at: '2' add: 'bar'.	collection at: '1' add: 'zork'.	seen := OrderedCollection new.	collection keysAndAllValuesDo: [ :key :values |		seen add: key -> values ].	self assert: seen size = 2.		self assert: (seen at: 1) key = '1'.	self assert: (seen at: 1) value size = 2.	self assert: ((seen at: 1) value at: 1) = 'foo'.	self assert: ((seen at: 1) value at: 2) = 'zork'.		self assert: (seen at: 2) key = '2'.	self assert: (seen at: 2) value size = 1.	self assert: ((seen at: 2) value at: 1) = 'bar'.! !
!GROrderedMultiMapTest categoriesFor: #allowsDuplicateKeys!configuration!public! !
!GROrderedMultiMapTest categoriesFor: #collectionClass!configuration!public! !
!GROrderedMultiMapTest categoriesFor: #testAllAt!public!tests/accessing! !
!GROrderedMultiMapTest categoriesFor: #testAllAtIfAbsent!public!tests/accessing! !
!GROrderedMultiMapTest categoriesFor: #testAtAdd!public!tests/accessing! !
!GROrderedMultiMapTest categoriesFor: #testKeysAndAllValuesDo!public!tests/enumerating! !

!GROrderedMultiMapTest class methodsFor!

shouldInheritSelectors	^ true! !
!GROrderedMultiMapTest class categoriesFor: #shouldInheritSelectors!public!testing! !

