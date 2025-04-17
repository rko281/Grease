"Filed out from Dolphin Smalltalk"!

GRAbstractDictionaryTest subclass: #GRSmallDictionaryTest
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRSmallDictionaryTest guid: (GUID fromString: '{4894e9a7-9043-40a5-81ef-fd9284e75b28}')!

GRSmallDictionaryTest comment: ''!

!GRSmallDictionaryTest categoriesForClass!Unclassified! !

!GRSmallDictionaryTest methodsFor!

allowsDuplicateKeys	^ false!

assertAssociations: anOrderedCollection	| collAssociations iterated |	collAssociations := collection associations.	iterated := Array streamContents: [ :stream |		collection associationsDo: [ :each | stream nextPut: each ] ].	self assert: collAssociations size = anOrderedCollection size.	self assert: iterated size = anOrderedCollection size.	1 to: anOrderedCollection size do: [ :index |		self assert: (collAssociations at: index) = (anOrderedCollection at: index).		self assert: (iterated at: index) = (anOrderedCollection at: index) ]!

collectionClass	^ GRSmallDictionary!

createArbitraryAssociations	^ OrderedCollection new		add: 'c' -> 3;		add: 'a' -> 1;		add: 'b' -> 2;		add: 'e' -> 1;		add: 'd' -> 4;		yourself!

isKey: anObject equivalentTo: anotherObject	^ anObject = anotherObject!

newCollection	^ self collectionClass new!

setUp	super setUp.	collection := self newCollection!

testAddAll	| dict result |	dict := (Dictionary new at: '1' put: 'foo'; yourself).	result := collection addAll: dict.	self assert: result == dict.	self assertAssociations: (Array with: '1' -> 'foo').		dict := (GROrderedMultiMap new at: '1' put: 'foo'; at: '1' add: 'bar'; yourself).	collection := self newCollection.	result := collection addAll: dict.	self assert: result == dict.	self assertAssociations:		(self allowsDuplicateKeys			ifFalse: [ Array with: '1' -> 'bar' ]			ifTrue: [ Array with: '1' -> 'foo' with: '1' -> 'bar' ])!

testAddAndAssociations	| association |	association := collection add: '1' -> 'foo'.	self assert: association key = '1'.	self assert: association value = 'foo'.	self assertAssociations: (Array with: '1' -> 'foo').		association := collection add: '2' -> 'bar'.	self assert: association key = '2'.	self assert: association value = 'bar'.	self assertAssociations: (Array with: '1' -> 'foo' with: '2' -> 'bar').		association := collection add: '1' -> 'baz'.	self assert: association key = '1'.	self assert: association value = 'baz'.	self assertAssociations:		(self allowsDuplicateKeys			ifFalse: [ Array with: '1' -> 'baz' with: '2' -> 'bar' ]			ifTrue: [ Array with: '1' -> 'foo' with: '2' -> 'bar' with: '1' -> 'baz' ])!

testAt	self should: [ collection at: '1' ] raise: Error.	collection add: '1' -> 'foo'.	collection add: '1' -> 'bar'.	self assert: (collection at: '1') =		(self allowsDuplicateKeys ifTrue: [ 'foo' ] ifFalse: [ 'bar' ])!

testAtIfAbsent	self assert: (collection at: '1' ifAbsent: [ 'foo' ]) = 'foo'.	collection add: '1' -> 'bar'.	collection add: '1' -> 'baz'.	self assert: (collection at: '1' ifAbsent: [ 'foo' ]) = 		(self allowsDuplicateKeys ifTrue: [ 'bar' ] ifFalse: [ 'baz' ])!

testAtIfAbsentPut	self assert: (collection at: '1' ifAbsentPut: [ 'foo' ]) = 'foo'.	self assertAssociations: (Array with: '1' -> 'foo').	self assert: (collection at: '1' ifAbsentPut: [ 'bar' ]) = 'foo'.	self assertAssociations: (Array with: '1' -> 'foo')!

testAtIfPresent	collection add: '1' -> 'foo'.	collection add: '1' -> 'bar'.	self assert: (collection at: '1' ifPresent: [ :v | v , 'baz' ]) =		(self allowsDuplicateKeys ifTrue: [ 'foobaz' ] ifFalse: [ 'barbaz' ]).	self assert: (collection at: '2' ifPresent: [ :v | v , 'baz' ]) isNil!

testAtPut	collection at: '1' put: 'foo'.	collection at: '2' put: 'bar'.	self assertAssociations: (Array with: '1' -> 'foo' with: '2' -> 'bar').	collection at: '1' put: 'baz'.	self assertAssociations: (Array with: '1' -> 'baz' with: '2' -> 'bar')!

testCopy	| other |	collection at: 1 put: 'foo'; at: 2 put: 'bar'.	other := collection copy.	collection at: 1 put: 'zork'; at: 3 put: 'zonk'.	other at: 2 put: 'other'.		self assert: collection size = 3.	self assert: (collection at: 1) = 'zork'.	self assert: (collection at: 2) = 'bar'.	self assert: (collection at: 3) = 'zonk'.		self assert: other size = 2.	self assert: (other at: 1) = 'foo'.	self assert: (other at: 2) = 'other'!

testDo	| result |	result := OrderedCollection new.	collection at: '1' put: 'foo'; at: '2' put: 'bar'.	collection do: [ :each | result add: each ].	self assert: result asArray = #( 'foo' 'bar' )!

testGrow	1 to: 100 do: [ :i |		collection at: i put: i negated.		self assert: collection size = i.		[ :array :factor |			self assert: array size = i.			1 to: i do: [ :j | self assert: (array at: j) = (factor * j) ] ]				value: collection keys value: 1;				value: collection values value: -1 ]!

testIncludesKey	self deny: (collection includesKey: '1').	collection add: '1' -> 'foo'.	collection add: '1' -> 'bar'.	self assert: (collection includesKey: '1')!

testIsEmpty	self assert: collection isEmpty.	collection add: '1' -> 'foo'.	collection add: '1' -> 'bar'.	self deny: collection isEmpty!

testKeys	collection add: '1' -> 'foo'; add: '2' -> 'bar'; add: '1' -> 'baz'.	self assert: collection keys =		(self allowsDuplicateKeys ifTrue: [ #('1' '2' '1') ] ifFalse: [ #('1' '2') ])!

testKeysAndValuesDo	| iterated |	collection keysAndValuesDo: [ :key :value |		self assert: false ].	collection add: '1' -> 'foo'; add: '2' -> 'bar'; add: '1' -> 'baz'.	iterated := Array streamContents: [ :stream |		collection keysAndValuesDo: [ :key :value |			stream nextPut: key -> value ] ].	self assert: iterated size = (self allowsDuplicateKeys ifTrue: [ 3 ] ifFalse: [ 2 ]).	self assert: iterated first =		(self allowsDuplicateKeys ifTrue: [ '1' -> 'foo' ] ifFalse: [ '1' -> 'baz' ]).	self assert: iterated second = ('2' -> 'bar').	self allowsDuplicateKeys ifTrue: [		self assert: iterated third = ('1' -> 'baz') ]!

testKeysDo	| result |	result := OrderedCollection new.	collection add: '1' -> 'foo'; add: '2' -> 'bar'; add: '1' -> 'baz'.	collection keysDo: [ :each | result add: each ].	self assert: result asArray = 		(self allowsDuplicateKeys ifTrue: [ #('1' '2' '1') ] ifFalse: [ #('1' '2') ])!

testRemoveKey	self should: [ collection removeKey: '1' ] raise: Error.	collection add: '1' -> 'foo'.	collection add: '1' -> 'bar'.	collection add: '2' -> 'baz'.	self assert: (collection removeKey: '1') =		(self allowsDuplicateKeys ifTrue: [ #('foo' 'bar') ] ifFalse: [ 'bar' ]).	self assertAssociations: (Array with: '2' -> 'baz').	self assert: (collection removeKey: '2') =		(self allowsDuplicateKeys ifTrue: [ #('baz') ] ifFalse: [ 'baz' ]).	self assertAssociations: #()!

testRemoveKey2	"https://github.com/SeasideSt/Grease/issues/81"	collection		at: 'x' put: 1;		at: 'y' put: 2;		at: 'z' put: 3.	self		assert: (collection removeKey: 'z') equals: (self allowsDuplicateKeys ifTrue: [ #(3) ] ifFalse: [ 3 ]);		assert: collection size equals: 2.	collection := self newCollection		at: 'x' put: 1;		at: 'y' put: 2;		at: 'z' put: 3;		yourself.					self		assert: (collection removeKey: 'y') equals: (self allowsDuplicateKeys ifTrue: [ #(2) ] ifFalse: [ 2 ]);		assert: collection size equals: 2!

testRemoveKeyIfAbsent	self assert: (collection removeKey: '1' ifAbsent: [ 'absent' ]) = 'absent'.	collection add: '1' -> 'foo'.	collection add: '1' -> 'bar'.	collection add: '2' -> 'baz'.	self assert: (collection removeKey: '1' ifAbsent: [ 'absent' ]) =		(self allowsDuplicateKeys ifTrue: [ #('foo' 'bar') ] ifFalse: [ 'bar' ]).	self assertAssociations: (Array with: '2' -> 'baz').	self assert: (collection removeKey: '2' ifAbsent: [ 'absent' ]) =		(self allowsDuplicateKeys ifTrue: [ #('baz') ] ifFalse: [ 'baz' ]).	self assertAssociations: #()!

testSize	self assert: collection size = 0.	collection add: '1' -> 'foo'.	self assert: collection size = 1.	collection add: '2' -> 'bar'.	self assert: collection size = 2.	collection add: '1' -> 'baz'.	self assert: collection size = 		(self allowsDuplicateKeys ifTrue: [ 3 ] ifFalse: [ 2 ])!

testValues	collection add: '1' -> 'foo'; add: '2' -> 'bar'; add: '1' -> 'baz'.	self assert: collection values =		(self allowsDuplicateKeys ifTrue: [ #('foo' 'bar' 'baz') ] ifFalse: [ #('baz' 'bar') ])!

testWithAll	| dict |	dict := (Dictionary new at: '1' put: 'foo'; yourself).	collection := self collectionClass withAll: dict.	self assertAssociations: (Array with: '1' -> 'foo').		dict := (GROrderedMultiMap new at: '1' put: 'foo'; at: '1' add: 'bar'; yourself).	collection := self collectionClass withAll: dict.	self assertAssociations:		(self allowsDuplicateKeys			ifFalse: [ Array with: '1' -> 'bar' ]			ifTrue: [ Array with: '1' -> 'foo' with: '1' -> 'bar' ])! !

!GRSmallDictionaryTest categoriesForMethods!
allowsDuplicateKeys!configuration!public! !
assertAssociations:!asserting!public! !
collectionClass!configuration!public! !
createArbitraryAssociations!configuration!public! !
isKey:equivalentTo:!configuration!public! !
newCollection!configuration!public! !
setUp!public!running! !
testAddAll!public!tests/accessing! !
testAddAndAssociations!public!tests/accessing! !
testAt!public!tests/accessing! !
testAtIfAbsent!public!tests/accessing! !
testAtIfAbsentPut!public!tests/accessing! !
testAtIfPresent!public!tests/accessing! !
testAtPut!public!tests/accessing! !
testCopy!public!tests! !
testDo!public!tests/enumerating! !
testGrow!public!tests! !
testIncludesKey!public!tests/testing! !
testIsEmpty!public!tests/testing! !
testKeys!public!tests/enumerating! !
testKeysAndValuesDo!public!tests/enumerating! !
testKeysDo!public!tests/enumerating! !
testRemoveKey!public!tests/accessing! !
testRemoveKey2!public!tests/accessing! !
testRemoveKeyIfAbsent!public!tests/accessing! !
testSize!public!tests/accessing! !
testValues!public!tests/enumerating! !
testWithAll!public!tests! !
!

