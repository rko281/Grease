"Filed out from Dolphin Smalltalk 7"!

GRCodecStream subclass: #GRNullCodecStream
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRNullCodecStream guid: (GUID fromString: '{936d7e78-99cb-4459-8721-97fb199e1877}')!
GRNullCodecStream comment: 'A WANullCodecStream is a WriteStream on a String on which you can both put binary and character data without encoding happening.Instance Variables	stream:		<WriteStream>stream	- a WriteStream on a String'!
!GRNullCodecStream categoriesForClass!Grease-Core-Text! !
!GRNullCodecStream methodsFor!

next	^ stream next!

next: anInteger	^ stream next: anInteger!

nextPut: aCharacterOrByte	aCharacterOrByte isCharacter		ifTrue: [ stream nextPut: aCharacterOrByte ]		ifFalse: [ stream nextPut: (Character codePoint: aCharacterOrByte) ]!

nextPutAll: aStringOrByteArray	aStringOrByteArray isString		ifTrue: [ stream nextPutAll: aStringOrByteArray ]		ifFalse: [			1 to: aStringOrByteArray size do: [ :index |				stream nextPut: (Character codePoint: (aStringOrByteArray at: index)) ] ]! !
!GRNullCodecStream categoriesFor: #next!public!streaming! !
!GRNullCodecStream categoriesFor: #next:!public!streaming! !
!GRNullCodecStream categoriesFor: #nextPut:!public!streaming! !
!GRNullCodecStream categoriesFor: #nextPutAll:!public!streaming! !

