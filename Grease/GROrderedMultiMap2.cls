"Filed out from Dolphin Smalltalk"!

GRSmallDictionary2 subclass: #GROrderedMultiMap2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GROrderedMultiMap2 guid: (GUID fromString: '{50c29d67-cf1d-42d8-8c2c-e41630fd93b8}')!

GROrderedMultiMap2 comment: 'I am an implementation of an ordered multi-map. I allow multiple values to be associated with the same key and maintain the order of addition. #at: and its derivatives all operate on the first matching key, while #allAt: returns the complete list of values for a key in the order they were added.'!

!GROrderedMultiMap2 categoriesForClass!Collections! !

!GROrderedMultiMap2 methodsFor!

add: anAssociation	self privateAt: anAssociation key put: anAssociation value.	^ anAssociation!

addAll: aDictionary	aDictionary keysAndValuesDo: [ :key :value |			self privateAt: key put: value ].	^ aDictionary!

allAt: aKey	^ self privateAllAt: aKey startingAt: 1!

allAt: aKey ifAbsent: absentBlock	| results |	results := self allAt: aKey.	^ results isEmpty		ifTrue: [ absentBlock value ]		ifFalse: [ results ]!

at: aKey add: aValue	"Add an association between aKey and aValue. Do not replace existing	values with the same key."	^ self privateAt: aKey put: aValue!

keysAndAllValuesDo: aTwoArgumentBlock	| seenKeys |	seenKeys := GRSmallOrderedSet new.	1 to: size * 2 - 1 by: 2 do: [ :index |		| key |		key := table at: index.		(seenKeys includes: key) ifFalse: [			aTwoArgumentBlock				value: key				value: (self privateAllAt: key startingAt: index).			seenKeys add: key ] ]!

privateAllAt: aKey startingAt: index	^ Array new: 2 streamContents: [ :stream |		index to: size * 2 - 1 by: 2 do: [ :i |			(table at: i) = aKey				ifTrue: [ stream nextPut: (table at: i + 1) ] ] ]!

removeKey: aKey ifAbsent: aBlock	"Remove aKey from the receiver, evaluate aBlock if the element is missing."	"This is inefficient and could be optimized."	| removed |	removed := Array new: 2 streamContents: [ :stream |		| index |		[ (index := self findIndexFor: aKey) = 0 ] whileFalse: [			stream nextPut: (self removeIndex: index) ] ].	^ removed isEmpty		ifTrue: [ aBlock value ]		ifFalse: [ removed ]! !

!GROrderedMultiMap2 categoriesForMethods!
add:!adding!public! !
addAll:!adding!public! !
allAt:!accessing!public! !
allAt:ifAbsent:!accessing!public! !
at:add:!adding!public! !
keysAndAllValuesDo:!enumerating!public! !
privateAllAt:startingAt:!private !public! !
removeKey:ifAbsent:!public!removing! !
!

