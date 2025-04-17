"Filed out from Dolphin Smalltalk"!

Error subclass: #GRError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRError guid: (GUID fromString: '{b23965fa-72c7-40b6-b52f-2e049238087e}')!

GRError comment: 'This class provides consistent initialization and exception signaling behaviour across platforms. All platforms must provide the ANSI-standard signaling protocol on this class. #signal: can therefore be safely called on any subclass.Packages that are using Seaside-Platform should usually subclass GRError instead of Error.'!

!GRError categoriesForClass!Exceptions! !

