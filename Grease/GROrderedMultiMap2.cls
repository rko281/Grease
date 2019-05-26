﻿"Filed out from Dolphin Smalltalk 7"!

GRSmallDictionary2 subclass: #GROrderedMultiMap2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GROrderedMultiMap2 guid: (GUID fromString: '{90c18a82-e82f-4e4a-9bed-aa11370130ff}')!
GROrderedMultiMap2 comment: 'I am an implementation of an ordered multi-map. I allow multiple values to be associated with the same key and maintain the order of addition. #at: and its derivatives all operate on the first matching key, while #allAt: returns the complete list of values for a key in the order they were added.'!
!GROrderedMultiMap2 categoriesForClass!Grease-Core-Collections! !
!GROrderedMultiMap2 methodsFor!

add: anAssociation

addAll: aDictionary

allAt: aKey

allAt: aKey ifAbsent: absentBlock

at: aKey add: aValue

keysAndAllValuesDo: aTwoArgumentBlock

privateAllAt: aKey startingAt: index

removeKey: aKey ifAbsent: aBlock
!GROrderedMultiMap2 categoriesFor: #add:!adding!public! !
!GROrderedMultiMap2 categoriesFor: #addAll:!adding!public! !
!GROrderedMultiMap2 categoriesFor: #allAt:!accessing!public! !
!GROrderedMultiMap2 categoriesFor: #allAt:ifAbsent:!accessing!public! !
!GROrderedMultiMap2 categoriesFor: #at:add:!adding!public! !
!GROrderedMultiMap2 categoriesFor: #keysAndAllValuesDo:!enumerating!public! !
!GROrderedMultiMap2 categoriesFor: #privateAllAt:startingAt:!private !public! !
!GROrderedMultiMap2 categoriesFor: #removeKey:ifAbsent:!public!removing! !
