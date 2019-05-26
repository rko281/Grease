"Filed out from Dolphin Smalltalk 7"!

GRSetTest subclass: #GRSmallOrderedSetTest
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRSmallOrderedSetTest guid: (GUID fromString: '{59ab8de0-a163-4d5f-b69f-bb653f3198f1}')!
GRSmallOrderedSetTest comment: ''!
!GRSmallOrderedSetTest categoriesForClass!Grease-Tests-Core! !
!GRSmallOrderedSetTest methodsFor!

collectionClass	^ GRSmallOrderedSet!

setUp	super setUp.	collection := GRSmallOrderedSet new!

testAdd	| object |	object := Object new.	self assert: collection size = 0.	self assert: (collection add: object) == object.	self assert: collection size = 1.	self assert: (collection add: object) == object!

testAddAll	collection addAll: #(2 1 1).	self assert: collection size = 2.	self assert: (collection includes: 1).	self assert: (collection includes: 2)!

testCopy	| copy |	collection add: 1.	copy := collection copy.	collection add: 2.		self assert: collection size = 2.	self assert: copy size = 1.		self assert: (collection includes: 2).	self deny: (copy includes: 2).!

testDo	| seen |	collection addAll: #(2 1 1).	seen := Array streamContents: [ :stream |		collection do: [ :each |			stream nextPut: each ] ].	self assert: seen size = 2.	self assert: (seen at: 1) = 2.	self assert: (seen at: 2) = 1!

testIncludes	self deny: (collection includes: 0).	collection add: 0.	self assert: (collection includes: 0)!

testIsEmpty	self assert: collection isEmpty.	collection add: 1.	self deny: collection isEmpty.	collection remove: 1.	self assert: collection isEmpty!

testRemove	collection add: 1.	self assert: (collection remove: 1) = 1.	self should: [ collection remove: 1 ] raise: Error!

testRemoveIfAbsent	| absent |	collection add: 1.	absent := false.		self assert: (collection remove: 1 ifAbsent: [ absent := true ]) = 1.	self deny: absent.		collection remove: 1 ifAbsent: [ absent := true ].	self assert: absent.!

testSize	self assert: collection size = 0.	collection addAll: #(2 1 1).	self assert: collection size = 2.! !
!GRSmallOrderedSetTest categoriesFor: #collectionClass!configuration!public! !
!GRSmallOrderedSetTest categoriesFor: #setUp!public!running! !
!GRSmallOrderedSetTest categoriesFor: #testAdd!public!testing! !
!GRSmallOrderedSetTest categoriesFor: #testAddAll!public!testing! !
!GRSmallOrderedSetTest categoriesFor: #testCopy!public!testing! !
!GRSmallOrderedSetTest categoriesFor: #testDo!public!testing! !
!GRSmallOrderedSetTest categoriesFor: #testIncludes!public!testing! !
!GRSmallOrderedSetTest categoriesFor: #testIsEmpty!public!testing! !
!GRSmallOrderedSetTest categoriesFor: #testRemove!public!testing! !
!GRSmallOrderedSetTest categoriesFor: #testRemoveIfAbsent!public!testing! !
!GRSmallOrderedSetTest categoriesFor: #testSize!public!testing! !

