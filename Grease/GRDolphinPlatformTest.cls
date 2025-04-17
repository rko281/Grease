"Filed out from Dolphin Smalltalk"!

GRPlatformTest subclass: #GRDolphinPlatformTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDolphinPlatformTest guid: (GUID fromString: '{99844eab-2843-4c32-af25-a40c516921b8}')!

GRDolphinPlatformTest comment: ''!

!GRDolphinPlatformTest categoriesForClass!Unclassified! !

!GRDolphinPlatformTest methodsFor!

decodeUtf8Character: aCollectionOfIntegers 	"Decodes a collection of bytes into a single character. We have this so we can avoid having non-ASCII characters in the source."	| codec toDecode decoded |	codec := GRCodec forEncoding: 'utf-8'.	toDecode := aCollectionOfIntegers asByteArray.	decoded := codec decode: toDecode.	self assert: decoded characterCount = 1. "Superclass implementation uses size to mean number of Characters. size in Dolphin returns code units so change accordingly"	^ decoded readStream next "Superclass implementation uses first; in Dolphin this returns the first code unit not Character. Use stream to get full Character"!

testCompileIntoClassified
	| source protocol selectors selector |
	source := 'aMethod
	^ ''a result'''.
	protocol := 'a-protocol'.
	selector := #aMethod.

	GRPlatform current compile: source into: self class classified: protocol.
	[	self assert: (self class selectors includes: selector).
		selectors := (MethodCategory name: protocol) methods collect: [:each | each selector].
		self assert: (selectors includes: selector).
	 	] ensure: [ GRPlatform current removeSelector: selector from: self class ]!

testDaysInMonthForYear	(1 to: 12) with: #(31 28 31 30 31 30 31 31 30 31 30 31) do: [ :month :days |		self assert: days = (Date daysInMonth: (Locale default monthName: month) forYear: 2007) ]!

testFullName
	self assert: Object fullName = 'Object'!

testGreaseAsByteArray
	self assert: 1024 greaseAsByteArray equals: #[4 0].

	"Hard-code Pharo value for the superclass implementation"
	self assert: 1152921504606846985 greaseAsByteArray equals: #[16 0 0 0 0 0 0 9].

	"Negative encodings differ from Pharo so we raise an error at the moment"
	self should: [self assert: -1152921504606846986 greaseAsByteArray] raise: Error.

	self assert: #[1 2 3] greaseAsByteArray equals: #[1 2 3].
	self assert: '123' greaseAsByteArray equals: #[49 50 51]!

testGreaseByteAt
	self assert: (1024 greaseByteAt: 1) equals: 0.
	self assert: (1024 greaseByteAt: 2) equals: 4.

	"Hard-code Pharo value for the superclass implementation"
	self assert: (1152921504606846985 greaseByteAt: 1) equals: 9.
	self assert: (1152921504606846985 greaseByteAt: 8) equals: 16.

	"Negative encodings differ from Pharo so we raise an error at the moment"
	self should: [(SmallInteger minVal - 10) greaseByteAt: 1] raise: Error!

testGreaseBytesCount	self assert: 1024 greaseBytesCount equals: 2.

	"Hard-code Pharo value for the superclass implementation"
	self assert: 1152921504606846985 greaseBytesCount equals: 8.

	"Negative encodings differ from Pharo so we raise an error at the moment"
	self should: [(SmallInteger minVal - 10) greaseBytesCount ] raise: Error!

testMessageSendValueWithPossibleArguments
	| send |
	send := MessageSend receiver: 1 selector: #+.
	self assert: (send valueWithPossibleArguments: (Array with: 2)) = 3.
	self should: [self assert: (send valueWithArguments: (Array with: 2)) = 3] raise: Error. "<- Dolphin doesn't like this..."
	self should: [self assert: (send value: 2) = 3] raise: Error. "<-...or this. We could reimplement to fix (implementations are inherited from MessageSendAbstract) but this is fairly basic functionality so we leave well alone"

	send := MessageSend receiver: false selector: #not.
	self assert: (send valueWithPossibleArguments: (Array with: 3)).
	
	send := MessageSend receiver: 1 selector: #+ arguments: #(2).
	self assert: (send valueWithPossibleArguments: (Array with: 4)) = 3.
	self assert: send value = 3.
	
	send := MessageSend receiver: Array selector: #with:with: arguments: #(1).
	self assert: (send valueWithPossibleArguments: (Array with: 2)) size = 2.

	send := MessageSend receiver: Array selector: #with:with:.
	self should: [self assert: (send value: 1 value: 2) size = 2] raise: Error "See above".
	
	send := MessageSend 
		receiver: 1
		selector: #+.
	self assert: send argumentCount = 1.
	self assert: send arguments size = 0.
	self assert: send fixCallbackTemps == send.
	
	send := MessageSend 
		receiver: 1
		selector: #+
		argument: 2.
	self assert: send argumentCount isZero.
	self assert: send arguments size = 1.
	self assert: send fixCallbackTemps == send!

testSeconds

	"Does not hold true for Dolphin:
	self assert: Time now seconds isInteger"!

testSizeOfFile

	"Use binary file to avoid BOM confusion"
	| theFileName |	self		writeToFile: 'test me' asByteArray		withFileNameDo:[ :fileName |			self assert: (GRPlatform current sizeOfFile: fileName) equals: 7.			theFileName := fileName ].	self deny: (GRPlatform current fileExists: theFileName)!

testThisContext	| methodContext block |	"This is just a basic test to see if thisContext works"	methodContext := self platform thisContext.	block := [ | blockContext |		blockContext := self platform thisContext.		self assert: blockContext sender = methodContext.		self assert: blockContext receiver = self].			block value.	self assert: self returnSender = methodContext.	self assert: methodContext receiver = self!

writeToFile: aStringOrByteArray withFileNameDo: aBlock
	| fileName directory |
	fileName :=  'GRPharoPlatformTest'.
	directory := File workingDirectory.
	[ GRPlatform current
		write: aStringOrByteArray
		toFile: fileName
		inFolder: directory.
	aBlock value: (File composePath: directory subPath: fileName)
		] ensure: [
			File delete: (File composePath: directory subPath: fileName) ]! !

!GRDolphinPlatformTest categoriesForMethods!
decodeUtf8Character:!private! !
testCompileIntoClassified!public!tests! !
testDaysInMonthForYear!public!tests! !
testFullName!public!tests! !
testGreaseAsByteArray!public!tests/encoding! !
testGreaseByteAt!public!tests/encoding! !
testGreaseBytesCount!public!tests/encoding! !
testMessageSendValueWithPossibleArguments!public!tests! !
testSeconds!public!tests! !
testSizeOfFile!public!tests/files! !
testThisContext!public!tests! !
writeToFile:withFileNameDo:!public!tests! !
!

