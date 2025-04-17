"Filed out from Dolphin Smalltalk"!

GRObject subclass: #GRSmallOrderedSet
	instanceVariableNames: 'size table'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRSmallOrderedSet guid: (GUID fromString: '{a5e3b0d6-3baa-4c80-aede-77da6f4b2720}')!

GRSmallOrderedSet comment: 'I am an implementation of a dictionary. Compared to other dictionaries I am very efficient for small sizes, speed- and space-wise. I also mantain the order in which elements are added when iterating.'!

!GRSmallOrderedSet categoriesForClass!Collections! !

!GRSmallOrderedSet methodsFor!

add: newObject	(self findIndexFor: newObject) = 0		ifTrue: [ self privateAdd: newObject ].	^ newObject!

addAll: aCollection	aCollection do: [ :each |		self add: each ].	^ aCollection!

do: aOneArgumentBlock	1 to: size do: [ :i |		aOneArgumentBlock value: (table at: i) ]!

do: aOneArgumentBlock separatedBy: aNiladicBlock	1 to: size do: [ :i |		i > 1 ifTrue: [ aNiladicBlock value ].		aOneArgumentBlock value: (table at: i) ]!

errorNotFound	self error: 'Not found'!

findIndexFor: aKey	1 to: size do: [ :index |		(table at: index) = aKey			ifTrue: [ ^ index ] ].	^ 0!

grow	| newTable |	"#replaceFrom:to:with:startingAt: would be better but not portable"	newTable := Array new: 2 * size.	1 to: size do: [ :index |		newTable at: index put: (table at: index) ].	table := newTable!

includes: anObject	^ (self findIndexFor: anObject) ~= 0!

initialize: anInteger	self initialize.	size := 0.	table := Array new: anInteger!

isCollection	^ true!

isEmpty	^ size = 0!

postCopy	super postCopy.	table := table copy!

privateAdd: newObject	size = table size ifTrue: [ self grow ].	table at: (size := size + 1) put: newObject!

remove: anObject	^ self remove: anObject ifAbsent: [ self errorNotFound ]!

remove: anObject ifAbsent: aNiladicBlock	| index |	index := self findIndexFor: anObject.	index = 0		ifTrue: [ ^ aNiladicBlock value ]		ifFalse: [ self removeIndex: index ].	^ anObject!

removeIndex: index	table at: index put: nil.	index to: size - 1 do: [ :i |		table at: i put: (table at: i + 1) ].	size := size - 1!

size	^ size! !

!GRSmallOrderedSet categoriesForMethods!
add:!adding!public! !
addAll:!adding!public! !
do:!enumerating!public! !
do:separatedBy:!enumerating!public! !
errorNotFound!private !public! !
findIndexFor:!private !public! !
grow!private !public! !
includes:!public!testing! !
initialize:!initialization!public! !
isCollection!public!testing! !
isEmpty!public!testing! !
postCopy!copying!public! !
privateAdd:!private !public! !
remove:!public!removing! !
remove:ifAbsent:!public!removing! !
removeIndex:!private !public! !
size!accessing!public! !
!

!GRSmallOrderedSet class methodsFor!

new	^ self new: 3!

new: anInteger	^ self basicNew initialize: anInteger; yourself!

withAll: aDictionary	^ (self new: aDictionary size)		addAll: aDictionary;		yourself! !

!GRSmallOrderedSet class categoriesForMethods!
new!instance creation!public! !
new:!instance creation!public! !
withAll:!instance creation!public! !
!

