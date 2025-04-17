"Filed out from Dolphin Smalltalk"!

GRDelegatingStream subclass: #GRCountingStream
	instanceVariableNames: 'count'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRCountingStream guid: (GUID fromString: '{2c0e2290-04b2-4cb9-ac7b-4f6370cca9f5}')!

GRCountingStream comment: 'A GRCountingStream counts how many elements have been added to it. This is necessary because the underlying stream may inflate the number of elements in the stream.Instance Variables:	count	<Integer>		count  - number of elements added to this stream'!

!GRCountingStream categoriesForClass!Unclassified! !

!GRCountingStream methodsFor!

count	^ count!

greaseNext: anInteger putAll: aCollection startingAt: startIndex	super greaseNext: anInteger putAll: aCollection startingAt: startIndex.	count := count + anInteger!

initialize	super initialize.	count := 0!

next	self shouldNotImplement!

next: anInteger	self shouldNotImplement!

nextPut: aCharacter	stream nextPut: aCharacter.	count := count + 1!

nextPutAll: aString	stream nextPutAll: aString.	count := count + aString size!

reset	super reset.	count := 0! !

!GRCountingStream categoriesForMethods!
count!accessing!public! !
greaseNext:putAll:startingAt:!public!streaming! !
initialize!initialization!public! !
next!public!streaming! !
next:!public!streaming! !
nextPut:!public!streaming! !
nextPutAll:!public!streaming! !
reset!accessing!public! !
!

