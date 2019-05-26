"Filed out from Dolphin Smalltalk 7"!

Object subclass: #GRObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRObject guid: (GUID fromString: '{b7b1d7e2-f131-431b-9b38-59ba0421cd4b}')!
GRObject comment: 'A common superclass that ensures consistent initialization behaviour on all platforms and provides #error: methods that signal an instance of WAPlatformError.Packages that are using Seaside-Platform should normally subclass GRObject instead of Object.'!
!GRObject categoriesForClass!Grease-Core! !
!GRObject methodsFor!

error: aString	^ self class error: aString!

initialize! !
!GRObject categoriesFor: #error:!error handling!public! !
!GRObject categoriesFor: #initialize!initialization!public! !

!GRObject class methodsFor!

defaultErrorClass	^ GRError!

error: aString	^ self defaultErrorClass signal: aString!

new	^ self basicNew initialize! !
!GRObject class categoriesFor: #defaultErrorClass!error handling!public! !
!GRObject class categoriesFor: #error:!error handling!public! !
!GRObject class categoriesFor: #new!instance creation!public! !

