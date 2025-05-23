﻿"Filed out from Dolphin Smalltalk"!

GRNullCodec subclass: #GRDolphinLatin1Codec
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDolphinLatin1Codec guid: (GUID fromString: '{a10aae1b-f003-4193-b86b-af173b6b2399}')!

GRDolphinLatin1Codec comment: 'A GRPharoLatin1Codec is a WACodec optimized for ISO-8859-1 (direct byte to character mapping).'!

!GRDolphinLatin1Codec categoriesForClass!Unclassified! !

!GRDolphinLatin1Codec methodsFor!

decode: aStringOrByteArray
	"Overridden for efficencey."

	^ aStringOrByteArray asString!

decoderFor: aReadStream 
	"wrap to avoid String vs ByteArray issues"

	^GRDolphinLatin1CodecStream on: aReadStream!

encoderFor: aWriteStream 
	"wrap to avoid String vs ByteArray issues"

	^GRDolphinLatin1CodecStream on: aWriteStream!

initializeWithName: aString 
	self initialize.
	name := aString.!

name
	^ name! !

!GRDolphinLatin1Codec categoriesForMethods!
decode:!conversion!public! !
decoderFor:!conversion!public! !
encoderFor:!conversion!public! !
initializeWithName:!initialization!public! !
name!accessing!public! !
!

!GRDolphinLatin1Codec class methodsFor!

basicForEncoding: aString
	(self supportsEncoding: aString)
		ifFalse: [ self unsupportedEncoding: aString ].
	^ self basicNew initializeWithName: aString!

codecs
	^Array with: (self basicForEncoding: 'iso-8859-1')!

supportedEncodingNames
	^#(
		'iso-8859-1'
		'ISO-8859-1'
		'latin-1'
		'latin1'
	)!

supportsEncoding: aString
	"Answer whether the the given encoding name is supported."
	^ self supportedEncodingNames includes: aString! !

!GRDolphinLatin1Codec class categoriesForMethods!
basicForEncoding:!private! !
codecs!accessing!public! !
supportedEncodingNames!private! !
supportsEncoding:!private! !
!

