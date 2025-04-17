"Filed out from Dolphin Smalltalk"!

GRObject subclass: #GRSmallDictionary
	instanceVariableNames: 'size keys values'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRSmallDictionary guid: (GUID fromString: '{4b9ae8b4-30ba-470d-8e75-d00a8e121d28}')!

GRSmallDictionary comment: 'I am an implementation of a dictionary. Compared to other dictionaries I am very efficient for small sizes, speed- and space-wise. I also mantain the order in which elements are added when iterating. My implementation features some ideas from the RefactoringBrowser.'!

!GRSmallDictionary categoriesForClass!Collections! !

!GRSmallDictionary methodsFor!

add: anAssociation	self at: anAssociation key put: anAssociation value.	^ anAssociation!

addAll: aDictionary	aDictionary keysAndValuesDo: [ :key :value | self at: key put: value ].	^ aDictionary!

any	self isEmpty		ifTrue: [ ^ self errorEmptyCollection ].	^ values at: 1!

associations	"Answer a Collection containing the receiver's associations."	| result |	result := WriteStream on: (Array new: self size).	self associationsDo: [ :assoc | result nextPut: assoc ].	^ result contents!

associationsDo: aBlock	self keysAndValuesDo: [ :key :value | aBlock value: key -> value ]!

at: aKey	"Answer the value associated with aKey. Raise an exception, if no such key is defined."	^ self at: aKey ifAbsent: [ self errorKeyNotFound ]!

at: aKey ifAbsent: aBlock	"Answer the value associated with aKey. Evaluate aBlock, if no such key is defined."	| index |	index := self findIndexFor: aKey.	^ index = 0		ifFalse: [ values at: index ]		ifTrue: [ aBlock value ]!

at: aKey ifAbsentPut: aBlock	"Answer the value associated with aKey. Evaluate aBlock, if no such key is defined and store the return value."	| index |	index := self findIndexFor: aKey.	^ index = 0		ifFalse: [ values at: index ]		ifTrue: [ self privateAt: aKey put: aBlock value ]!

at: aKey ifPresent: aBlock	"Lookup aKey in the receiver. If it is present, answer the value of evaluating the given block with the value associated with the key. Otherwise, answer nil."	| index |	index := self findIndexFor: aKey.	^ index = 0 ifFalse: [ aBlock value: (values at: index) ]!

at: aKey put: aValue	"Set the value of aKey to be aValue."	| index |	index := self findIndexFor: aKey.	^ index = 0		ifFalse: [ values at: index put: aValue ]		ifTrue: [ self privateAt: aKey put: aValue ]!

do: aBlock	1 to: size do: [ :index | aBlock value: (values at: index) ]!

errorEmptyCollection	self error: 'Empty'!

errorKeyNotFound	self error: 'Key not found'!

findIndexFor: aKey	1 to: size do: [ :index |		(keys at: index) = aKey			ifTrue: [ ^ index ] ].	^ 0!

grow	| newKeys newValues |	newKeys := Array new: 2 * size.	newValues := Array new: 2 * size.	1 to: size do: [ :index |		newKeys at: index put: (keys at: index).		newValues at: index put: (values at: index) ].	keys := newKeys.	values := newValues!

includesKey: aKey	"Answer whether the receiver has a key equal to aKey."	^ (self findIndexFor: aKey) ~= 0!

initialize: anInteger	self initialize.	size := 0.	keys := Array new: anInteger.	values := Array new: anInteger!

isCollection	^ true!

isEmpty	^ size = 0!

keys	^ keys copyFrom: 1 to: size!

keysAndValuesDo: aBlock	1 to: size do: [ :index | aBlock value: (keys at: index) value: (values at: index) ]!

keysDo: aBlock	1 to: size do: [ :each | aBlock value: (keys at: each) ]!

noneSatisfy: aOneArgumentBlock	1 to: size do: [ :index |		(aOneArgumentBlock value: (values at: index)) ifTrue: [ ^ false ] ].	^ true!

notEmpty	^ size ~= 0!

postCopy	super postCopy.	keys := keys copy.	values := values copy!

printOn: aStream	super printOn: aStream.	aStream nextPut: $(.	self size <= 100		ifTrue: [			| first |			first := true.			self keysAndValuesDo: [ :key :value |				"keysAndValuesDo:separatedBy: would be nice"				first					ifTrue: [ first := false ]					ifFalse: [ aStream space ].				aStream					print: key;					nextPutAll: '->';					print: value ] ]		ifFalse: [			aStream				nextPutAll: 'size ';				print: self size ].	aStream nextPut: $)!

privateAt: aKey put: aValue	size = keys size ifTrue: [ self grow ].	keys at: (size := size + 1) put: aKey.	^ values at: size put: aValue!

removeIndex: index	| value |	value := values at: index.	index to: size - 1 do:			[ :i |			keys at: i put: (keys at: i + 1).			values at: i put: (values at: i + 1) ].	keys at: size put: nil.	values at: size put: nil.	size := size - 1.	^ value!

removeKey: aKey	"Remove aKey from the receiver, raise an exception if the element is missing."	^ self removeKey: aKey ifAbsent: [ self errorKeyNotFound ]!

removeKey: aKey ifAbsent: aBlock	"Remove aKey from the receiver, evaluate aBlock if the element is missing."	| index |	index := self findIndexFor: aKey.	index = 0 ifTrue: [ ^ aBlock value ].	^ self removeIndex: index!

size	^ size!

sorted	^ self values sorted!

sorted: aTwoArgumentBlock	^ self values sorted: aTwoArgumentBlock!

values	^ values copyFrom: 1 to: size! !

!GRSmallDictionary categoriesForMethods!
add:!accessing!public! !
addAll:!adding!public! !
any!accessing!public! !
associations!accessing!public! !
associationsDo:!enumerating!public! !
at:!accessing!public! !
at:ifAbsent:!accessing!public! !
at:ifAbsentPut:!accessing!public! !
at:ifPresent:!accessing!public! !
at:put:!accessing!public! !
do:!enumerating!public! !
errorEmptyCollection!private! !
errorKeyNotFound!private! !
findIndexFor:!private! !
grow!private! !
includesKey:!public!testing! !
initialize:!initialization!public! !
isCollection!public!testing! !
isEmpty!public!testing! !
keys!enumerating!public! !
keysAndValuesDo:!enumerating!public! !
keysDo:!enumerating!public! !
noneSatisfy:!enumerating!public! !
notEmpty!public!testing! !
postCopy!copying!public! !
printOn:!printing!public! !
privateAt:put:!private! !
removeIndex:!private! !
removeKey:!accessing!public! !
removeKey:ifAbsent:!accessing!public! !
size!accessing!public! !
sorted!public!sorting! !
sorted:!public!sorting! !
values!enumerating!public! !
!

!GRSmallDictionary class methodsFor!

new	^ self new: 3!

new: anInteger	^ self basicNew initialize: anInteger; yourself!

withAll: aDictionary	^ (self new: aDictionary size)		addAll: aDictionary;		yourself! !

!GRSmallDictionary class categoriesForMethods!
new!instance creation!public! !
new:!instance creation!public! !
withAll:!instance creation!public! !
!

