"Filed out from Dolphin Smalltalk"!

Object subclass: #GRObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRObject guid: (GUID fromString: '{ca20782c-0248-44d9-980a-99555dfca0cd}')!

GRObject comment: 'A common superclass that ensures consistent initialization behaviour on all platforms and provides #error: methods that signal an instance of WAPlatformError.Packages that are using Seaside-Platform should normally subclass GRObject instead of Object.'!

!GRObject categoriesForClass!Unclassified! !

!GRObject methodsFor!

error: aString	^ self class error: aString!

initialize! !

!GRObject categoriesForMethods!
error:!error handling!public! !
initialize!initialization!public! !
!

!GRObject class methodsFor!

defaultErrorClass	^ GRError!

error: aString	^ self defaultErrorClass signal: aString!

new	^ self basicNew initialize! !

!GRObject class categoriesForMethods!
defaultErrorClass!error handling!public! !
error:!error handling!public! !
new!instance creation!public! !
!

