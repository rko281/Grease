"Filed out from Dolphin Smalltalk 7"!

GRObject subclass: #GRSmallOrderedSet
	instanceVariableNames: 'size table'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRSmallOrderedSet guid: (GUID fromString: '{b24983e4-28f4-42af-b732-61b8452a322f}')!
GRSmallOrderedSet comment: 'I am an implementation of a dictionary. Compared to other dictionaries I am very efficient for small sizes, speed- and space-wise. I also mantain the order in which elements are added when iterating.'!
!GRSmallOrderedSet categoriesForClass!Grease-Core-Collections! !
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

privateAdd: newObject	size = table size ifTrue: [ self grow ].	table at: (size := size + 1) put: newObject.!

remove: anObject	^ self remove: anObject ifAbsent: [ self errorNotFound ]!

remove: anObject ifAbsent: aNiladicBlock	| index |	index := self findIndexFor: anObject.	index = 0		ifTrue: [ ^ aNiladicBlock value ]		ifFalse: [ self removeIndex: index ].	^ anObject!

removeIndex: index	table at: index put: nil.	index to: size - 1 do: [ :i |		table at: i put: (table at: i + 1) ].	size := size - 1!

size	^ size! !
!GRSmallOrderedSet categoriesFor: #add:!adding!public! !
!GRSmallOrderedSet categoriesFor: #addAll:!adding!public! !
!GRSmallOrderedSet categoriesFor: #do:!enumerating!public! !
!GRSmallOrderedSet categoriesFor: #do:separatedBy:!enumerating!public! !
!GRSmallOrderedSet categoriesFor: #errorNotFound!private !public! !
!GRSmallOrderedSet categoriesFor: #findIndexFor:!private !public! !
!GRSmallOrderedSet categoriesFor: #grow!private !public! !
!GRSmallOrderedSet categoriesFor: #includes:!public!testing! !
!GRSmallOrderedSet categoriesFor: #initialize:!initialization!public! !
!GRSmallOrderedSet categoriesFor: #isCollection!public!testing! !
!GRSmallOrderedSet categoriesFor: #isEmpty!public!testing! !
!GRSmallOrderedSet categoriesFor: #postCopy!copying!public! !
!GRSmallOrderedSet categoriesFor: #privateAdd:!private !public! !
!GRSmallOrderedSet categoriesFor: #remove:!public!removing! !
!GRSmallOrderedSet categoriesFor: #remove:ifAbsent:!public!removing! !
!GRSmallOrderedSet categoriesFor: #removeIndex:!private !public! !
!GRSmallOrderedSet categoriesFor: #size!accessing!public! !

!GRSmallOrderedSet class methodsFor!

new	^ self new: 3!

new: anInteger	^ self basicNew initialize: anInteger; yourself!

withAll: aDictionary	^ (self new: aDictionary size)		addAll: aDictionary;		yourself! !
!GRSmallOrderedSet class categoriesFor: #new!instance creation!public! !
!GRSmallOrderedSet class categoriesFor: #new:!instance creation!public! !
!GRSmallOrderedSet class categoriesFor: #withAll:!instance creation!public! !

