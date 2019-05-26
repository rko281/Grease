﻿"Filed out from Dolphin Smalltalk 7"!

GRObject subclass: #GRSmallDictionary2
	instanceVariableNames: 'size table'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRSmallDictionary2 guid: (GUID fromString: '{45a27191-1275-4de4-a94f-bedee5d910a4}')!
GRSmallDictionary2 comment: 'I am an implementation of a dictionary. Compared to other dictionaries I am very efficient for small sizes, speed- and space-wise. I also mantain the order in which elements are added when iterating. My implementation features some ideas from the RefactoringBrowser and others from Eclipse Collections.'!
!GRSmallDictionary2 categoriesForClass!Grease-Core-Collections! !
!GRSmallDictionary2 methodsFor!

add: anAssociation

addAll: aDictionary

any

associations

associationsDo: aBlock

at: aKey

at: aKey ifAbsent: aBlock

at: aKey ifAbsentPut: aBlock

at: aKey ifPresent: aBlock

at: aKey put: aValue

do: aBlock

errorEmptyCollection

errorKeyNotFound

findIndexFor: aKey

grow

includesKey: aKey

initialize: anInteger

isCollection

isEmpty

keys

keysAndValuesDo: aBlock

keysDo: aBlock

noneSatisfy: aOneArgumentBlock

notEmpty

postCopy

printOn: aStream

privateAt: aKey put: aValue

removeIndex: index

removeKey: aKey

removeKey: aKey ifAbsent: aBlock

size

sorted

sorted: aTwoArgumentBlock

values
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

new

new: anInteger

withAll: aDictionary
!GRSmallDictionary2 class categoriesFor: #new!instance creation!public! !
!GRSmallDictionary2 class categoriesFor: #new:!instance creation!public! !
!GRSmallDictionary2 class categoriesFor: #withAll:!instance creation!public! !
