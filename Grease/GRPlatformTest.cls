﻿"Filed out from Dolphin Smalltalk"!

TestCase subclass: #GRPlatformTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRPlatformTest guid: (GUID fromString: '{5d24de39-3ec4-4ed1-b763-4102846bc9bc}')!

GRPlatformTest comment: 'A GRPlatformTest is a test to make sure the platform (= the Smalltalk dialect we are running on) implements the protocol we need for system classes like Collection. An example would be to make sure Collection implements #count: with the semantics we need.'!

!GRPlatformTest categoriesForClass!Unclassified! !

!GRPlatformTest methodsFor!

decodeUtf8Character: aCollectionOfIntegers 	"Decodes a collection of bytes into a single character. We have this so we can avoid having non-ASCII characters in the source."	| codec toDecode decoded |	codec := GRCodec forEncoding: 'utf-8'.	toDecode := aCollectionOfIntegers asByteArray.	decoded := codec decode: toDecode.	self assert: decoded size = 1.	^ decoded first!

platform	##(Pragma ignoreForCoverage).	^ GRPlatform current!

returnSender	##(Pragma ignoreForCoverage).	^ GRPlatform current thisContext sender!

runCase	GRPlatform current doSilently: [ super runCase ]!

testAsNumber	self assert: 2007 asNumber = 2007.	self assert: '2007' asNumber = 2007!

testBase64Decode	| input |	input := #(		'YW55IGNhcm5hbCBwbGVhc3VyZS4='  'any carnal pleasure.'		'YW55IGNhcm5hbCBwbGVhc3VyZQ==' 'any carnal pleasure'		'YW55IGNhcm5hbCBwbGVhc3Vy' 'any carnal pleasur'		'YW55IGNhcm5hbCBwbGVhc3U=' 'any carnal pleasu'		'YW55IGNhcm5hbCBwbGVhcw==' 'any carnal pleas').	1 to: input size by: 2 do: [ :index |		| decoded expected |		decoded := GRPlatform current base64Decode: (input at: index).		expected := input at: index + 1.		self assert: decoded = expected ]!

testBase64Encode	| input |	input := #(		(97 110 121 32 99 97 114 110 97 108 32 112 108 101 97 115 117 114 101 46) 'YW55IGNhcm5hbCBwbGVhc3VyZS4=' 		(97 110 121 32 99 97 114 110 97 108 32 112 108 101 97 115 117 114 101) 'YW55IGNhcm5hbCBwbGVhc3VyZQ=='		(97 110 121 32 99 97 114 110 97 108 32 112 108 101 97 115 117 114) 'YW55IGNhcm5hbCBwbGVhc3Vy'		(97 110 121 32 99 97 114 110 97 108 32 112 108 101 97 115 117) 'YW55IGNhcm5hbCBwbGVhc3U=' 		(97 110 121 32 99 97 114 110 97 108 32 112 108 101 97 115) 'YW55IGNhcm5hbCBwbGVhcw==').	1 to: input size by: 2 do: [ :index |		| decoded expected |		decoded := GRPlatform current base64Encode: (input at: index) asByteArray.		expected := input at: index + 1.		self assert: decoded = expected ]!

testBindingOf	| binding |	binding := GRPlatform current bindingOf: GRPlatform.	self assert: binding value == GRPlatform!

testBlockContextWithPossibleArguments	| block |	block := [ :x | 1 + x ].	self assert: (block valueWithPossibleArguments: (Array with: 2)) = 3.	block := [ false not ].	self assert: (block valueWithPossibleArguments: (Array with: 3))!

testBlockValuableProtocol	self assert: [ nil ] argumentCount isZero.	self assert: [ :x | x ] argumentCount = 1.	self assert: [ :a :b | a + b ] argumentCount = 2.	self 		shouldnt: [ [ nil ] ]		raise: Error.	self 		shouldnt: [ [ :x | x ] ]		raise: Error.	self 		shouldnt: [ [ :a :b | a + b ] ]		raise: Error!

testCharacterAsUnicode	"test for:	Character >> #asUnicode		^self asInteger"	self assert: $S asUnicode = 83!

testCharacterTo	| actual expected |	actual := Array withAll: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-'.	actual := actual collect: [ :each | each greaseInteger ].	expected := #(		97		98		99		100		101		102		103		104		105		106		107		108		109		110		111		112		113		114		115		116		117		118		119		120		121		122		65		66		67		68		69		70		71		72		73		74		75		76		77		78		79		80		81		82		83		84		85		86		87		88		89		90		48		49		50		51		52		53		54		55		56		57		95		45	).	self assert: actual size = expected size.	actual 		with: expected		do: [ :first :second | self assert: first = second ]!

testCompileAsciiString	| selector expected source |		GRPlatform current supportsUnicode ifFalse: [		^ self ].		selector := #stringMethod.	expected := 'test ok'.	source := GRPlatform current asMethodReturningString: expected named: selector.	[ 		| actual |		GRPlatform current compile: source into: self class classified: 'private'.		actual := self perform: selector.		self assert: expected = actual	] ensure: [ 		GRPlatform current removeSelector: #stringMethod from: self class ]!

testCompileUnicodeString	| selector expected source |	selector := #stringMethod.	expected := String		with: (Character value: 16r1F1F3)		with: (Character value: 16r1F1F1).	source := GRPlatform current asMethodReturningString: expected named: selector.	[ 		| actual |		GRPlatform current compile: source into: self class classified: 'private'.		actual := self perform: selector.		self assert: expected = actual	] ensure: [ 		GRPlatform current removeSelector: #stringMethod from: self class ]!

testConvertToSmalltalkNewlines	| expected |	expected := 'a' , GRPlatform current newline , 'b'.	self assert: (GRPlatform current convertToSmalltalkNewlines: nil) isNil.	self assert: (GRPlatform current convertToSmalltalkNewlines: '') = ''.	self assert: (GRPlatform current convertToSmalltalkNewlines: 'abc') = 'abc'.	self 		assert: (GRPlatform current convertToSmalltalkNewlines: 'a' , (String with: Character cr with: Character lf) , 'b')			= expected		description: 'Multics, Unix and Unix-like systems (GNU/Linux, AIX, Xenix, Mac OS X, FreeBSD, etc.), BeOS, Amiga, RISC OS, and others'.	self		assert: (GRPlatform current convertToSmalltalkNewlines: 'a' , (String with: Character lf) , 'b')			= expected		description: 'DEC RT-11 and most other early non-Unix, non-IBM OSes, CP/M, MP/M, MS-DOS, OS/2, Microsoft Windows, Symbian OS'.	self 		assert: (GRPlatform current convertToSmalltalkNewlines: 'a' , (String with: Character cr) , 'b')			= expected		description: 'Commodore 8-bit machines, TRS-80, Apple II family, Mac OS up to version 9 and OS-9'!

testDateArithmetic	| today tomorrow oneDay minusOneDay |	today := DateAndTime year: 2008 month: 9 day: 13 hour: 14 minute: 32 second: 05 offset: Duration zero.	tomorrow := DateAndTime year: 2008 month: 9 day: 14 hour: 14 minute: 32 second: 05 offset: Duration zero.	oneDay := Duration days: 1 hours: 0 minutes: 0 seconds: 0.	minusOneDay := Duration days: -1 hours: 0 minutes: 0 seconds: 0.	self assert: tomorrow - today = oneDay.	self assert: today - tomorrow = minusOneDay.	self assert: today + oneDay = tomorrow.	self assert: tomorrow - oneDay = today.	self assert: tomorrow + minusOneDay = today.	self assert: today - minusOneDay = tomorrow!

testDaysInMonthForYear	(1 to: 12) with: #(31 28 31 30 31 30 31 31 30 31 30 31) do: [ :month :days |		self assert: days = (Date daysInMonth: (Date nameOfMonth: month) forYear: 2007) ]!

testDigitValue	'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ' 		with: (0 to: 35)		do: [ :each :expected | self assert: each digitValue = expected ]!

testEmptyOrNil	self assert: '' isEmptyOrNil.	self assert: nil isEmptyOrNil.	self assert: Array new isEmptyOrNil.	self deny: 'Timberwolf' isEmptyOrNil!

testFileExists	| theFileName |	self 		writeToFile: 'test' 		withFileNameDo:[ :fileName |			self assert: (GRPlatform current fileExists: fileName).			theFileName := fileName ].	self deny: (GRPlatform current fileExists: theFileName)!

testGreaseAsByteArray	self assert: 1024 greaseAsByteArray equals: #[4 0].	self assert: (SmallInteger maxVal + 10) greaseAsByteArray equals: #[16 0 0 0 0 0 0 9].	self assert: (SmallInteger minVal - 10) greaseAsByteArray equals: #[16 0 0 0 0 0 0 10].	self assert: #[1 2 3] greaseAsByteArray equals: #[1 2 3].	self assert: '123' greaseAsByteArray equals: #[49 50 51]!

testGreaseByteAt	self assert: (1024 greaseByteAt: 1) equals: 0.	self assert: (1024 greaseByteAt: 2) equals: 4.	self assert: ((SmallInteger maxVal + 10) greaseByteAt: 1) equals: 9.	self assert: ((SmallInteger maxVal + 10) greaseByteAt: 8) equals: 16.	self assert: ((SmallInteger minVal - 10) greaseByteAt: 1) equals: 10.	self assert: ((SmallInteger minVal - 10) greaseByteAt: 8) equals: 16!

testGreaseBytesCount	self assert: 1024 greaseBytesCount equals: 2.	self assert: (SmallInteger maxVal + 10) greaseBytesCount equals: 8.	self assert: (SmallInteger minVal + 10) greaseBytesCount equals: 8!

testGreaseIntegerOnCharacterAscii	"ASCII (1 byte)"	self assert: $a greaseInteger = 97.	self assert: $A greaseInteger = 65!

testGreaseIntegerOnCharacterBmp	"BMP (3 byte)"	| euro |	euro := self decodeUtf8Character: #(226 130 172 ).	self assert: euro greaseInteger = 8364!

testGreaseIntegerOnCharacterLatin1	"Latin-1 (2 byte)"	| oWithStroke |	oWithStroke := self decodeUtf8Character: #(195 152 ).	self assert: oWithStroke greaseInteger = 216!

testGreaseIntegerOnCharacterSmp	"SMP (4 byte)"	| manna |	manna := self decodeUtf8Character: #(240 144 140 188 ).	self assert: manna greaseInteger = 66364!

testGreaseIntegerOnNumber	self assert: 2007 greaseInteger = 2007.	self assert: 2007.0 greaseInteger = 2007.	self assert: 2007.1 greaseInteger = 2007.	self assert: 2007.9 greaseInteger = 2007!

testGreaseIntegerOnString	self assert: '' greaseInteger isNil.	self assert: 'a' greaseInteger isNil.	self assert: ' 1' greaseInteger isNil.	self assert: 'a1' greaseInteger isNil.	self assert: '-' greaseInteger isNil.	self assert: '-a' greaseInteger isNil.	self assert: '0' greaseInteger = 0.	self assert: '12' greaseInteger = 12.	self assert: '123' greaseInteger = 123.	self assert: '123456789' greaseInteger = 123456789.	self assert: '-0' greaseInteger = 0.	self assert: '-12' greaseInteger = -12.	self assert: '-123.4' greaseInteger = -123.	self assert: '-123456789' greaseInteger = -123456789!

testGreaseString	self assert: 'Timberwolf' greaseString = 'Timberwolf'.	self assert: #DireWolf greaseString = 'DireWolf'.	self deny: #DireWolf greaseString isSymbol.	self assert: true greaseString = 'true'.	self assert: 666 greaseString = '666'.	"make sure we're not immediate"	self assert: ((2 raisedTo: 64) + 1) greaseString = '18446744073709551617'.	"make sure we're not immediate"	self assert: ((2 raisedTo: 64) + 1) negated greaseString = '-18446744073709551617'.	self assert: $A greaseString = 'A'.	self assert: nil greaseString = 'nil'.	[	"Smalltalk/X has constant folding so 1 / 0 will be evaluated at compile time		resulting in an error when loading the code."		1 perform: #/ with: 0 ] 		on: ZeroDivide		do: [ :error | self assert: error greaseString isString ].	self assert: 15.25 greaseString = '15.25'.	self assert: nil greaseString isString.	self assert: (4 @ 2) greaseString = '4@2'.	"#greaseString for a byte array should not do any decoding	this is in place to catch encoding errors early"	self assert: #(101 97 ) asByteArray greaseString ~= 'ea'.	self assert: #(101 97 ) asByteArray greaseString isString.	self assert: Object new greaseString isString.	"Printing scaled decimals (https://github.com/SeasideSt/Grease/issues/1)"	self assert: 1.21s3 greaseString = '1.210'.	self assert: -1.21s3 greaseString = '-1.210'!

testIfNil	self assert: (nil ifNil: [ 1 ]) = 1.	self assert: (1 ifNil: [ 2 ]) = 1!

testIfTrueIfFalse	self assert: (false ifFalse: [ #false ]) = #false.	self assert: (false ifTrue: [ #true ]) isNil.	self assert: (true ifTrue: [ #true ]) = #true.	self assert: (true ifFalse: [ #false ]) isNil.	self assert: (true ifTrue: [ #true ] ifFalse: [ #false ]) = #true.	self assert: (false ifTrue: [ #true ] ifFalse: [ #false ]) = #false.	self assert: (true ifFalse: [ #false ] ifTrue: [ #true ]) = #true.	self assert: (false ifFalse: [ #false ] ifTrue: [ #true ]) = #false!

testIsCharacter	self deny: 7 isCharacter.	self assert: $7 isCharacter!

testIsCollection	self deny: Object new isCollection!

testIsKeyword	self deny: #isKeyword isKeyword.	self deny: #+ isKeyword.	self assert: #isKeyword: isKeyword.	self assert: #isKeyword:isKeyword: isKeyword!

testIsUnary	self assert: #isUnary isUnary.	self deny: #+ isUnary.	self deny: #isUnary: isUnary.	self deny: #isUnary:isUnary: isUnary!

testLabel	self assert: (self platform label isKindOf: String).	self deny: self platform label isEmpty!

testNewline	self assert: GRPlatform current newline isString.	self deny: GRPlatform current newline isEmpty!

testNewTemporaryFile	| temporaryFile1 temporaryFile2 |	[		temporaryFile1 := GRPlatform current newTemporaryFile.		temporaryFile2 := GRPlatform current newTemporaryFile.		GRPlatform current			writeFileStreamOn: temporaryFile1			do: [ :str | str nextPutAll: 'test temporary' ]			binary: false.		GRPlatform current			writeFileStreamOn: temporaryFile2			do: [ :str | str nextPutAll: #[116 101 115 116 32 116 101 109 112 111 114 97 114 121] ]			binary: true.		self assert: (GRPlatform current fileExists: temporaryFile1).		self deny: (GRPlatform current localNameOf: temporaryFile1) equals: (GRPlatform current localNameOf: temporaryFile2)	] ensure: [ GRPlatform current deleteFile: temporaryFile1. GRPlatform current deleteFile: temporaryFile2  ].	self deny: (GRPlatform current fileExists: temporaryFile1).	self deny: (GRPlatform current fileExists: temporaryFile2)!

testNewTemporaryFileNamed	| temporaryFile fileName |	fileName := 'GRPlatformTestTemporaryFile'.	[		temporaryFile := GRPlatform current newTemporaryFileNamed: fileName.		GRPlatform current			writeFileStreamOn: temporaryFile			do: [ :str | str nextPutAll: 'test temporary' ]			binary: false.		self assert: (GRPlatform current fileExists: temporaryFile).		self should: [ GRPlatform current newTemporaryFileNamed: fileName ] raise: GRError.	] ensure: [ GRPlatform current deleteFile: temporaryFile ].	self deny: (GRPlatform current fileExists: temporaryFile).	!

testNumArgs	self assert: #not numArgs isZero.	self assert: #+ numArgs = 1.	self assert: #and: numArgs = 1.	self assert: #value:value: numArgs = 2!

testPathSeparator	self assert: GRPlatform current pathSeparator isString!

testPrintStringLimitedTo	| longString shortString |	longString := String streamContents: [ :stream |		1 to: 1000 do: [ :i | stream nextPutAll: i printString ] ].	"Squeak implementation adds 9 characters to limited string and VA Smalltalk adds 10, so we can't do an exact count."	self assert: longString printString size > 65.	shortString := longString printStringLimitedTo: 50.	self assert: shortString size < 65!

testRandomGenerator	| generator collection |	generator := self platform newRandom.	self should: [ generator nextInt: 0 ] raise: Error.	self assert: (generator nextInt: 1) = 1.	collection := (1 to: 200) collect: [ :ea | generator nextInt: 2 ].	self assert: (collection includes: 1).	self assert: (collection includes: 2).	self assert: collection asSet size = 2.	collection := 1 to: 5.	self assert: (collection includes: (generator randomFrom: collection)).	collection := -1.5 to: 3.5.	self assert: (collection includes: (generator randomFrom: collection)).	collection := #(1 2 3 4 5).	self assert: (collection includes: (generator randomFrom: collection)).	collection := #(1 2 3 4 5) asSet.	self assert: (collection includes: (generator randomFrom: collection))!

testReadStreamAtEnd	"ANSI 5.9.2.1"		| stream |	stream := '' readStream.	self assert: stream atEnd.	stream := 'a' readStream.	self deny: stream atEnd!

testReadStreamContents	"ANSI 5.9.3.1"		| stream |	stream := 'abc' readStream.	self assert: stream contents = 'abc'.	stream next: 2.	self assert: stream contents = 'abc'!

testReadStreamNegativeSkip	"ANSI does not mention negative values being used with #skip: but we	believe they work consistently. If not, we need to update our coding	conventions to make sure we never do this."		| stream position |	stream := 'abcd' readStream.	stream next; next.	position := stream position.	self assert: (stream peek) = $c.	stream skip: -1.	self assert: stream position = (position - 1).	self assert: (stream peek) = $b!

testReadStreamNext	"ANSI 5.9.2.3"		| stream |	stream := 'abcd' readStream.	self assert: stream next = $a.	self assert: (stream next: 0) = ''.	self assert: (stream next: 1) = 'b'.	self assert: (stream next: 2) = 'cd'!

testReadStreamPeek	"ANSI 5.9.2.7"		| stream |	stream := 'abcd' readStream.	self assert: stream peek = $a.		stream := '' readStream.	self assert: stream peek isNil!

testReadStreamPosition	"ANSI 5.9.1.4 and 5.9.1.5"		| stream |	stream := 'abc' readStream.	self assert: stream position = 0.	stream next.	self assert: stream position = 1.	stream next.	self assert: stream position = 2.	stream next.	self assert: stream position = 3.		stream position: 1.	self assert: stream position = 1.	self assert: stream next = $b.	stream position: 0.	self assert: stream position = 0.	self assert: stream next = $a.	stream position: 3.	self assert: stream atEnd!

testReadStreamReset	"ANSI 5.9.1.6"		| stream |	stream := 'abc' readStream.	stream next: 2.	stream reset.	self assert: stream next = $a!

testReadStreamSeasideUpToAll	| stream string1 string2 |	stream := 'abc12def' readStream.	string1 := stream greaseUpToAll: '12'.	string2 := stream greaseUpToAll: '12'.	self assert: string1 = 'abc'.	self assert: string2 = 'def'.	self assert: stream atEnd!

testReadStreamSkip	"ANSI 5.9.2.9"		| stream |	stream := 'abcd' readStream.	self assert: (stream skip: 2; peek) = $c!

testReadStreamUpTo	"ANSI 5.9.2.11"		| stream |	stream := 'abcd' readStream.	self assert: (stream upTo: $c) = 'ab'.	self assert: stream next = $d.		stream := 'abcd' readStream.	self assert: (stream upTo: $x) = 'abcd'.	self assert: stream atEnd!

testReadStreamUpToEnd	"Not defined by ANSI."		| stream |	stream := 'abcd' readStream.	self assert: stream upToEnd = 'abcd'.	self assert: stream atEnd.	self assert: stream upToEnd = ''.	self assert: stream atEnd.		stream := 'abcd' readStream.	stream upTo: $b.	self assert: stream upToEnd = 'cd'.	self assert: stream atEnd!

testReadWriteStreamAtEnd	"ANSI 5.9.2.1"	| stream |	stream := GRPlatform current readWriteCharacterStream.	self assert: stream atEnd.	stream		nextPut: $a;		reset.	self deny: stream atEnd!

testReadWriteStreamContents	"ANSI 5.9.3.1"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abc';		reset.	self assert: stream contents = 'abc'.	stream next: 2.	self assert: stream contents = 'abc'.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abc' asByteArray;		reset.	self assert: stream contents = 'abc' asByteArray.	stream next: 2.	self assert: stream contents = 'abc' asByteArray!

testReadWriteStreamNegativeSkip	"ANSI does not mention negative values being used with #skip: but we	believe they work consistently. If not, we need to update our coding	conventions to make sure we never do this."	| stream position |	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abcd';		reset.	stream		next;		next.	position := stream position.	self assert: stream peek = $c.	stream skip: -1.	self assert: stream position = (position - 1).	self assert: stream peek = $b.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abcd' asByteArray;		reset.	stream		next;		next.	position := stream position.	self assert: stream peek = 99.	stream skip: -1.	self assert: stream position = (position - 1).	self assert: stream peek = 98!

testReadWriteStreamNext	"ANSI 5.9.2.3"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abcd';		reset.	self assert: stream next = $a.	self assert: (stream next: 0) = ''.	self assert: (stream next: 1) = 'b'.	self assert: (stream next: 2) = 'cd'.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abcd' asByteArray;		reset.	self assert: stream next = 97.	self assert: (stream next: 0) = '' asByteArray.	self assert: (stream next: 1) = 'b' asByteArray.	self assert: (stream next: 2) = 'cd' asByteArray!

testReadWriteStreamNextPut	"ANSI 5.9.4.3"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream nextPut: $a.	self assert: stream contents = 'a'.	stream := GRPlatform current readWriteByteStream.	stream nextPut: 97.	self assert: stream contents = 'a' asByteArray!

testReadWriteStreamNextPutAll	"ANSI 5.9.4.4"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream nextPutAll: 'abc'.	self assert: stream contents = 'abc'.	stream := GRPlatform current readWriteCharacterStream.	stream nextPutAll: #($a $b $c).	self assert: stream contents = 'abc'.	stream := GRPlatform current readWriteByteStream.	stream nextPutAll: #(97 98 99 ) asByteArray.	self assert: stream contents = 'abc' asByteArray!

testReadWriteStreamPeek	"ANSI 5.9.2.7"	| stream |	stream := GRPlatform current readWriteCharacterStream.	self assert: stream peek isNil.	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abcd';		reset.	self assert: stream peek = $a.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abcd' asByteArray;		reset.	self assert: stream peek = 97!

testReadWriteStreamPosition	"ANSI 5.9.1.4 and 5.9.1.5"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abc';		reset.	self assert: stream position = 0.	stream next.	self assert: stream position = 1.	stream next.	self assert: stream position = 2.	stream next.	self assert: stream position = 3.	stream position: 1.	self assert: stream position = 1.	self assert: stream next = $b.	stream position: 0.	self assert: stream position = 0.	self assert: stream next = $a.	stream position: 3.	self assert: stream atEnd.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abc' asByteArray;		reset.	self assert: stream position = 0.	stream next.	self assert: stream position = 1.	stream next.	self assert: stream position = 2.	stream next.	self assert: stream position = 3.	stream position: 1.	self assert: stream position = 1.	self assert: stream next = 98.	stream position: 0.	self assert: stream position = 0.	self assert: stream next = 97.	stream position: 3.	self assert: stream atEnd!

testReadWriteStreamReset	"ANSI 5.9.1.6"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abc';		reset.	stream next: 2.	stream reset.	self assert: stream next = $a.	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abc';		reset.	stream nextPutAll: 'def'.	self assert: stream contents = 'def'.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abc' asByteArray;		reset.	stream next: 2.	stream reset.	self assert: stream next = 97!

testReadWriteStreamSkip	"ANSI 5.9.2.9"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abcd';		reset.	self assert: (stream			skip: 2;			peek) = $c.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abcd' asByteArray;		reset.	self assert: (stream			skip: 2;			peek) = 99!

testReadWriteStreamTab	"ANSI 5.9.4.6"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream tab.	self assert: stream contents first = Character tab!

testReadWriteStreamUpTo	"ANSI 5.9.2.11"	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abcd';		reset.	self assert: (stream upTo: $c) = 'ab'.	self assert: stream next = $d.	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abcd';		reset.	self assert: (stream upTo: $x) = 'abcd'.	self assert: stream atEnd.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abcd' asByteArray;		reset.	self assert: (stream upTo: 99) = #(97 98 ) asByteArray.	self assert: stream next = 100.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abcd' asByteArray;		reset.	self assert: (stream upTo: 120) = #(97 98 99 100 ) asByteArray.	self assert: stream atEnd!

testReadWriteStreamUpToEnd	"Not defined by ANSI."	| stream |	stream := GRPlatform current readWriteCharacterStream.	stream		nextPutAll: 'abcd';		reset.	self assert: stream upToEnd = 'abcd'.	self assert: stream atEnd.	self assert: stream upToEnd = ''.	self assert: stream atEnd.	stream reset.	stream upTo: $b.	self assert: stream upToEnd = 'cd'.	self assert: stream atEnd.	stream := GRPlatform current readWriteByteStream.	stream		nextPutAll: 'abcd' asByteArray;		reset.	self assert: stream upToEnd = #(97 98 99 100 ) asByteArray.	self assert: stream atEnd.	self assert: stream upToEnd = #() asByteArray.	self assert: stream atEnd.	stream reset.	stream upTo: 98.	self assert: stream upToEnd = #(99 100 ) asByteArray.	self assert: stream atEnd!

testSeconds	self assert: Time now seconds isInteger!

testSecureHashFor	"Make sure the platform class provides a #secureHashFor: method. The method is called by Seaside when hashing passwords. The Squeak implementation returns a SHA-1 hash but another equivalent hash method could also be used."		| a b |	a := self platform secureHashFor: 'foobar'.	b := self platform secureHashFor: 'foobar'.		self assert: (a = b)!

testShutDownList	"A smoke test: checks if the test-class can be added and removed to the shutdown list."		[ self platform addToShutDownList: self class ]		ensure: [  self platform removeFromShutDownList: self class ]!

testSizeOfFile	| theFileName |	self		writeToFile: 'test me'		withFileNameDo:[ :fileName |			self assert: (GRPlatform current sizeOfFile: fileName) equals: 7.			theFileName := fileName ].	self deny: (GRPlatform current fileExists: theFileName)!

testStackDepth	| stackDepth someBlock |	stackDepth := self platform stackDepth.	self assert: stackDepth isInteger.	self assert: stackDepth > 0.	someBlock := [ self assert: self platform stackDepth > stackDepth ].	someBlock value.	self assert: stackDepth = self platform stackDepth!

testStartUpList	"A smoke test: checks if the test-class can be added and removed to the startup list."		[  self platform addToStartUpList: self class ]		ensure: [  self platform removeFromStartUpList: self class ]!

testSymbolAsMutator	"test for:	Symbol >> #asMutator	^ (self copyWith: $:) asSymbol"	self assert: #name greaseAsMutator = #name:!

testTerminate	| ensureRun ifCurtailedRun semaphore1 semaphore2 semaphore3 semaphore4 process |	ensureRun := false.	ifCurtailedRun := false.	semaphore1 := self platform semaphoreClass new.	semaphore2 := self platform semaphoreClass new.	semaphore3 := self platform semaphoreClass new.	semaphore4 := self platform semaphoreClass new.	process := [		[ [ semaphore1 signal. semaphore2 wait ]			ensure: [ ensureRun := true. semaphore3 signal ] ]			ifCurtailed: [ ifCurtailedRun := true. semaphore4 signal ] ] newProcess.	self deny: (self platform isProcessTerminated: process).	process resume.	semaphore1 wait.	self deny: (self platform isProcessTerminated: process).	self platform terminateProcess: process.	semaphore3 wait.	self assert: ensureRun.	semaphore4 wait.	self assert: ifCurtailedRun.	self assert: (self platform isProcessTerminated: process)!

testThisContext	| methodContext block ctx |	"This is just a basic test to see if thisContext works"	methodContext := self platform thisContext.	block := [ | blockContext |		blockContext := self platform thisContext.		self assert: blockContext sender = methodContext.		"The following is a difference between Gemstone and Pharo... "		(Smalltalk includesKey: #GRGemStonePlatform)			ifTrue: [ self assert: blockContext receiver = block ]			ifFalse: [ 				self assert: blockContext receiver = self.				(blockContext respondsTo: #tempNamed:)					ifTrue:[ self assert: (blockContext tempNamed: 'blockContext') == blockContext ]					ifFalse:[ self assert:  (blockContext namedTempAt: (blockContext tempNames indexOf: #blockContext)) == blockContext ] ].		(blockContext respondsTo: #tempNamed:)			ifTrue:[ self assert: (blockContext tempNamed: 'methodContext') == methodContext ]			ifFalse: [ self assert: (blockContext namedTempAt: (blockContext tempNames indexOf: #methodContext)) == methodContext ] ].			block value.	self assert: self returnSender = methodContext.	self assert: methodContext receiver = self.	ctx := self platform thisContext.	(ctx respondsTo: #tempNamed:)		ifTrue:[	self assert: (ctx tempNamed: 'block') == block ]		ifFalse: [ self assert: (ctx namedTempAt: (ctx tempNames indexOf: #block)) == block ]!

testTotalSeconds	"Answer the total seconds since the Squeak epoch: 1 January 1901."	| seconds |	seconds := Time totalSeconds.	self assert: seconds isInteger.	self assert: seconds > 3421645167!

testVersion	self assert: (self platform version isKindOf: GRVersion).	self assert: (self platform versionString isKindOf: String).	self deny: self platform versionString isEmpty!

testWriteStreamContents	| stream |	stream := GRPlatform current writeCharacterStreamOn: String new.	self assert: stream contents = ''.	stream		nextPutAll: 'abcdef'.	self assert: stream contents = 'abcdef'.	stream		reset;		nextPutAll: 'gh'.	self assert: stream contents = 'gh'!

testWriteStreamCrLf	| stream |	stream := WriteStream on: String new.	stream crlf.	self assert: stream contents first codePoint = 13.	self assert: stream contents second codePoint = 10!

testWriteStreamNextPut	"ANSI 5.9.4.3"		| stream |	stream := WriteStream on: String new.	stream nextPut: $a.	self assert: stream contents = 'a'!

testWriteStreamNextPutAll	"ANSI 5.9.4.4"		| stream |	stream := WriteStream on: String new.	stream nextPutAll: 'abc'.	self assert: stream contents = 'abc'.		stream := WriteStream on: String new.	stream nextPutAll: #($a $b $c).	self assert: stream contents = 'abc'!

testWriteStreamPosition	| stream |	stream := GRPlatform current writeCharacterStreamOn: String new.	self assert: stream position = 0.	stream nextPutAll: 'abc'.	self assert: stream position = 3.	stream reset.	self assert: stream position = 0!

testWriteStreamReset	"ANSI 5.9.1.6"		| stream |	stream := WriteStream on: String new.	stream nextPutAll: 'abc'.	stream reset.	stream nextPutAll: 'def'.	self assert: stream contents = 'def'!

testWriteStreamSpace	"ANSI 5.9.4.5"		| stream |	stream := WriteStream on: String new.	stream space.	self assert: stream contents first = Character space!

testWriteStreamTab	"ANSI 5.9.4.6"		| stream |	stream := WriteStream on: String new.	stream tab.	self assert: stream contents first = Character tab!

testWriteToFileInFolder	| bytes text |	bytes := ByteArray new.	self		writeToFile: bytes 		withFileNameDo:[ :fileName |			self assert: (GRPlatform current contentsOfFile: fileName binary: true) equals: bytes ].	bytes := #[80 104 39 110 103 108 117 105 32 109 103 108 119 39 110 97 102 104 32 67 116 104 117 108 104 117 32 82 39 108 121 101 104 32 119 103 97 104 39 110 97 103 108 32 102 104 116 97 103 110].	self 		writeToFile: bytes 		withFileNameDo:[ :fileName |			self assert:(GRPlatform current contentsOfFile: fileName binary: true) equals: bytes ].	text := String new.	self 		writeToFile: text 		withFileNameDo:[ :fileName |			self assert: (GRPlatform current contentsOfFile: fileName binary: false) equals: text ].			text := 'Ph''nglui mglw''nafh Cthulhu R''lyeh wgah''nagl fhtagn'.	self 		writeToFile: text 		withFileNameDo:[ :fileName |			self assert: (GRPlatform current contentsOfFile: fileName binary: false) equals: text ] ! !

!GRPlatformTest categoriesForMethods!
decodeUtf8Character:!private! !
platform!accessing!public! !
returnSender!private! !
runCase!public!running! !
testAsNumber!public!tests! !
testBase64Decode!public!tests/encoding! !
testBase64Encode!public!tests/encoding! !
testBindingOf!public!tests! !
testBlockContextWithPossibleArguments!public!tests! !
testBlockValuableProtocol!public!tests! !
testCharacterAsUnicode!public!tests! !
testCharacterTo!public!tests! !
testCompileAsciiString!public!tests/file library! !
testCompileUnicodeString!public!tests/file library! !
testConvertToSmalltalkNewlines!public!tests! !
testDateArithmetic!public!tests! !
testDaysInMonthForYear!public!tests! !
testDigitValue!public!tests! !
testEmptyOrNil!public!tests! !
testFileExists!public!tests/files! !
testGreaseAsByteArray!public!tests/encoding! !
testGreaseByteAt!public!tests/encoding! !
testGreaseBytesCount!public!tests/encoding! !
testGreaseIntegerOnCharacterAscii!public!tests! !
testGreaseIntegerOnCharacterBmp!public!tests! !
testGreaseIntegerOnCharacterLatin1!public!tests! !
testGreaseIntegerOnCharacterSmp!public!tests! !
testGreaseIntegerOnNumber!public!tests! !
testGreaseIntegerOnString!public!tests! !
testGreaseString!public!tests! !
testIfNil!public!tests! !
testIfTrueIfFalse!public!tests! !
testIsCharacter!public!tests! !
testIsCollection!public!tests! !
testIsKeyword!public!tests! !
testIsUnary!public!tests! !
testLabel!public!tests! !
testNewline!public!tests! !
testNewTemporaryFile!public!tests/files! !
testNewTemporaryFileNamed!public!tests/files! !
testNumArgs!public!tests! !
testPathSeparator!public!tests! !
testPrintStringLimitedTo!public!tests! !
testRandomGenerator!public!tests/streams! !
testReadStreamAtEnd!public!tests/streams! !
testReadStreamContents!public!tests/streams! !
testReadStreamNegativeSkip!public!tests/streams! !
testReadStreamNext!public!tests/streams! !
testReadStreamPeek!public!tests/streams! !
testReadStreamPosition!public!tests/streams! !
testReadStreamReset!public!tests/streams! !
testReadStreamSeasideUpToAll!public!tests/streams/seaside! !
testReadStreamSkip!public!tests/streams! !
testReadStreamUpTo!public!tests/streams! !
testReadStreamUpToEnd!public!tests/streams! !
testReadWriteStreamAtEnd!public!tests/streams! !
testReadWriteStreamContents!public!tests/streams! !
testReadWriteStreamNegativeSkip!public!tests/streams! !
testReadWriteStreamNext!public!tests/streams! !
testReadWriteStreamNextPut!public!tests/streams! !
testReadWriteStreamNextPutAll!public!tests/streams! !
testReadWriteStreamPeek!public!tests/streams! !
testReadWriteStreamPosition!public!tests/streams! !
testReadWriteStreamReset!public!tests/streams! !
testReadWriteStreamSkip!public!tests/streams! !
testReadWriteStreamTab!public!tests/streams! !
testReadWriteStreamUpTo!public!tests/streams! !
testReadWriteStreamUpToEnd!public!tests/streams! !
testSeconds!public!tests! !
testSecureHashFor!public!tests! !
testShutDownList!public!tests/image! !
testSizeOfFile!public!tests/files! !
testStackDepth!public!tests! !
testStartUpList!public!tests/image! !
testSymbolAsMutator!public!tests! !
testTerminate!public!tests/processes! !
testThisContext!public!tests! !
testTotalSeconds!public!tests! !
testVersion!public!tests! !
testWriteStreamContents!public!tests/streams! !
testWriteStreamCrLf!public!tests/streams! !
testWriteStreamNextPut!public!tests/streams! !
testWriteStreamNextPutAll!public!tests/streams! !
testWriteStreamPosition!public!tests/streams! !
testWriteStreamReset!public!tests/streams! !
testWriteStreamSpace!public!tests/streams! !
testWriteStreamTab!public!tests/streams! !
testWriteToFileInFolder!public!tests/files! !
!

