"Filed out from Dolphin Smalltalk"!

GRCodecStream subclass: #GRDolphinConverterCodecStream
	instanceVariableNames: 'converter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDolphinConverterCodecStream guid: (GUID fromString: '{11e2fcca-81af-4e3f-b4bd-1cc17e651458}')!

GRDolphinConverterCodecStream comment: '
A WAConverterCodecStream is a WACodec stream around a TextConverter. It is always in text mode.

Instance Variables
	converter:		<TextConverter>

converter
	- the TextConverter used to do the encoding conversion
'!

!GRDolphinConverterCodecStream categoriesForClass!Unclassified! !

!GRDolphinConverterCodecStream methodsFor!

contents
	^ stream contents!

flush
	stream flush!

initalizeOn: aStream converter: aConverter
	self initializeOn: aStream.
	converter := aConverter!

next
	| character |
	character := converter nextFromStream: stream.
	^ character isNil
		ifFalse: [ character asCharacter ]!

next: anInteger
	| writeStream |
	writeStream := WriteStream on: (String new: anInteger).
	anInteger timesRepeat: [
		writeStream nextPut: (self next
			ifNil: [ ^ writeStream contents ]) ].
	^ writeStream contents!

nextPut: aCharacter
	converter nextPut: aCharacter asCharacter toStream: stream!

nextPutAll: aString
	aString asString do: [ :each | self nextPut: each ]!

size
	^ stream size! !

!GRDolphinConverterCodecStream categoriesForMethods!
contents!accessing!public! !
flush!actions!public! !
initalizeOn:converter:!initialization!public! !
next!public!streaming! !
next:!public!streaming! !
nextPut:!public!streaming! !
nextPutAll:!public!streaming! !
size!accessing!public! !
!

!GRDolphinConverterCodecStream class methodsFor!

on: aStream converter: aConverter
	^ self basicNew initalizeOn: aStream converter: aConverter! !

!GRDolphinConverterCodecStream class categoriesForMethods!
on:converter:!instance creation!public! !
!

