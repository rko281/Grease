"Filed out from Dolphin Smalltalk 7"!

DynamicVariable subclass: #GRDynamicVariable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRDynamicVariable guid: (GUID fromString: '{e5374e0f-1e6e-462b-8a8a-e93d7aa636e4}')!
GRDynamicVariable comment: ''!
!GRDynamicVariable categoriesForClass!Kernel-Objects! !
!GRDynamicVariable methodsFor!

default

	^self class defaultValue! !
!GRDynamicVariable categoriesFor: #default!public! !

!GRDynamicVariable class methodsFor!

defaultValue

	^nil!

use: anObject during: aBlock
	^ self
		value: anObject
		during: aBlock! !
!GRDynamicVariable class categoriesFor: #defaultValue!accessing!public! !
!GRDynamicVariable class categoriesFor: #use:during:!public! !

