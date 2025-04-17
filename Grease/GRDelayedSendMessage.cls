"Filed out from Dolphin Smalltalk"!

GRObject subclass: #GRDelayedSendMessage
	instanceVariableNames: 'selector'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDelayedSendMessage guid: (GUID fromString: '{ab3671e6-d583-48c1-9169-3c528b37e74f}')!

GRDelayedSendMessage comment: 'GRDelayedSendMessage is an abstract base for objects that provide currying functionality for GRDelayedSend'!

!GRDelayedSendMessage categoriesForClass!Utilities! !

!GRDelayedSendMessage methodsFor!

argumentCount	"Answer the number of arguments that must be provided when sending this message."	self subclassResponsibility!

basicPerformFor: receiver withArguments: anArray	^ anArray size = selector numArgs		ifTrue: [ receiver perform: selector withArguments: anArray ]		ifFalse: [ self invalidArgumentCount ]!

initializeWithSelector: aSymbol	self initialize.	selector := aSymbol!

invalidArgumentCount	GRInvalidArgumentCount signal!

mergeArguments: anArray	self subclassResponsibility!

printOn: aStream	aStream nextPutAll: 'selector: '; print: selector!

valueFor: receiver withArguments: anArray	"Send the message to receiver with the arguments in anArray. Answer the result.	Signal an error if the number of arguments does not match the selector."	^ self basicPerformFor: receiver withArguments: (self mergeArguments: anArray)!

valueFor: receiver withPossibleArguments: anArray	"Send the message to receiver with as many of the arguments in anArray as possible. Answer the result.	Error if not enough arguments are available for the selector."	| allArguments |	allArguments := self mergeArguments: anArray.	^ allArguments size < selector numArgs		ifTrue: [ self invalidArgumentCount ]		ifFalse: [ self basicPerformFor: receiver withArguments: (allArguments first: selector numArgs) ]! !

!GRDelayedSendMessage categoriesForMethods!
argumentCount!delegation!public! !
basicPerformFor:withArguments:!private! !
initializeWithSelector:!initialization!public! !
invalidArgumentCount!private! !
mergeArguments:!private! !
printOn:!printing!public! !
valueFor:withArguments:!delegation!public! !
valueFor:withPossibleArguments:!delegation!public! !
!

!GRDelayedSendMessage class methodsFor!

new	^ self selector: #yourself!

selector: aSymbol	^ self basicNew		initializeWithSelector: aSymbol;		yourself! !

!GRDelayedSendMessage class categoriesForMethods!
new!instance creation!public! !
selector:!instance creation!public! !
!

