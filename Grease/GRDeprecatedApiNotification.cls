"Filed out from Dolphin Smalltalk"!

GRNotification subclass: #GRDeprecatedApiNotification
	instanceVariableNames: 'details'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDeprecatedApiNotification guid: (GUID fromString: '{82898449-8857-49bd-9868-5235fef8ab11}')!

GRDeprecatedApiNotification comment: 'This notification is signaled whenever a deprecated message is sent.see WAObject>>#greaseDeprecatedApi:details: '!

!GRDeprecatedApiNotification categoriesForClass!Exceptions! !

!GRDeprecatedApiNotification methodsFor!

details	^ details!

details: anObject	details := anObject! !

!GRDeprecatedApiNotification categoriesForMethods!
details!accessing!public! !
details:!accessing!public! !
!

