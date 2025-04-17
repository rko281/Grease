"Filed out from Dolphin Smalltalk"!

GRCodecStream subclass: #GRNullCodecStream
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRNullCodecStream guid: (GUID fromString: '{bc19b0c6-3c30-4e1f-8d3c-a916e80f5898}')!

GRNullCodecStream comment: 'A WANullCodecStream is a WriteStream on a String on which you can both put binary and character data without encoding happening.Instance Variables	stream:		<WriteStream>stream	- a WriteStream on a String'!

!GRNullCodecStream categoriesForClass!Text! !

!GRNullCodecStream methodsFor!

next	^ stream next!

next: anInteger	^ stream next: anInteger!

nextPut: aCharacterOrByte	aCharacterOrByte isCharacter		ifTrue: [ stream nextPut: aCharacterOrByte ]		ifFalse: [ stream nextPut: (Character codePoint: aCharacterOrByte) ]!

nextPutAll: aStringOrByteArray	aStringOrByteArray isString		ifTrue: [ stream nextPutAll: aStringOrByteArray ]		ifFalse: [			1 to: aStringOrByteArray size do: [ :index |				stream nextPut: (Character codePoint: (aStringOrByteArray at: index)) ] ]! !

!GRNullCodecStream categoriesForMethods!
next!public!streaming! !
next:!public!streaming! !
nextPut:!public!streaming! !
nextPutAll:!public!streaming! !
!

