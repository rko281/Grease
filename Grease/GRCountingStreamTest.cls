"Filed out from Dolphin Smalltalk"!

TestCase subclass: #GRCountingStreamTest
	instanceVariableNames: 'countingStream'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRCountingStreamTest guid: (GUID fromString: '{e05f04f3-8c1d-43a8-b844-87668d8ab12a}')!

GRCountingStreamTest comment: ''!

!GRCountingStreamTest categoriesForClass!Unclassified! !

!GRCountingStreamTest methodsFor!

setUp	| codecStream |	codecStream := ((GRCodec forEncoding: 'utf-8') encoderFor: (WriteStream on: (GRCodec forEncoding: 'utf-8') encodedStringClass new)).	countingStream := GRCountingStream on: codecStream!

testInitialSize	self assert: countingStream count = 0!

testNextPut	countingStream nextPut: (Character codePoint: 16rE4).	self assert: countingStream size = 2.	self assert: countingStream count = 1.	self assert: countingStream contents asString = (String with: (Character codePoint: 16rC3) with: (Character codePoint: 16rA4))!

testNextPutAll	countingStream nextPutAll: (String with: (Character codePoint: 16rE4)).	self assert: countingStream size = 2.	self assert: countingStream count = 1.	self assert: countingStream contents asString = (String with: (Character codePoint: 16rC3) with: (Character codePoint: 16rA4))!

testReset	countingStream nextPut: $a.	self assert: countingStream count = 1.	countingStream reset.	self assert: countingStream count = 0! !

!GRCountingStreamTest categoriesForMethods!
setUp!public!running! !
testInitialSize!public!testing! !
testNextPut!public!testing! !
testNextPutAll!public!testing! !
testReset!public!testing! !
!

