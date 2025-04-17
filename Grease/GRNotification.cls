"Filed out from Dolphin Smalltalk"!

Notification subclass: #GRNotification
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRNotification guid: (GUID fromString: '{ed5a3ffd-a2b3-4920-8de0-bac696e960e7}')!

GRNotification comment: 'This class provides consistent initialization and exception signaling behaviour across platforms. All platforms must provide the ANSI-standard signaling protocol on this class. #signal: can therefore be safely called on any subclass.Packages that are using Seaside-Platform should usually subclass GRNotification instead of Notification.'!

!GRNotification categoriesForClass!Exceptions! !

