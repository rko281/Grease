"Filed out from Dolphin Smalltalk"!

GRObject subclass: #GRDelayedSend
	instanceVariableNames: 'receiver message'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDelayedSend guid: (GUID fromString: '{7ebf7e98-8827-4e27-8d33-d071a87b62a8}')!

GRDelayedSend comment: 'A GRDelayedSend is a future message send of a message to an object. Some of the arguments can be predefined. Instances are intended to be interchangeable with blocks.This class should conform the ANSI (block) valuable protocol. Unlike a block, a GRDelayedSend is not a closure so doesn''t hold onto the method context. GRDelayedSend provides similar, but portable, functionality to Pharo''s MessageSend.This is an abstract class. Use the methods in the ''instance-creation'' protocol on the class side to create intances.Instance Variables	receiver:		<Object>	selector:		<Symbol>receiver	- the object receiving the messageselector	- the message selector sent to the receiver'!

!GRDelayedSend categoriesForClass!Utilities! !

!GRDelayedSend methodsFor!

argumentCount	"Answer the number of arguments that must be provided to the receiver when sending it."	^ message argumentCount!

initializeWithReceiver: anObject message: aDelayedSendMessage	self initialize.	receiver := anObject.	message := aDelayedSendMessage!

printOn: aStream	super printOn: aStream.	aStream nextPutAll: ' receiver: '; print: receiver.	aStream nextPut: $ .	message printOn: aStream!

value	^ self valueWithArguments: #()!

value: anObject	^ self valueWithArguments: (Array with: anObject)!

value: aFirstObject value: aSecondObject	^ self valueWithArguments: (Array with: aFirstObject with: aSecondObject)!

valueWithArguments: anArray	^ message valueFor: receiver withArguments: anArray!

valueWithPossibleArguments: anArray	^ message valueFor: receiver withPossibleArguments: anArray! !

!GRDelayedSend categoriesForMethods!
argumentCount!accessing!public! !
initializeWithReceiver:message:!initialization!public! !
printOn:!printing!public! !
value!evaluating!public! !
value:!evaluating!public! !
value:value:!evaluating!public! !
valueWithArguments:!evaluating!public! !
valueWithPossibleArguments:!evaluating!public! !
!

!GRDelayedSend class methodsFor!

empty	^ self receiver: nil selector: #yourself!

new	^ self empty!

receiver: anObject selector: aSymbol	^ self basicNew		initializeWithReceiver: anObject			message: (GRUnboundMessage selector: aSymbol);		yourself!

receiver: anObject selector: aSymbol argument: aParameter	^ self receiver: anObject selector: aSymbol arguments: (Array with: aParameter)!

receiver: anObject selector: aSymbol arguments: anArray	^ self basicNew		initializeWithReceiver: anObject			message: (GRBoundMessage selector: aSymbol arguments: anArray);		yourself! !

!GRDelayedSend class categoriesForMethods!
empty!instance creation!public! !
new!instance creation!public! !
receiver:selector:!instance creation!public! !
receiver:selector:argument:!instance creation!public! !
receiver:selector:arguments:!instance creation!public! !
!

