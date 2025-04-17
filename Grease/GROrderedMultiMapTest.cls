"Filed out from Dolphin Smalltalk"!

GRSmallDictionaryTest subclass: #GROrderedMultiMapTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GROrderedMultiMapTest guid: (GUID fromString: '{d4357fa1-0e3e-493b-8de4-daf1abdb1bae}')!

GROrderedMultiMapTest comment: ''!

!GROrderedMultiMapTest categoriesForClass!Unclassified! !

!GROrderedMultiMapTest methodsFor!

allowsDuplicateKeys	^ true!

collectionClass	^ GROrderedMultiMap!

testAllAt	self assert: (collection allAt: '1') = #().	collection at: '1' add: 'foo'.	collection at: '1' add: 'bar'.	self assert: (collection allAt: '1') = #( 'foo' 'bar' )!

testAllAtIfAbsent	self assert: (collection allAt: '1' ifAbsent: [ 'absent' ]) = 'absent'.	collection at: '1' add: 'foo'.	collection at: '1' add: 'bar'.	self assert: (collection allAt: '1' ifAbsent: [ 'absent' ]) = #( 'foo' 'bar' )!

testAtAdd	collection at: '1' add: 'foo'.	collection at: '1' add: 'bar'.	self assertAssociations: (Array with: '1' -> 'foo' with: '1' -> 'bar')!

testKeysAndAllValuesDo	| seen |	collection at: '1' add: 'foo'.	collection at: '2' add: 'bar'.	collection at: '1' add: 'zork'.	seen := OrderedCollection new.	collection keysAndAllValuesDo: [ :key :values |		seen add: key -> values ].	self assert: seen size = 2.		self assert: (seen at: 1) key = '1'.	self assert: (seen at: 1) value size = 2.	self assert: ((seen at: 1) value at: 1) = 'foo'.	self assert: ((seen at: 1) value at: 2) = 'zork'.		self assert: (seen at: 2) key = '2'.	self assert: (seen at: 2) value size = 1.	self assert: ((seen at: 2) value at: 1) = 'bar'.! !

!GROrderedMultiMapTest categoriesForMethods!
allowsDuplicateKeys!configuration!public! !
collectionClass!configuration!public! !
testAllAt!public!tests/accessing! !
testAllAtIfAbsent!public!tests/accessing! !
testAtAdd!public!tests/accessing! !
testKeysAndAllValuesDo!public!tests/enumerating! !
!

!GROrderedMultiMapTest class methodsFor!

shouldInheritSelectors	^ true! !

!GROrderedMultiMapTest class categoriesForMethods!
shouldInheritSelectors!public!testing! !
!

