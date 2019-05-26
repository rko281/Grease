"Filed out from Dolphin Smalltalk 7"!

GRNotification subclass: #GRDeprecatedApiNotification
	instanceVariableNames: 'details'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRDeprecatedApiNotification guid: (GUID fromString: '{4d294d11-d09f-4d13-8fbf-f85c9e4d1132}')!
GRDeprecatedApiNotification comment: 'This notification is signaled whenever a deprecated message is sent.see WAObject>>#greaseDeprecatedApi:details: '!
!GRDeprecatedApiNotification categoriesForClass!Grease-Core-Exceptions! !
!GRDeprecatedApiNotification methodsFor!

details	^ details!

details: anObject	details := anObject! !
!GRDeprecatedApiNotification categoriesFor: #details!accessing!public! !
!GRDeprecatedApiNotification categoriesFor: #details:!accessing!public! !

