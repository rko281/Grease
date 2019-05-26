"Filed out from Dolphin Smalltalk 7"!

GRNotification subclass: #GRNotificationBasedDynamicVariable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRNotificationBasedDynamicVariable guid: (GUID fromString: '{4791fa94-12ca-41ad-987e-be453481c692}')!
GRNotificationBasedDynamicVariable comment: 'An implementation of a dynamic varaible based on notifications. Dialects that do not support dynamic variables or thread/process local variables can create an empty subclass of this class called GRDynamicVariable.'!
!GRNotificationBasedDynamicVariable categoriesForClass!Grease-Core-Utilities! !
!GRNotificationBasedDynamicVariable methodsFor!

defaultAction	^ self class defaultValue! !
!GRNotificationBasedDynamicVariable categoriesFor: #defaultAction!defaults!public! !

!GRNotificationBasedDynamicVariable class methodsFor!

defaultValue	^ nil!

use: anObject during: aBlock	"Set the dynamic value of the receiver to anObject during the evaluation of aBlock."		^ aBlock on: self do: [ :notification | notification resume: anObject ]!

value	"Answer the dynamic value of the receiver."		^ self signal! !
!GRNotificationBasedDynamicVariable class categoriesFor: #defaultValue!defaults!public! !
!GRNotificationBasedDynamicVariable class categoriesFor: #use:during:!evaluating!public! !
!GRNotificationBasedDynamicVariable class categoriesFor: #value!evaluating!public! !

