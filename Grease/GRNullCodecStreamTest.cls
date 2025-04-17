"Filed out from Dolphin Smalltalk"!

TestCase subclass: #GRNullCodecStreamTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRNullCodecStreamTest guid: (GUID fromString: '{6664e11f-1e24-4076-8cf6-4d6bbbed73f4}')!

GRNullCodecStreamTest comment: ''!

!GRNullCodecStreamTest categoriesForClass!Unclassified! !

!GRNullCodecStreamTest methodsFor!

codecStreamClass	^ GRNullCodecStream!

testCrlf	| stream |	stream := GRNullCodec new 		encoderFor: (WriteStream on: String new).	stream crlf.		self assert: stream contents size = 2.	self assert: stream contents first = Character cr.	self assert: stream contents last = Character lf!

testFlush	| stream |	stream := GRNullCodec new 		encoderFor: (WriteStream on: String new).	stream nextPutAll: 'abc'.	self shouldnt: [ stream flush ] raise: Error.	self assert: stream contents = 'abc'!

testName	| codec |	codec := GRNullCodec new.		self assert: codec name = GRNullCodec codecName!

testNext	| stream |	stream := GRNullCodec new		encoderFor: 'Seaside' readStream.	self assert: stream next = $S.	self assert: (stream next: 1) = 'e'!

testPrint	| stream |	stream := GRNullCodec new 		encoderFor: (WriteStream on: String new).	stream print: 123.	self assert: stream contents = '123'!

testReadString	| stream codecStream |	stream := 'abc' readStream.	codecStream := GRNullCodec new decoderFor: stream.	self assert: codecStream next = $a.	self assert: (codecStream next: 2) = 'bc'!

testSize	| stream |	stream := GRNullCodec new 		encoderFor: (WriteStream on: String new).	stream nextPutAll: 'abc'.	self assert: stream size = 3.	stream nextPut: $d.	self assert: stream size = 4!

testSpace	| stream |	stream := GRNullCodec new 		encoderFor: (WriteStream on: String new).	stream space.		self assert: stream contents size = 1.	self assert: stream contents first = Character space!

testTab	| stream |	stream := GRNullCodec new 		encoderFor: (WriteStream on: String new).	stream tab.		self assert: stream contents size = 1.	self assert: stream contents first = Character tab!

testWriteString	| stream codecStream |	stream := WriteStream on: String new.	codecStream := GRNullCodec new encoderFor: stream.	codecStream		nextPut: $A;		nextPutAll: 'BC';		nextPut: 68;		nextPutAll: #(69 70 ) asByteArray.	self assert: codecStream contents = 'ABCDEF'! !

!GRNullCodecStreamTest categoriesForMethods!
codecStreamClass!accessing!public! !
testCrlf!public!tests/characters! !
testFlush!public!tests/protocol! !
testName!public!tests/characters! !
testNext!public!tests/protocol! !
testPrint!public!tests/protocol! !
testReadString!public!tests! !
testSize!public!tests/protocol! !
testSpace!public!tests/characters! !
testTab!public!tests/characters! !
testWriteString!public!tests! !
!

