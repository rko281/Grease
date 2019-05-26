"Filed out from Dolphin Smalltalk 7"!

GRSmallDictionary subclass: #GROrderedMultiMap
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GROrderedMultiMap guid: (GUID fromString: '{95abd096-5779-4f1b-acf1-69790df1f9ab}')!
GROrderedMultiMap comment: 'I am an implementation of an ordered multi-map. I allow multiple values to be associated with the same key and maintain the order of addition. #at: and its derivatives all operate on the first matching key, while #allAt: returns the complete list of values for a key in the order they were added.'!
!GROrderedMultiMap categoriesForClass!Grease-Core-Collections! !
!GROrderedMultiMap methodsFor!

add: anAssociation	self privateAt: anAssociation key put: anAssociation value.	^ anAssociation!

"protocol: adding"addAll: aDictionary	aDictionary keysAndValuesDo: [ :key :value |			self privateAt: key put: value ].	^ aDictionary!

allAt: aKey	^ Array streamContents: [ :stream |		1 to: size do: [ :index |			(keys at: index) = aKey				ifTrue: [ stream nextPut: (values at: index) ] ] ]!

allAt: aKey ifAbsent: absentBlock	| results |	results := self allAt: aKey.	^ results isEmpty		ifTrue: [ absentBlock value ]		ifFalse: [ results ]!

at: aKey add: aValue	"Add an association between aKey and aValue. Do not replace existing	values with the same key."		^ self privateAt: aKey put: aValue!

keysAndAllValuesDo: aTwoArgumentBlock	| seenKeys |	seenKeys := GRSmallOrderedSet new.	1 to: size do: [ :index |		| key |		key := keys at: index.		(seenKeys includes: key) ifFalse: [			aTwoArgumentBlock				value: key				value: (self privateAllAt: key startingAt: index).			seenKeys add: key ] ]!

privateAllAt: aKey startingAt: aStartInteger	^ Array new: 2 streamContents: [ :stream |		aStartInteger to: size do: [ :index |			(keys at: index) = aKey				ifTrue: [ stream nextPut: (values at: index) ] ] ]!

removeKey: aKey ifAbsent: aBlock	"Remove aKey from the receiver, evaluate aBlock if the element is missing."	"This is inefficient and could be optimized."	| removed |	removed := Array new: 2 streamContents: [ :stream |		| index |		[ (index := self findIndexFor: aKey) = 0 ] whileFalse: [			stream nextPut: (self removeIndex: index) ] ].	^ removed isEmpty		ifTrue: [ aBlock value ]		ifFalse: [ removed ]! !
!GROrderedMultiMap categoriesFor: #add:!accessing!public! !
!GROrderedMultiMap categoriesFor: #addAll:!adding!public! !
!GROrderedMultiMap categoriesFor: #allAt:!accessing!public! !
!GROrderedMultiMap categoriesFor: #allAt:ifAbsent:!accessing!public! !
!GROrderedMultiMap categoriesFor: #at:add:!accessing!public! !
!GROrderedMultiMap categoriesFor: #keysAndAllValuesDo:!enumerating!public! !
!GROrderedMultiMap categoriesFor: #privateAllAt:startingAt:!private! !
!GROrderedMultiMap categoriesFor: #removeKey:ifAbsent:!accessing!public! !

