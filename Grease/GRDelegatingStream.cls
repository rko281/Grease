"Filed out from Dolphin Smalltalk"!

GRObject subclass: #GRDelegatingStream
	instanceVariableNames: 'stream'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDelegatingStream guid: (GUID fromString: '{006d3617-4082-4339-b91d-33593246a678}')!

GRDelegatingStream comment: 'A GRDelegatingStream is a wrapper around a write stream and defines common behavior.Instance Variables	stream:		<WriteStream>stream	- a WriteStream'!

!GRDelegatingStream categoriesForClass!Text! !

!GRDelegatingStream methodsFor!

atEnd	^ stream atEnd!

contents	^ stream contents!

crlf	self nextPut: Character cr; nextPut: Character lf!

flush	stream flush!

initializeOn: aStream	self initialize.	stream := aStream!

isStream	^ true!

next	self subclassResponsibility!

next: anInteger	self subclassResponsibility!

nextPut: aCharacter	self subclassResponsibility!

nextPutAll: aString	self subclassResponsibility!

position	^ stream position!

position: anInteger	^ stream position: anInteger!

print: anObject	anObject printOn: self!

reset	"Reset the stream"	stream reset!

size	^ stream size!

space	self nextPut: Character space!

tab	self nextPut: Character tab! !

!GRDelegatingStream categoriesForMethods!
atEnd!public!testing! !
contents!accessing!public! !
crlf!public!streaming! !
flush!accessing!public! !
initializeOn:!initialization!public! !
isStream!public!testing! !
next!public!streaming! !
next:!public!streaming! !
nextPut:!public!streaming! !
nextPutAll:!public!streaming! !
position!accessing!public! !
position:!accessing!public! !
print:!public!streaming! !
reset!accessing!public! !
size!accessing!public! !
space!public!streaming! !
tab!public!streaming! !
!

!GRDelegatingStream class methodsFor!

on: aStream	^ self basicNew initializeOn: aStream! !

!GRDelegatingStream class categoriesForMethods!
on:!instance creation!public! !
!

