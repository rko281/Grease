"Filed out from Dolphin Smalltalk"!

GRPlatform subclass: #GRDolphinPlatform
	instanceVariableNames: ''
	classVariableNames: 'SmtpServer UrlTable XmlTable'
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDolphinPlatform guid: (GUID fromString: '{1edc8b9c-2d1c-494f-b8b3-e4ec6f548bac}')!

GRDolphinPlatform comment: ''!

!GRDolphinPlatform categoriesForClass!Unclassified! !

!GRDolphinPlatform methodsFor!

addToShutDownList: anObject
	"Add anObject to the shutdown-list of the system. On shutdown the message #shutDown: will be sent to anObject.
	To be compatible with Pharo we also need to hook onto the imageSaveStarting event"

	SessionManager current
		when: #sessionStopped send: #shutDown: to: anObject with: true;
		when: #imageSaveStarting send: #shutDown: to: anObject with: false!

addToStartUpList: anObject
	"Add anObject to the startup-list of the system. On startup the message #startUp: will be sent to anObject..
	To be compatible with Pharo we also need to hook onto the imageSaveCompleted event"

	SessionManager current
		when: #sessionStarted send: #startUp: to: anObject with: true;
		when: #imageSaveCompleted send: #startUp: to: anObject with: false!

asMethodReturningByteArray: aByteArrayOrString named: aSymbol
	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a ByteArray"
	^self useByteArrayLiterals
		ifTrue: [ self asMethodReturningByteArrayLiteral: aByteArrayOrString named: aSymbol ]
		ifFalse: [ self asMethodReturningByteArrayWithCache: aByteArrayOrString named: aSymbol ]!

asMethodReturningByteArrayLiteral: aByteArrayOrString named: aSymbol
	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a byte array using VW/NewCompiler byte array literal syntax."
	^String streamContents: [ :stream |
		stream nextPutAll: aSymbol; nextPut: Character cr.
		stream tab; nextPutAll: '^ #['.
		aByteArrayOrString asByteArray
			do: [ :each | each printOn: stream ]
			separatedBy: [ stream space ].
		stream nextPutAll: ']' ]!

asMethodReturningByteArrayWithCache: aByteArrayOrString named: aSymbol
	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a byte array and caching this array in a literal array of size 1."
	^ String streamContents: [ :stream |
		stream nextPutAll: aSymbol; nextPut: Character cr.
		stream tab; nextPutAll: '^ #('.
		aByteArrayOrString asByteArray
			do: [ :each | each printOn: stream ]
			separatedBy: [ stream space ].
		stream nextPutAll: ') asByteArray' ]!

base64Decode: aString

	"Added asString to be compatible with Pharo: 
		(Base64MimeConverter mimeDecodeToChars: aString readStream) contents "

	^(ByteArray fromBase64String: aString) asString!

base64Encode: aByteArray

	| stream |

	stream := WriteStream on: (String new: aByteArray size * 2).
	aByteArray printBase64On: stream.
	^stream contents!

categoryNamed: aString
	"Private - Answer the MethodCategory named aString."

	^(Smalltalk at: #MethodCategory) name: aString!

compile: aString into: aClass classified: aSymbol
	"The trick here is to be as silently a possible so that the package is not marked dirty when running WAFileLibrary test.
	This also makes running tests much faster."
	
	| compileBlock dirty |
	compileBlock := [[aClass
					compile: aString
					categories: (Array with: (self categoryNamed: aSymbol asString))] on: MethodCompileFailed do: [:ex | GRError signal: 'syntax error' with: ex]].
	dirty := SessionManager isRuntime ifFalse: [aClass owningPackage ifNotNil: [:pac | pac isChanged]].
	[(Smalltalk at: #StsManager ifAbsent: [])
		ifNil: [compileBlock value]
		ifNotNil: [:sts | sts current ignoreCompilerWhile: compileBlock]]
			ensure: [SessionManager isRuntime ifFalse: [aClass owningPackage ifNotNil: [:pac | pac isChanged: dirty]]]!

contentsOfFile: aString binary: aBoolean
	| stream |
	stream := FileStream read: aString text: aBoolean not.
	^[stream contents] ensure: [stream close]!

convertToSmalltalkNewlines: aString
	"Convert any line endings (CR, CRLF, LF) to CR."

	"Dolphin version: Dolphin expects always CRLF.
	We assume that the actual senders of this message
	would expect CRLF for the Windows Dolphin Smalltalk."

	^aString ifNotNil: [aString withNormalizedLineDelimiters]!

deleteFile: aPathString	File delete: aPathString!

deliverMailFrom: fromAddress to: recipientList text: messageText

	CDOIMessage new
		from: fromAddress;
		sender: fromAddress;
		to: recipientList;
		textBody: messageText;
		configuration: self smtpConfiguration;
		Send!

directoriesIn: aPathString	"Answer a collection of absolute paths for all the directories (no files) in the directory given by aPathString	must not include directory names that start with ."	self subclassResponsibility!

ensureExistenceOfFolder: aString
	"creates a folder named aString in the image directory"
	File createDirectory: (FileLocator imageRelative localFileSpecFor: aString)!

fileExists: aString

	^File exists: aString!

filesIn: aPathString
	"Return a collection of absolute paths for all the files (no directories) in the directory given by aPathString
	must not include file names that start with ."
	| directory fileNames |
	directory := FileLocator imageRelative localFileSpecFor: aPathString.
	fileNames := OrderedCollection new.
	File for: '*.*' in: directory do: [:each |  (each isDirectory not and: [each fileName first ~= $. ]) ifTrue: [fileNames add: each path]].
	^fileNames!

findFirstInString: aString inSet: inclusionMap startingAt: start 
	"Private - Port of Pharo primitive.
	Which is the Dolphin implementation if there is one??"

	| i stringSize |
	inclusionMap size ~= 256 ifTrue: [^0].
	i := start.
	stringSize := aString size.
	[i <= stringSize and: [(inclusionMap at: (aString at: i) asciiValue + 1) = 0]] 
		whileTrue: [i := i + 1].
	i > stringSize ifTrue: [^0].
	^i!

includesUnsafeUrlCharacter: aString 
	^aString isWideString 
		or: [(self 
				findFirstInString: aString
				inSet: UrlTable
				startingAt: 1) ~= 0]!

includesUnsafeXmlCharacter: aString 
	^self isWideString
		or: [(self 
				findFirstInString: aString
				inSet: XmlTable
				startingAt: 1) ~= 0]!

integerAsByteArray: anInteger

	"1 - no leading zeroes
	2 - Dolphin encoding for negatives differs from Pharo; raise an Error for the moment"

	| stream started |

	anInteger negative ifTrue: [Error notYetImplemented].

	stream := ByteArray new writeStream.
	started := false.
	anInteger byteSize to: 1 by: -1 do: [:digitIndex || byte |
		byte := anInteger byteAt: digitIndex.
		started ifFalse: [started := byte > 0].
		started ifTrue: [stream nextPut: byte]].
	^ stream contents!

isProcessTerminated: aProcess
	"Return a boolean indicating whether aProcess has been terminated."
	^ aProcess isTerminated!

label
	^'Dolphin'!

localNameOf: aFilename
	^File splitFilenameFrom: aFilename!

newline
	^String lineDelimiter!

newRandom
	"Answers the random number generator to be used to create session and continuation keys. Make sure it is seeded. They only method that will be sent to it will be #nextInt: which should answer a random integer in the interval [1, anInteger]. Make sure this works in a load balanced scenario.
	
	Used by Gemstone/S traditional Randoms which cannot be persisted.
	Used by Squeak to use a secure random when avaiable."
	
	^Random new!

newTemporaryFile	"Create a new temporary file in the systems temp directory and answer its pathString.	It is the users responsibility to delete or move the file, it will not be cleaned up automatically 	(unless the host system has a policy for it)."	^ File temporaryFilename!

newTemporaryFileNamed: aName	"Create a new temporary file in the systems temp directory and answer its pathString.	It is the users responsibility to delete or move the file, it will not be cleaned up automatically 	(unless the host system has a policy for it)."	| path file |

	path := File composePath: File tempPath subPath: aName.
	(File exists: path) ifTrue: [self error: 'file exists'].
	file := File open: path mode: #create.
	file close.
	^path!

openDebuggerOn: anError
	
	^SessionManager current onUnhandledError: anError!

pathSeparator

	^File pathDelimiter asString!

readFileStreamOn: aString do: aBlock binary: aBoolean	self subclassResponsibility!

readWriteByteStream
	"ByteArray based read write stream"
	
	^ ReadWriteStream on: (ByteArray new: 4096)!

readWriteCharacterStream
	"String based read write stream"

	^ ReadWriteStream on: (String new: 4096)!

reducedConflictDictionary
	"used by Gemstone/S reduced conflict classes that can be used to avoid transaction conflicts"
	^LookupTable!

removeFromShutDownList: anObject
	"Remove anObject from the shutdown list in the system."

	"Dolphin version: This is not totally correct. We should modify
	this behavior to remove only from the shutDown list of the session."
	#toDo.
	SessionManager current events removeEventsTriggeredFor: anObject!

removeFromStartUpList: anObject
	"Remove anObject from the startup list in the system."

	"Dolphin version: This is not totally correct. We should modify
	this behavior to remove only from the startUp list of the session."
	#toDo.
	SessionManager current events removeEventsTriggeredFor: anObject!

removeSelector: aSymbol from: aClass
	
	| dirty actionBlock |
	dirty := SessionManager isRuntime ifFalse: [aClass owningPackage isChanged].
	actionBlock := [aClass removeSelector:aSymbol ifAbsent: []].
	[(Smalltalk at: #StsManager ifAbsent: [])
		ifNil: [actionBlock value]
		ifNotNil: [:sts | sts current ignoreCompilerWhile: actionBlock]]
			ensure: [SessionManager isRuntime ifFalse: [aClass owningPackage isChanged: dirty]]!

secureHashFor: aString
	^ SecureHashAlgorithm new hashMessageReturningBytes: aString!

selectorOfPragma: aPragma
	^ aPragma selector!

semaphoreClass
	"used by Gemstone/S traditional Semaphores which cannot be persisted"
	^Semaphore!

sizeOfFile: aString
	| file |
	file := File open: aString mode: #read.
	^[file size] ensure: [file close]!

smtpConfiguration

	| config |
	config := CDOIConfiguration new.
	config fields
		at: 'http://schemas.microsoft.com/cdo/configuration/smtpserver' 
			put: self smtpServer;
		at: 'http://schemas.microsoft.com/cdo/configuration/sendusing' 
			put: 2;
		at: 'http://schemas.microsoft.com/cdo/configuration/smtpauthenticate' 
			put: 0;
		interface Update.
	^config!

smtpServer
	^self class smtpServer!

stackDepth

	| depth current |
	depth := 0.
	current := Processor activeProcess topFrame.
	[current isNil] whileFalse: [
		current := current sender.
		depth := depth + 1].
	^depth - 1!

terminateProcess: aProcess
	"Permanently terminate the process, unwinding first to execute #ensure: and #ifCurtailed: blocks."
	aProcess terminate!

thisContext	"Answer the current activation of a method execution or block activation"

	^Processor activeProcess topFrame sender!

useByteArrayLiterals
	"whether ByteArray literals can/should be used"
	
	^true!

weakDictionaryOfSize: aNumber
	
	^WeakLookupTable new: aNumber!

write: aStringOrByteArray toFile: aFileNameString inFolder: aFolderString
	"Writes aStringOrByteArray to a file named aFilenameString in the folder aFolderString"
	| folder stream fullFilePath |
	folder := FileLocator imageRelative localFileSpecFor: aFolderString.
	fullFilePath := File fullPathOf: aFileNameString relativeTo: folder.
	stream := FileStream write: fullFilePath text: aStringOrByteArray isString.
	[stream nextPutAll: aStringOrByteArray] ensure: [stream close]!

writeFileStreamOn: aString do: aBlock binary: aBoolean	
	| stream |

	stream := FileStream write: aString mode: #truncate check: false text: aBoolean not.
	^[aBlock value: stream] ensure: [stream close]! !

!GRDolphinPlatform categoriesForMethods!
addToShutDownList:!public!startup! !
addToStartUpList:!public!startup! !
asMethodReturningByteArray:named:!file library!public! !
asMethodReturningByteArrayLiteral:named:!private-file library!public! !
asMethodReturningByteArrayWithCache:named:!private-file library!public! !
base64Decode:!encoding!public! !
base64Encode:!encoding!public! !
categoryNamed:!file library!public! !
compile:into:classified:!file library!public! !
contentsOfFile:binary:!file library!public! !
convertToSmalltalkNewlines:!file library!public! !
deleteFile:!file library!public! !
deliverMailFrom:to:text:!email!public! !
directoriesIn:!file library!public! !
ensureExistenceOfFolder:!file library!public! !
fileExists:!file library!public! !
filesIn:!file library!public! !
findFirstInString:inSet:startingAt:!private!testing! !
includesUnsafeUrlCharacter:!public!testing! !
includesUnsafeXmlCharacter:!public!testing! !
integerAsByteArray:!encoding!public! !
isProcessTerminated:!processes!public! !
label!public! !
localNameOf:!file library!public! !
newline!public! !
newRandom!factory!public! !
newTemporaryFile!file library!public! !
newTemporaryFileNamed:!file library!public! !
openDebuggerOn:!exceptions!public! !
pathSeparator!file library!public! !
readFileStreamOn:do:binary:!file library!public! !
readWriteByteStream!factory!public! !
readWriteCharacterStream!factory!public! !
reducedConflictDictionary!public! !
removeFromShutDownList:!public!startup! !
removeFromStartUpList:!public!startup! !
removeSelector:from:!file library!public! !
secureHashFor:!cryptography!public! !
selectorOfPragma:!private! !
semaphoreClass!factory!public! !
sizeOfFile:!file library!public! !
smtpConfiguration!email!public! !
smtpServer!private-email!public! !
stackDepth!exceptions!public! !
terminateProcess:!processes!public! !
thisContext!processes!public! !
useByteArrayLiterals!private-file library!public! !
weakDictionaryOfSize:!factory!public! !
write:toFile:inFolder:!file library!public! !
writeFileStreamOn:do:binary:!file library!public! !
!

!GRDolphinPlatform class methodsFor!

initialize
	self initializeXmlTable.
	self initializeUrlTable.
	self select!

initializeUrlTable
	UrlTable := ByteArray new: 256.
	1 to: 256 do: [ :index |
		('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~' includes: (Character codePoint: index - 1))
			ifTrue: [ UrlTable at: index put: 0 ]
			ifFalse: [ UrlTable at: index put: 1 ] ]!

initializeXmlTable
	XmlTable := ByteArray new: 256.
	1 to: 256 do: [ :index |
		('"<&>' includes: (Character codePoint: index - 1))
			ifTrue: [ XmlTable at: index put: 1 ]
			ifFalse: [ XmlTable at: index put: 0 ] ]!

isSmtpServerSet
	^SmtpServer notNil and: [SmtpServer notEmpty]!

setSmtpServer
	"Set the SMTP server used to send outgoing messages via"
	SmtpServer ifNil: [SmtpServer := ''].
	SmtpServer := Prompter on: SmtpServer asValue prompt: 'What is your mail server for outgoing mail?' caption: 'SMTP configuration'!

smtpServer

	self isSmtpServerSet
		ifFalse: [self setSmtpServer].
	SmtpServer isEmpty ifTrue: [
		self error: 'no SMTP server specified'].
	^SmtpServer!

uninitialize
	self unload!

unload
	self unselect! !

!GRDolphinPlatform class categoriesForMethods!
initialize!class initialization!public! !
initializeUrlTable!class initialization!public! !
initializeXmlTable!class initialization!public! !
isSmtpServerSet!public! !
setSmtpServer!public! !
smtpServer!public! !
uninitialize!class initialization!public! !
unload!class initialization!public! !
!

