"Filed out from Dolphin Smalltalk 7"!

GRObject subclass: #GRSmallDictionary2
	instanceVariableNames: 'size table'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRSmallDictionary2 guid: (GUID fromString: '{45a27191-1275-4de4-a94f-bedee5d910a4}')!
GRSmallDictionary2 comment: 'I am an implementation of a dictionary. Compared to other dictionaries I am very efficient for small sizes, speed- and space-wise. I also mantain the order in which elements are added when iterating. My implementation features some ideas from the RefactoringBrowser and others from Eclipse Collections.'!
!GRSmallDictionary2 categoriesForClass!Grease-Core-Collections! !
!GRSmallDictionary2 methodsFor!

add: anAssociation	self at: anAssociation key put: anAssociation value.	^ anAssociation!

addAll: aDictionary	aDictionary keysAndValuesDo: [ :key :value | self at: key put: value ].	^ aDictionary!

any	self isEmpty		ifTrue: [ ^ self errorEmptyCollection ].	^ table at: 2!

associations	"Answer a Collection containing the receiver's associations."	| result |	result := WriteStream on: (Array new: self size).	self associationsDo: [ :assoc | result nextPut: assoc ].	^ result contents!

associationsDo: aBlock	self keysAndValuesDo: [ :key :value | aBlock value: key -> value ]!

at: aKey	"Answer the value associated with aKey. Raise an exception, if no such key is defined."	^ self at: aKey ifAbsent: [ self errorKeyNotFound ]!

at: aKey ifAbsent: aBlock	"Answer the value associated with aKey. Evaluate aBlock, if no such key is defined."	| index |	index := self findIndexFor: aKey.	^ index = 0		ifFalse: [ table at: index + 1 ]		ifTrue: [ aBlock value ]!

at: aKey ifAbsentPut: aBlock	"Answer the value associated with aKey. Evaluate aBlock, if no such key is defined and store the return value."	| index |	index := self findIndexFor: aKey.	^ index = 0		ifFalse: [ table at: index + 1 ]		ifTrue: [ self privateAt: aKey put: aBlock value ]!

at: aKey ifPresent: aBlock	"Lookup aKey in the receiver. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, answer nil."	| index |	index := self findIndexFor: aKey.	^ index = 0 ifFalse: [ aBlock value: (table at: index + 1) ]!

at: aKey put: aValue	"Set the value of aKey to be aValue."	| index |	index := self findIndexFor: aKey.	^ index = 0		ifFalse: [ table at: index + 1 put: aValue ]		ifTrue: [ self privateAt: aKey put: aValue ]!

do: aBlock	2 to: size * 2 by: 2 do: [ :index |		aBlock value: (table at: index) ]!

errorEmptyCollection	self error: 'Empty'!

errorKeyNotFound	self error: 'Key not found'!

findIndexFor: aKey	1 to: size * 2 - 1 by: 2 do: [ :index |		(table at: index) = aKey			ifTrue: [ ^ index ] ].	^ 0!

grow	| newTable |	"#replaceFrom:to:with:startingAt: would be better but not portable"	newTable := Array new: 4 * size.	1 to: size * 2 do: [ :index |		newTable at: index put: (table at: index) ].	table := newTable!

includesKey: aKey	"Answer whether the receiver has a key equal to aKey."	^ (self findIndexFor: aKey) ~= 0!

initialize: anInteger	self initialize.	size := 0.	table := Array new: anInteger * 2!

isCollection	^ true!

isEmpty	^ size = 0!

keys	| keys i |	size = 0 ifTrue: [ ^ #() ].	i := 1.	keys := Array new: size.	1 to: size * 2 - 1 by: 2 do: [ :index |		keys at: i put: (table at: index).		i := i + 1 ].	^ keys!

keysAndValuesDo: aBlock	1 to: size * 2 - 1 by: 2 do: [ :index |		aBlock			value: (table at: index)			value: (table at: index + 1) ]!

keysDo: aBlock	1 to: size * 2 - 1 by: 2 do: [ :index |			aBlock value: (table at: index) ]!

noneSatisfy: aOneArgumentBlock	size = 0 ifTrue: [ ^ true ].	2 to: size * 2 by: 2 do: [ :index |		(aOneArgumentBlock value: (table at: index)) ifTrue: [ ^ false ] ].	^ true!

notEmpty	^ size ~= 0!

postCopy	super postCopy.	table := table copy!

printOn: aStream	super printOn: aStream.		aStream nextPut: $(.	self size <= 100		ifTrue: [			| first |			first := true.			self keysAndValuesDo: [ :key :value |				"keysAndValuesDo:separatedBy: would be nice"				first					ifTrue: [ first := false ]					ifFalse: [ aStream space ].				aStream					print: key;					nextPutAll: '->';									print: value ] ]		ifFalse: [			aStream				nextPutAll: 'size ';				print: self size ].	aStream nextPut: $)	!

privateAt: aKey put: aValue	size * 2 = table size ifTrue: [ self grow ].	table at: (size * 2 + 1) put: aKey.	table at: (size * 2 + 2) put: aValue.	size := size + 1.	^ aValue!

removeIndex: index	| value |	value := table at: index + 1.	index to: size * 2 - 2 do: [ :i | 		table at: i put: (table at: i + 2) ].	table at: size * 2 - 1 put: nil.	table at: size * 2 put: nil.	size := size - 1.	^ value!

removeKey: aKey	"Remove aKey from the receiver, raise an exception if the element is missing."	^ self removeKey: aKey ifAbsent: [ self errorKeyNotFound ]!

removeKey: aKey ifAbsent: aBlock	"Remove aKey from the receiver, evaluate aBlock if the element is missing."	| index |	index := self findIndexFor: aKey.	index = 0 ifTrue: [ ^ aBlock value ].	^ self removeIndex: index!

size	^ size!

sorted	^ self values sorted!

sorted: aTwoArgumentBlock	^ self values sorted: aTwoArgumentBlock!

values	| values i |	size = 0 ifTrue: [ ^ #() ].	i := 1.	values := Array new: size.	2 to: size * 2 by: 2 do: [ :index |		values at: i put: (table at: index).		i := i + 1 ].	^ values! !
!GRSmallDictionary2 categoriesFor: #add:!adding!public! !
!GRSmallDictionary2 categoriesFor: #addAll:!adding!public! !
!GRSmallDictionary2 categoriesFor: #any!accessing!public! !
!GRSmallDictionary2 categoriesFor: #associations!accessing!public! !
!GRSmallDictionary2 categoriesFor: #associationsDo:!enumerating!public! !
!GRSmallDictionary2 categoriesFor: #at:!accessing!public! !
!GRSmallDictionary2 categoriesFor: #at:ifAbsent:!accessing!public! !
!GRSmallDictionary2 categoriesFor: #at:ifAbsentPut:!accessing!public! !
!GRSmallDictionary2 categoriesFor: #at:ifPresent:!accessing!public! !
!GRSmallDictionary2 categoriesFor: #at:put:!accessing!public! !
!GRSmallDictionary2 categoriesFor: #do:!enumerating!public! !
!GRSmallDictionary2 categoriesFor: #errorEmptyCollection!private! !
!GRSmallDictionary2 categoriesFor: #errorKeyNotFound!private! !
!GRSmallDictionary2 categoriesFor: #findIndexFor:!private! !
!GRSmallDictionary2 categoriesFor: #grow!private! !
!GRSmallDictionary2 categoriesFor: #includesKey:!public!testing! !
!GRSmallDictionary2 categoriesFor: #initialize:!initialization!public! !
!GRSmallDictionary2 categoriesFor: #isCollection!public!testing! !
!GRSmallDictionary2 categoriesFor: #isEmpty!public!testing! !
!GRSmallDictionary2 categoriesFor: #keys!enumerating!public! !
!GRSmallDictionary2 categoriesFor: #keysAndValuesDo:!enumerating!public! !
!GRSmallDictionary2 categoriesFor: #keysDo:!enumerating!public! !
!GRSmallDictionary2 categoriesFor: #noneSatisfy:!enumerating!public! !
!GRSmallDictionary2 categoriesFor: #notEmpty!public!testing! !
!GRSmallDictionary2 categoriesFor: #postCopy!copying!public! !
!GRSmallDictionary2 categoriesFor: #printOn:!printing!public! !
!GRSmallDictionary2 categoriesFor: #privateAt:put:!private! !
!GRSmallDictionary2 categoriesFor: #removeIndex:!private! !
!GRSmallDictionary2 categoriesFor: #removeKey:!public!removing! !
!GRSmallDictionary2 categoriesFor: #removeKey:ifAbsent:!public!removing! !
!GRSmallDictionary2 categoriesFor: #size!accessing!public! !
!GRSmallDictionary2 categoriesFor: #sorted!public!sorting! !
!GRSmallDictionary2 categoriesFor: #sorted:!public!sorting! !
!GRSmallDictionary2 categoriesFor: #values!enumerating!public! !

!GRSmallDictionary2 class methodsFor!

new	^ self new: 3!

new: anInteger	^ self basicNew initialize: anInteger; yourself!

withAll: aDictionary	^ (self new: aDictionary size)		addAll: aDictionary;		yourself! !
!GRSmallDictionary2 class categoriesFor: #new!instance creation!public! !
!GRSmallDictionary2 class categoriesFor: #new:!instance creation!public! !
!GRSmallDictionary2 class categoriesFor: #withAll:!instance creation!public! !

