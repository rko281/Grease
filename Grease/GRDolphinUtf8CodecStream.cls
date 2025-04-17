"Filed out from Dolphin Smalltalk"!

GRDolphinConverterCodecStream subclass: #GRDolphinUtf8CodecStream
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDolphinUtf8CodecStream guid: (GUID fromString: '{fad8b1f2-047e-4385-b87b-bf044c0e8783}')!

GRDolphinUtf8CodecStream comment: '
A WAUtf8CodecStream is a WACodecStream optimized for UTF-8 performance in the case where most of the characters are ASCII.
'!

!GRDolphinUtf8CodecStream categoriesForClass!Unclassified! !

!GRDolphinUtf8CodecStream methodsFor!

crlf
	stream nextPut: Character cr.
	stream nextPut: Character lf!

handlePutError: anError for: aString startingAt: startPos

	self error: 'put error'!

invalidUtf8
	^ GRInvalidUtf8Error signal: 'Invalid UTF-8 input'!

next
	^stream nextAvailable ifNotNil: [ :codePoint | codePoint asCharacter]!

next: anInteger 
	^(stream nextAvailable: anInteger) asString!

next: size putAll: aSequenceableCollection startingAt: start
	"Dolphin Smalltalk compatibility."

	^stream
		next: size
		putAll: aSequenceableCollection
		startingAt: start!

nextPut: aCharacter
	stream nextPut: aCharacter!

nextPutAll: aString 

	stream nextPutAll: aString! !

!GRDolphinUtf8CodecStream categoriesForMethods!
crlf!public!streaming! !
handlePutError:for:startingAt:!private! !
invalidUtf8!private! !
next!public!streaming! !
next:!public!streaming! !
next:putAll:startingAt:!public! !
nextPut:!public!streaming! !
nextPutAll:!public! !
!

