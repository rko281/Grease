"Filed out from Dolphin Smalltalk"!

GRCodec subclass: #GRNullCodec
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRNullCodec guid: (GUID fromString: '{c55fe7f8-f386-40a0-ad66-27dd6c1ce5d3}')!

GRNullCodec comment: 'The null codec always returns the original streams. It assumes that the outside world uses the same encoding as the inside world. This is highly efficient as no transformation is applied to the data, but has its drawbacks.'!

!GRNullCodec categoriesForClass!Text! !

!GRNullCodec methodsFor!

decode: aString	"Overridden for efficiency."	^ aString!

decoderFor: aReadStream	"wrap to avoid String vs ByteArray issues"	^ GRNullCodecStream on: aReadStream!

encode: aString	"Overridden for efficiency."	^ aString!

encoderFor: aWriteStream	"wrap to avoid String vs ByteArray issues"	^ GRNullCodecStream on: aWriteStream!

name	^ GRNullCodec codecName!

url	"The selfish method. Let's do it with ourselves."	^ self! !

!GRNullCodec categoriesForMethods!
decode:!convenience!public! !
decoderFor:!conversion!public! !
encode:!convenience!public! !
encoderFor:!conversion!public! !
name!accessing!public! !
url!accessing!public! !
!

!GRNullCodec class methodsFor!

basicForEncoding: aString	^ self new!

codecName	^ '(none)'!

codecs	^ Array with: self new!

supportsEncoding: aString	^ aString isNil! !

!GRNullCodec class categoriesForMethods!
basicForEncoding:!private! !
codecName!accessing!public! !
codecs!accessing!public! !
supportsEncoding:!public!testing! !
!

