"Filed out from Dolphin Smalltalk"!

TestCase subclass: #GRCollectionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRCollectionTest guid: (GUID fromString: '{0cd7d009-06a1-4146-be33-12541e3c21f5}')!

GRCollectionTest comment: ''!

!GRCollectionTest categoriesForClass!Unclassified! !

!GRCollectionTest methodsFor!

allowsDuplicateValues	"Does the tested collection allow storage of duplicate (equal) values."	self subclassResponsibility!

arbitraryCollection	"An general collection for testing. It should meet the needs of #duplicateElement,	#excludedElement, #includedElement, and so on where appropriate.  Make sure the	duplicated element doesn't end up being in the first or last position both before	and after sorting."		^ self collectionClass withAll: #(4 3 1 2 3 5)!

assert: aCollection sortedWith: sortBlock	"Assert that aCollection is correctly sorted according to sortBlock."	1 to: aCollection size -1 do: [ :index |		| a b |		a := aCollection at: index.		b := aCollection at: index + 1.		self assert: ((sortBlock value: a value: b) or: [ (sortBlock value: b value: a) not ]) ]!

assert: responseCollection validSequencedNewResponseFrom: receiverCollection	"Assert that the returned object is, in fact a new object, and that it is	of a valid response class for the tested collection."		self deny: responseCollection == receiverCollection.	self assert: (self isValidNewSequencedResponseClass: responseCollection class)!

assert: responseCollection validSequencedResponseFrom: receiverCollection	"Assert that the returned object is of a valid response class for the tested collection."		self assert: (self isValidNewSequencedResponseClass: responseCollection class)!

collectionClass	"Answer the collection class that is being tested."	self subclassResponsibility!

duplicateElement	"Answer an element that appears multiple times in #arbitraryCollection."	^ 3!

emptyCollection	"Answer an empty collection."	^ self collectionClass new!

excludedElement	"Answer an element that does not appear in #arbitraryCollection."	^ 19!

includedElement	"Answer a (non-duplicate) element that does appear in #arbitraryCollection."	^ 2!

isExtensible	"Answer whether the tested Collection implements the <extensibleCollection>	protocol as defined in ANSI 5.7.5	."			self subclassResponsibility!

isInitializable	"Answer whether the tested Collection implements the <initializableCollection factory>	protocol as defined in ANSI 5.7.23."		self subclassResponsibility!

isValidNewSequencedResponseClass: aClass	"Answer whether aClass is a valid return type for methods that return a new sequenced	collection. These are methods such as #copyFrom:to: or #reverse, which are	defined by ANSI for most classes to return the same class as the receiver.	However, for Interval (and maybe other cases), ANSI specifies that the response	may be any <sequencedReadableCollection>."		^ aClass == self collectionClass or: [		aClass allSuperclasses includes: SequenceableCollection ]!

testAny	| collection |	collection := self arbitraryCollection.		self assert: ((self valuesOf: collection) includes: collection any)!

testEmptyAny	| collection |	collection := self emptyCollection.		self should: [ (self valuesOf: collection) includes: collection any ] raise: Error!

testIsCollection	self assert: self arbitraryCollection isCollection!

testNoneSatisfy	| excluded included |	excluded := self excludedElement.	self assert: (self arbitraryCollection noneSatisfy: [ :each | each = excluded ]).	included := self includedElement.	self deny: (self arbitraryCollection noneSatisfy: [ :each | each = included ]).	self assert: (self emptyCollection noneSatisfy: [ :each | true ])!

testNotEmpty		self assert: self arbitraryCollection notEmpty.	self deny:  self emptyCollection notEmpty.	self assert: self arbitraryCollection notEmpty.	self deny:  self emptyCollection notEmpty!

testSorted	| sorted collection |	collection := self arbitraryCollection.	sorted := collection sorted.	self assert: sorted validSequencedNewResponseFrom: collection.	self assert: sorted sortedWith: [ :a :b | a <= b ].		sorted := collection sorted: [ :a :b | a > b ].	self assert: sorted validSequencedNewResponseFrom: collection.	self assert: sorted sortedWith: [ :a :b | a > b ]!

valuesOf: aCollection	"Answer the values of aCollecion. Dictionary tests override this."		^ aCollection! !

!GRCollectionTest categoriesForMethods!
allowsDuplicateValues!configuration!public! !
arbitraryCollection!configuration!public! !
assert:sortedWith:!asserting!public! !
assert:validSequencedNewResponseFrom:!asserting!public! !
assert:validSequencedResponseFrom:!asserting!public! !
collectionClass!configuration!public! !
duplicateElement!configuration!public! !
emptyCollection!configuration!public! !
excludedElement!configuration!public! !
includedElement!configuration!public! !
isExtensible!public!testing/ansi! !
isInitializable!public!testing/ansi! !
isValidNewSequencedResponseClass:!configuration!public! !
testAny!public!tests! !
testEmptyAny!public!tests! !
testIsCollection!public!tests! !
testNoneSatisfy!public!tests! !
testNotEmpty!public!tests! !
testSorted!public!tests! !
valuesOf:!private! !
!

!GRCollectionTest class methodsFor!

isAbstract	^ self name = #GRCollectionTest! !

!GRCollectionTest class categoriesForMethods!
isAbstract!public!testing! !
!

