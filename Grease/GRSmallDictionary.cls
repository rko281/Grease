﻿"Filed out from Dolphin Smalltalk 7"!

GRObject subclass: #GRSmallDictionary
	instanceVariableNames: 'size keys values'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRSmallDictionary guid: (GUID fromString: '{8ebc614a-598f-4502-af08-2a2e747defc2}')!
GRSmallDictionary comment: 'I am an implementation of a dictionary. Compared to other dictionaries I am very efficient for small sizes, speed- and space-wise. I also mantain the order in which elements are added when iterating. My implementation features some ideas from the RefactoringBrowser.'!
!GRSmallDictionary categoriesForClass!Grease-Core-Collections! !
!GRSmallDictionary methodsFor!

add: anAssociation

addAll: aDictionary

associations

associationsDo: aBlock

at: aKey

at: aKey ifAbsent: aBlock

at: aKey ifAbsentPut: aBlock

at: aKey ifPresent: aBlock

at: aKey put: aValue

do: aBlock

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

postCopy

printOn: aStream

privateAt: aKey put: aValue

removeIndex: index

removeKey: aKey

removeKey: aKey ifAbsent: aBlock

size

values
!GRSmallDictionary categoriesFor: #add:!accessing!public! !
!GRSmallDictionary categoriesFor: #addAll:!accessing!public! !
!GRSmallDictionary categoriesFor: #associations!accessing!public! !
!GRSmallDictionary categoriesFor: #associationsDo:!enumerating!public! !
!GRSmallDictionary categoriesFor: #at:!accessing!public! !
!GRSmallDictionary categoriesFor: #at:ifAbsent:!accessing!public! !
!GRSmallDictionary categoriesFor: #at:ifAbsentPut:!accessing!public! !
!GRSmallDictionary categoriesFor: #at:ifPresent:!accessing!public! !
!GRSmallDictionary categoriesFor: #at:put:!accessing!public! !
!GRSmallDictionary categoriesFor: #do:!enumerating!public! !
!GRSmallDictionary categoriesFor: #errorKeyNotFound!private! !
!GRSmallDictionary categoriesFor: #findIndexFor:!private! !
!GRSmallDictionary categoriesFor: #grow!private! !
!GRSmallDictionary categoriesFor: #includesKey:!public!testing! !
!GRSmallDictionary categoriesFor: #initialize:!initialization!public! !
!GRSmallDictionary categoriesFor: #isCollection!public!testing! !
!GRSmallDictionary categoriesFor: #isEmpty!public!testing! !
!GRSmallDictionary categoriesFor: #keys!enumerating!public! !
!GRSmallDictionary categoriesFor: #keysAndValuesDo:!enumerating!public! !
!GRSmallDictionary categoriesFor: #keysDo:!enumerating!public! !
!GRSmallDictionary categoriesFor: #postCopy!copying!public! !
!GRSmallDictionary categoriesFor: #printOn:!printing!public! !
!GRSmallDictionary categoriesFor: #privateAt:put:!private! !
!GRSmallDictionary categoriesFor: #removeIndex:!private! !
!GRSmallDictionary categoriesFor: #removeKey:!accessing!public! !
!GRSmallDictionary categoriesFor: #removeKey:ifAbsent:!accessing!public! !
!GRSmallDictionary categoriesFor: #size!accessing!public! !
!GRSmallDictionary categoriesFor: #values!enumerating!public! !

!GRSmallDictionary class methodsFor!

new

new: anInteger

withAll: aDictionary
!GRSmallDictionary class categoriesFor: #new!instance creation!public! !
!GRSmallDictionary class categoriesFor: #new:!instance creation!public! !
!GRSmallDictionary class categoriesFor: #withAll:!instance creation!public! !
