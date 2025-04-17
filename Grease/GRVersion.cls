"Filed out from Dolphin Smalltalk"!

GRObject subclass: #GRVersion
	instanceVariableNames: 'major minor revision stageLabel stageNumber'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRVersion guid: (GUID fromString: '{05359cb1-3c24-4280-8f59-bd2160da4683}')!

GRVersion comment: 'I model version numbers. I am comparable and I define a natural order.'!

!GRVersion categoriesForClass!Unclassified! !

!GRVersion methodsFor!

< otherVersion	(major < otherVersion major) ifTrue: [ ^ true ].	(otherVersion major < major) ifTrue: [ ^ false ].	((minor ifNil: [ 0 ]) < (otherVersion minor ifNil: [ 0 ])) ifTrue: [ ^ true ].	((otherVersion minor ifNil: [ 0 ]) < (minor ifNil: [ 0 ])) ifTrue: [ ^ false ].	((revision ifNil: [ 0 ]) < (otherVersion revision ifNil: [ 0 ])) ifTrue: [ ^ true ].	((otherVersion revision ifNil: [ 0 ]) < (revision ifNil: [ 0 ])) ifTrue: [ ^ false ].	(stageLabel = otherVersion stage) ifTrue: [		^ ((stageNumber ifNil: [ 1 ]) < (otherVersion stageNumber ifNil: [ 1 ])) ].	stageLabel isNil ifTrue: [ ^ false ].	otherVersion stage isNil ifTrue: [ ^ true ].	^ stageLabel < otherVersion stage!

<= otherVersion	^ (self > otherVersion) not!

= otherVersion	^ (major = otherVersion major) and: [		((minor ifNil: [ 0 ]) = (otherVersion minor ifNil: [ 0 ])) and: [		((revision ifNil: [ 0 ] ) = (otherVersion revision ifNil: [ 0 ])) and: [		(stageLabel = otherVersion stage) and: [		(stageNumber ifNil: [ 1 ]) = (otherVersion stageNumber ifNil: [ 1 ]) ] ] ] ]!

> otherVersion	^ otherVersion < self!

>= otherVersion	^ (self < otherVersion) not!

beAlpha	self beAlpha: nil!

beAlpha: anInteger	self stage: #alpha number: anInteger!

beBeta	self beBeta: nil!

beBeta: anInteger	self stage: #beta number: anInteger!

beFinal	self stage: nil number: nil!

beReleaseCandidate	self beReleaseCandidate: nil!

beReleaseCandidate: anInteger	self stage: #rc number: anInteger!

greaseString	^ String streamContents: [ :stream |		stream nextPutAll: major greaseString.		stream nextPut: $..		stream nextPutAll: (minor ifNil: [ 0 ]) greaseString.		revision isNil ifFalse: [			stream nextPut: $..			stream nextPutAll: revision greaseString ].		stageLabel isNil ifFalse: [			stream nextPutAll: stageLabel greaseString.			stageNumber isNil ifFalse: [ stream nextPutAll: stageNumber greaseString ] ] ]!

hash	^ (major hash		bitXor: (minor ifNil: [ 0 ]) hash)		bitXor: (revision ifNil: [ 0 ]) hash!

initializeWithMajor: majorInteger minor: minorInteger revision: revisionInteger	self initialize.	major := majorInteger.	minor := minorInteger.	revision := revisionInteger!

isAlpha	^ stageLabel = #alpha!

isBeta	^ stageLabel = #beta!

isFinal	^ stageLabel isNil!

isReleaseCandidate	^ stageLabel = #rc!

major	^ major!

major: anInteger	major := anInteger!

minor	^ minor!

minor: anInteger	minor := anInteger!

revision	^ revision!

revision: anInteger	revision := anInteger!

stage	^ stageLabel!

stage: aSymbol number: anInteger	stageLabel := aSymbol.	stageNumber := anInteger!

stageNumber	^ stageNumber! !

!GRVersion categoriesForMethods!
<!comparing!public! !
<=!comparing!public! !
=!comparing!public! !
>!comparing!public! !
>=!comparing!public! !
beAlpha!convenience!public! !
beAlpha:!convenience!public! !
beBeta!convenience!public! !
beBeta:!convenience!public! !
beFinal!convenience!public! !
beReleaseCandidate!convenience!public! !
beReleaseCandidate:!convenience!public! !
greaseString!converting!public! !
hash!comparing!public! !
initializeWithMajor:minor:revision:!initialization!public! !
isAlpha!public!testing! !
isBeta!public!testing! !
isFinal!public!testing! !
isReleaseCandidate!public!testing! !
major!accessing!public! !
major:!accessing!public! !
minor!accessing!public! !
minor:!accessing!public! !
revision!accessing!public! !
revision:!accessing!public! !
stage!accessing!public! !
stage:number:!accessing!public! !
stageNumber!accessing!public! !
!

!GRVersion class methodsFor!

major: majorInteger	^ self major: majorInteger minor: nil!

major: majorInteger minor: minorInteger	^ self major: majorInteger minor: minorInteger revision: nil!

major: majorInteger minor: minorInteger revision: revisionInteger	^ self basicNew		initializeWithMajor: majorInteger minor: minorInteger revision: revisionInteger;		yourself!

new	^ self major: 1! !

!GRVersion class categoriesForMethods!
major:!instance creation!public! !
major:minor:!instance creation!public! !
major:minor:revision:!instance creation!public! !
new!instance creation!public! !
!

