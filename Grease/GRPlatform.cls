"Filed out from Dolphin Smalltalk"!

GRObject subclass: #GRPlatform
	instanceVariableNames: ''
	classVariableNames: 'Current'
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRPlatform guid: (GUID fromString: '{37f0adb8-4872-405d-bc18-ee0da0fc0803}')!

GRPlatform comment: 'The abstract platform implementation. Each platform should provide a subclass implementing any abstract methods and overriding any other methods as necessary.Default implementations should be provided here when possible/useful but default implementations MUST be valid on ALL PLATFORMS so it is rarely practical. VA Smalltalk flags sends of uknown messages so even these must be known to exist on all platforms.Common cases where default implementations *are* appropriate are where there is a standard implementation that is valid on all platforms but one or more platforms have an additional, optimized implementation that should be used instead.All classes and methods used by methods of this class should be either:  + included in the Seaside-Platform package;  + defined by the ANSI Smalltalk standard; or  + (not ideal) referenced via ''Smalltalk at: #ClassName''.'!

!GRPlatform categoriesForClass!Unclassified! !

!GRPlatform methodsFor!

addToShutDownList: anObject	"Add anObject to the shutdown-list of the system. On shutdown the message #shutDown will be sent to anObject."	self subclassResponsibility!

addToStartUpList: anObject	"Add anObject to the startup-list of the system. On startup the message #startUp will be sent to anObject."	self subclassResponsibility!

asMethodReturningByteArray: aByteArrayOrString named: aSymbol	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a ByteArray"	self subclassResponsibility!

asMethodReturningString: aByteArrayOrString named: aSymbol	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a String.	This implementation answers a String formatted like so	aSymbol		^ aByteArrayOrString	Subclasses need to override this method if the dialect needs changes to support Unicode string literals"	^ String streamContents: [ :stream |		stream			nextPutAll: aSymbol;			nextPut: Character cr.		stream			tab;			nextPutAll: '^ '''.		aByteArrayOrString greaseString do: [ :each |			each = $' ifTrue: [ stream nextPut: $' ].			stream nextPut: each ].		stream nextPut: $' ]!

base64Decode: aString	"Base64 decode the given String and answer the result as a String."	self subclassResponsibility!

base64Encode: aByteArray	"Base64 encode the given byte array and answer the result as a String."	self subclassResponsibility!

bindingOf: aClass	"Answer the binding of aClass.	The binding is the literal that get compiled into the method.	We need the binding to be updated when the class is changed.	The binding has to respond to #value.	This is mostly an issue on GemStone/S because when we hold on	to a class directly we will end up holding on to an old class version.	Dialects with namespaces will need to override this.	On VisualWorks this should like this	^ aClass fullyQualifiedReference"	^ Smalltalk associationAt: aClass name!

compile: aString into: aClass classified: aSymbol	"The trick here is to be as silently a possible so that the package is not marked dirty when running WAFileLibrary test.	This also makes running tests much faster."	self subclassResponsibility!

contentsOfFile: aString binary: aBoolean	self subclassResponsibility!

convertToSmalltalkNewlines: aString	"Convert any line endings (CR, CRLF, LF) to the default platform newline."	aString isNil		ifTrue: [ ^ nil ].	^ String streamContents: [ :writeStream |		| readStream |		readStream := aString readStream.		[ readStream atEnd ] whileFalse: [			| next |			next := readStream next.			next = Character cr				ifTrue: [					readStream peek = Character lf						ifTrue: [ readStream skip: 1 ].					writeStream nextPutAll: self newline ]				ifFalse: [					next = Character lf						ifTrue: [ writeStream nextPutAll: self newline ]						ifFalse: [ writeStream nextPut: next ] ] ] ]!

deleteFile: aPathString	self subclassResponsibility!

deprecationExceptionSet	"Answer the exception set that should considered besides WADeprecation."	^ ExceptionSet new!

directoriesIn: aPathString	"Answer a collection of absolute paths for all the directories (no files) in the directory given by aPathString	must not include directory names that start with ."	self subclassResponsibility!

doSilently: aBlock	"Suspend all notifications value evaluating the given block."	^ aBlock value!

doTransaction: aBlock	"for Gemstone/S compatibility	http://gemstonesoup.wordpress.com/2007/05/10/porting-application-specific-seaside-threads-to-gemstone/	use when modifying an object from an outside thread"	^ aBlock value!

ensureExistenceOfFolder: aString	"Create a folder named aString in the image directory."	self subclassResponsibility!

fileExists: aString	self subclassResponsibility!

filesIn: aPathString	"Answer a collection of absolute paths for all the files (no directories) in the directory given by aPathString	must not include file names that start with ."	self subclassResponsibility!

fileStreamOn: aString do: aBlock binary: aBoolean	self		greaseDeprecatedApi: 'GRPlatform>>#fileStreamOn:do:binary:'		details: 'Use readFileStreamOn:do:binary:'.	^ self readFileStreamOn: aString do: aBlock binary: aBoolean!

integerAsByteArray: anInteger	^ anInteger asByteArray!

isProcessTerminated: aProcess	"Return a boolean indicating whether aProcess has been terminated."	self subclassResponsibility!

label	"Answer a descriptive label string for the platform implementation"	self subclassResponsibility!

localNameOf: aFilename	"Answer the local name of a file identified by an absolute file path.	Eg.	If the platform is Windwos and aFilename is 'C:\Windows\win32.dll' then it would answer 'win32.dll'.	If the platform is Unix and aFilename is '/usr/bin/vim' then it would answer 'vim'."	self subclassResponsibility!

newline	"Answer a String with the default newline character of this platform."	self subclassResponsibility!

newRandom	"Answers the random number generator to be used to create session and continuation keys. Make sure it is seeded. They only methods that will be sent to it are:	  #nextInt: - should answer a random integer in the interval [1, anInteger]	  #randomFrom: - should answer a random element from the given collection	Make sure that both methods are safe under heavy concurrent load.	Used by Gemstone/S traditional Randoms which cannot be persisted.	Used by Squeak to use a secure random when avaiable."	self subclassResponsibility!

newTemporaryFile	"Create a new temporary file in the systems temp directory and answer its pathString.	It is the users responsibility to delete or move the file, it will not be cleaned up automatically 	(unless the host system has a policy for it)."	^ self subclassResponsibility!

newTemporaryFileNamed: aName	"Create a new temporary file in the systems temp directory and answer its pathString.	It is the users responsibility to delete or move the file, it will not be cleaned up automatically 	(unless the host system has a policy for it)."	self subclassResponsibility!

openDebuggerOn: anError	self subclassResponsibility!

pathSeparator	"Answer the path separator as a String, eg. '/' on Unix and '\' on Windows."	self subclassResponsibility!

readFileStreamOn: aString do: aBlock binary: aBoolean	self subclassResponsibility!

readWriteByteStream	"Return a ReadWriteStream on a ByteArray that stores integers 0..255		^ReadWriteStream on: ByteArray new	"	^ self subclassResponsibility!

readWriteCharacterStream	"Return a ReadWriteStream on a String that stores characters		^ReadWriteStream on: String new	"	^ self subclassResponsibility!

reducedConflictDictionary	"used by Gemstone/S reduced conflict classes that can be used to avoid transaction conflicts"	^ Dictionary!

removeFromShutDownList: anObject	"Remove anObject from the shutdown list in the system."	self subclassResponsibility!

removeFromStartUpList: anObject	"Remove anObject from the startup list in the system."	self subclassResponsibility!

removeSelector: aSymbol from: aClass	self subclassResponsibility!

secureHashFor: aString	self subclassResponsibility!

semaphoreClass	"used by Gemstone/S traditional Semaphores which cannot be persisted"	self subclassResponsibility!

sizeOfFile: aString	self subclassResponsibility!

stackDepth	self subclassResponsibility!

supportsUnicode	"dynamically try to figure out whether the current dialect supports Unicode"	^ [ 		String			with: (Character codePoint: 16r1F1F3)			with: (Character codePoint: 16r1F1F1).		true	 ] on: Error		do: [ :error | false ]!

terminateProcess: aProcess	"Permanently terminate the process, unwinding first to execute #ensure: and #ifCurtailed: blocks."	self subclassResponsibility!

thisContext	"Answer the current activation of a method execution or block activation.	For dialects with a thisContext variable and implementation can look like this.	^ thisContext sender"	self subclassResponsibility!

version	"Answer the Grease version"	^ (GRVersion major: 1 minor: 18 revision: 1)		yourself!

versionString	^ String streamContents: [ :stream |		stream			nextPutAll: (self version greaseString);			nextPutAll: ' (';			nextPutAll: (self label);			nextPut: $) ]!

weakDictionaryOfSize: aNumber	self subclassResponsibility!

write: aStringOrByteArray toFile: aFileNameString inFolder: aFolderString	"Write aStringOrByteArray to a file named aFileNameString in the folder aFolderString."	self subclassResponsibility!

writeCharacterStreamOn: aString	"String based write stream"	^ WriteStream on: aString!

writeFileStreamOn: aString do: aBlock binary: aBoolean	self subclassResponsibility! !

!GRPlatform categoriesForMethods!
addToShutDownList:!public!startup! !
addToStartUpList:!public!startup! !
asMethodReturningByteArray:named:!file library!public! !
asMethodReturningString:named:!file library!public! !
base64Decode:!encoding!public! !
base64Encode:!encoding!public! !
bindingOf:!bindings!public! !
compile:into:classified:!file library!public! !
contentsOfFile:binary:!files!public! !
convertToSmalltalkNewlines:!file library!public! !
deleteFile:!files!public! !
deprecationExceptionSet!exceptions!public! !
directoriesIn:!files!public! !
doSilently:!file library!public! !
doTransaction:!public!transactions! !
ensureExistenceOfFolder:!files!public! !
fileExists:!files!public! !
filesIn:!files!public! !
fileStreamOn:do:binary:!files!public! !
integerAsByteArray:!encoding!public! !
isProcessTerminated:!processes!public! !
label!public!version info! !
localNameOf:!files!public! !
newline!file library!public! !
newRandom!factory!public! !
newTemporaryFile!files!public! !
newTemporaryFileNamed:!files!public! !
openDebuggerOn:!exceptions!public! !
pathSeparator!files!public! !
readFileStreamOn:do:binary:!files!public! !
readWriteByteStream!factory!public! !
readWriteCharacterStream!factory!public! !
reducedConflictDictionary!factory!public! !
removeFromShutDownList:!public!startup! !
removeFromStartUpList:!public!startup! !
removeSelector:from:!file library!public! !
secureHashFor:!cryptography!public! !
semaphoreClass!factory!public! !
sizeOfFile:!files!public! !
stackDepth!exceptions!public! !
supportsUnicode!encoding!public! !
terminateProcess:!processes!public! !
thisContext!processes!public! !
version!public!version info! !
versionString!public!version info! !
weakDictionaryOfSize:!factory!public! !
write:toFile:inFolder:!files!public! !
writeCharacterStreamOn:!factory!public! !
writeFileStreamOn:do:binary:!files!public! !
!

!GRPlatform class methodsFor!

current	^ Current!

current: aPlatform	Current := aPlatform!

select	GRPlatform current: self new!

unselect	GRPlatform current class = self ifTrue: [ GRPlatform current: nil ]! !

!GRPlatform class categoriesForMethods!
current!public!registration! !
current:!public!registration! !
select!public!registration! !
unselect!public!registration! !
!

