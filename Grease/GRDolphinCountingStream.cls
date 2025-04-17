"Filed out from Dolphin Smalltalk"!

GRCountingStream subclass: #GRDolphinCountingStream
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDolphinCountingStream guid: (GUID fromString: '{ce5a889a-30da-415b-9de0-a7fa474a4676}')!

GRDolphinCountingStream comment: ''!

!GRDolphinCountingStream categoriesForClass!Grease-Core! !

!GRDolphinCountingStream methodsFor!

greaseNext: anInteger putAll: aCollection startingAt: startIndex	super greaseNext: anInteger putAll: aCollection startingAt: startIndex.	count := count + anInteger!

nextPutAll: aString

	"Reimplement here since size of a String may be > number of characters (which is what we count) for multi-byte strings"
	stream nextPutAll: aString.	count := count + aString characterCount! !

!GRDolphinCountingStream categoriesForMethods!
greaseNext:putAll:startingAt:!public!streaming! !
nextPutAll:!public!streaming! !
!

