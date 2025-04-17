"Filed out from Dolphin Smalltalk"!

GRNotification subclass: #GRNotificationBasedDynamicVariable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRNotificationBasedDynamicVariable guid: (GUID fromString: '{c8b9ab67-555d-41af-9a5b-7590431067dd}')!

GRNotificationBasedDynamicVariable comment: 'An implementation of a dynamic varaible based on notifications. Dialects that do not support dynamic variables or thread/process local variables can create an empty subclass of this class called GRDynamicVariable.'!

!GRNotificationBasedDynamicVariable categoriesForClass!Utilities! !

!GRNotificationBasedDynamicVariable methodsFor!

defaultAction	^ self class defaultValue! !

!GRNotificationBasedDynamicVariable categoriesForMethods!
defaultAction!defaults!public! !
!

!GRNotificationBasedDynamicVariable class methodsFor!

defaultValue	^ nil!

use: anObject during: aBlock	"Set the dynamic value of the receiver to anObject during the evaluation of aBlock."	^ aBlock on: self do: [ :notification | notification resume: anObject ]!

value	"Answer the dynamic value of the receiver."	^ self signal! !

!GRNotificationBasedDynamicVariable class categoriesForMethods!
defaultValue!defaults!public! !
use:during:!evaluating!public! !
value!evaluating!public! !
!

