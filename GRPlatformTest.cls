﻿"Filed out from Dolphin Smalltalk 7"!

TestCase subclass: #GRPlatformTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRPlatformTest guid: (GUID fromString: '{8ee783d5-f708-4fc8-9257-3cf070e52ec2}')!
GRPlatformTest comment: 'A GRPlatformTest is a test to make sure the platform (= the Smalltalk dialect we are running on) implements the protocol we need for system classes like Collection. An example would be to make sure Collection implements #count: with the semantics we need.'!
!GRPlatformTest categoriesForClass!Grease-Tests-Core! !
!GRPlatformTest methodsFor!

decodeUtf8Character: aCollectionOfIntegers 

platform

testAsNumber

testBase64Decode

testBindingOf

testBlockContextWithPossibleArguments

testBlockValuableProtocol

testCharacterAsUnicode

testCharacterTo

testConvertToSmalltalkNewlines

testDateArithmetic

testDaysInMonthForYear

testDigitValue

testEmptyOrNil

testFixCallbackTemps

testGreaseIntegerOnCharacterAscii

testGreaseIntegerOnCharacterBmp

testGreaseIntegerOnCharacterLatin1

testGreaseIntegerOnCharacterSmp

testGreaseIntegerOnNumber

testGreaseIntegerOnString

testGreaseString

testIfNil

testIfTrueIfFalse

testIsCharacter

testIsCollection

testIsKeyword

testIsUnary

testLabel

testNewline

testNumArgs

testPathSeparator

testPrintStringLimitedTo

testRandomGenerator

testReadStreamAtEnd

testReadStreamContents

testReadStreamNegativeSkip

testReadStreamNext

testReadStreamPeek

testReadStreamPosition

testReadStreamReset

testReadStreamSeasideUpToAll

testReadStreamSkip

testReadStreamUpTo

testReadStreamUpToEnd

testReadWriteStreamAtEnd

testReadWriteStreamContents

testReadWriteStreamNegativeSkip

testReadWriteStreamNext

testReadWriteStreamNextPut

testReadWriteStreamNextPutAll

testReadWriteStreamPeek

testReadWriteStreamPosition

testReadWriteStreamReset

testReadWriteStreamSkip

testReadWriteStreamTab

testReadWriteStreamUpTo

testReadWriteStreamUpToEnd

testSeconds

testSecureHashFor

testShutDownList

testStackDepth

testStartUpList

testSymbolAsMutator

testTerminate

testTotalSeconds

testVersion

testWriteStreamContents

testWriteStreamCrLf

testWriteStreamNextPut

testWriteStreamNextPutAll

testWriteStreamPosition

testWriteStreamReset

testWriteStreamSpace

testWriteStreamTab
!GRPlatformTest categoriesFor: #decodeUtf8Character:!private! !
!GRPlatformTest categoriesFor: #platform!accessing!public! !
!GRPlatformTest categoriesFor: #testAsNumber!public!tests! !
!GRPlatformTest categoriesFor: #testBase64Decode!public!tests! !
!GRPlatformTest categoriesFor: #testBindingOf!public!tests! !
!GRPlatformTest categoriesFor: #testBlockContextWithPossibleArguments!public!tests! !
!GRPlatformTest categoriesFor: #testBlockValuableProtocol!public!tests! !
!GRPlatformTest categoriesFor: #testCharacterAsUnicode!public!tests! !
!GRPlatformTest categoriesFor: #testCharacterTo!public!tests! !
!GRPlatformTest categoriesFor: #testConvertToSmalltalkNewlines!public!tests! !
!GRPlatformTest categoriesFor: #testDateArithmetic!public!tests! !
!GRPlatformTest categoriesFor: #testDaysInMonthForYear!public!tests! !
!GRPlatformTest categoriesFor: #testDigitValue!public!tests! !
!GRPlatformTest categoriesFor: #testEmptyOrNil!public!tests! !
!GRPlatformTest categoriesFor: #testFixCallbackTemps!public!tests! !
!GRPlatformTest categoriesFor: #testGreaseIntegerOnCharacterAscii!public!tests! !
!GRPlatformTest categoriesFor: #testGreaseIntegerOnCharacterBmp!public!tests! !
!GRPlatformTest categoriesFor: #testGreaseIntegerOnCharacterLatin1!public!tests! !
!GRPlatformTest categoriesFor: #testGreaseIntegerOnCharacterSmp!public!tests! !
!GRPlatformTest categoriesFor: #testGreaseIntegerOnNumber!public!tests! !
!GRPlatformTest categoriesFor: #testGreaseIntegerOnString!public!tests! !
!GRPlatformTest categoriesFor: #testGreaseString!public!tests! !
!GRPlatformTest categoriesFor: #testIfNil!public!tests! !
!GRPlatformTest categoriesFor: #testIfTrueIfFalse!public!tests! !
!GRPlatformTest categoriesFor: #testIsCharacter!public!tests! !
!GRPlatformTest categoriesFor: #testIsCollection!public!tests! !
!GRPlatformTest categoriesFor: #testIsKeyword!public!tests! !
!GRPlatformTest categoriesFor: #testIsUnary!public!tests! !
!GRPlatformTest categoriesFor: #testLabel!public!tests! !
!GRPlatformTest categoriesFor: #testNewline!public!tests! !
!GRPlatformTest categoriesFor: #testNumArgs!public!tests! !
!GRPlatformTest categoriesFor: #testPathSeparator!public!tests! !
!GRPlatformTest categoriesFor: #testPrintStringLimitedTo!public!tests! !
!GRPlatformTest categoriesFor: #testRandomGenerator!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamAtEnd!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamContents!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamNegativeSkip!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamNext!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamPeek!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamPosition!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamReset!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamSeasideUpToAll!public!tests/streams/seaside! !
!GRPlatformTest categoriesFor: #testReadStreamSkip!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamUpTo!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadStreamUpToEnd!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamAtEnd!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamContents!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamNegativeSkip!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamNext!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamNextPut!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamNextPutAll!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamPeek!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamPosition!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamReset!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamSkip!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamTab!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamUpTo!public!tests/streams! !
!GRPlatformTest categoriesFor: #testReadWriteStreamUpToEnd!public!tests/streams! !
!GRPlatformTest categoriesFor: #testSeconds!public!tests! !
!GRPlatformTest categoriesFor: #testSecureHashFor!public!tests! !
!GRPlatformTest categoriesFor: #testShutDownList!public!tests/image! !
!GRPlatformTest categoriesFor: #testStackDepth!public!tests! !
!GRPlatformTest categoriesFor: #testStartUpList!public!tests/image! !
!GRPlatformTest categoriesFor: #testSymbolAsMutator!public!tests! !
!GRPlatformTest categoriesFor: #testTerminate!public!tests/processes! !
!GRPlatformTest categoriesFor: #testTotalSeconds!public!tests! !
!GRPlatformTest categoriesFor: #testVersion!public!tests! !
!GRPlatformTest categoriesFor: #testWriteStreamContents!public!tests/streams! !
!GRPlatformTest categoriesFor: #testWriteStreamCrLf!public!tests/streams! !
!GRPlatformTest categoriesFor: #testWriteStreamNextPut!public!tests/streams! !
!GRPlatformTest categoriesFor: #testWriteStreamNextPutAll!public!tests/streams! !
!GRPlatformTest categoriesFor: #testWriteStreamPosition!public!tests/streams! !
!GRPlatformTest categoriesFor: #testWriteStreamReset!public!tests/streams! !
!GRPlatformTest categoriesFor: #testWriteStreamSpace!public!tests/streams! !
!GRPlatformTest categoriesFor: #testWriteStreamTab!public!tests/streams! !
