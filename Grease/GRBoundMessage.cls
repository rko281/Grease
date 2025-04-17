"Filed out from Dolphin Smalltalk"!

GRDelayedSendMessage subclass: #GRBoundMessage
	instanceVariableNames: 'arguments'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRBoundMessage guid: (GUID fromString: '{93cc5633-a51d-4181-92c8-15552d707626}')!

GRBoundMessage comment: 'A delayed send that has some or all of the arguments defined in advance. Additionally supplied arguments will be added, if possible, to these when the object is evaluate.Instance Variables	arguments:		<Array>arguments	- the predefined arguments'!

!GRBoundMessage categoriesForClass!Utilities! !

!GRBoundMessage methodsFor!

argumentCount	^ selector numArgs - arguments size!

initializeWithSelector: aSymbol arguments: anArray	self initializeWithSelector: aSymbol.	arguments := anArray asArray!

mergeArguments: anArray	^ arguments , anArray!

printOn: aStream	super printOn: aStream.	aStream nextPutAll: ' arguments: '; print: arguments! !

!GRBoundMessage categoriesForMethods!
argumentCount!delegation!public! !
initializeWithSelector:arguments:!initialization!public! !
mergeArguments:!private! !
printOn:!printing!public! !
!

!GRBoundMessage class methodsFor!

selector: aSymbol	^ self selector: aSymbol arguments: #()!

selector: aSymbol arguments: anArray	^ self basicNew		initializeWithSelector: aSymbol arguments: anArray;		yourself! !

!GRBoundMessage class categoriesForMethods!
selector:!instance creation!public! !
selector:arguments:!instance creation!public! !
!

