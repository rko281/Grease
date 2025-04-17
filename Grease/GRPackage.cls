"Filed out from Dolphin Smalltalk"!

GRObject subclass: #GRPackage
	instanceVariableNames: 'name description dependencies license url'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRPackage guid: (GUID fromString: '{b4bed617-0465-4937-a076-606a3550f781}')!

GRPackage comment: 'I am a platform independent package representation. I know my name, description, my dependencies, the license and the repository URL. Packages are declared by creating a class side extension method that answers a configured package instance. The expression    GRPackage packagesanswers the collection of the complete package graph.'!

!GRPackage categoriesForClass!Unclassified! !

!GRPackage methodsFor!

addDependenciesTo: aCollection	(aCollection includes: self) ifFalse: [		self dependencies			do: [ :each | each addDependenciesTo: aCollection ].		aCollection add: self ].	^ aCollection!

addDependency: aString	dependencies add: aString!

allDependencies	"Answer all dependencies on which this package depends."	^ self addDependenciesTo: OrderedCollection new!

dependencies	"Return a collection of package names on which this package depends."	^ dependencies!

description	"Answer a short description of the package."	^ description!

description: aString	description := aString!

greaseUrl	^ 'http://smalltalkhub.com/mc/Seaside/Grease11/main'!

initialize	super initialize.	dependencies := OrderedCollection new.	license := #MIT!

isLGPL	^ self license = #LGPL!

isMIT	^ self license = #MIT!

license	"Answer the current license of this package, by default MIT is used."	^ license!

license: aSymbol	license := aSymbol!

name	"Answer the name of the package. This string should be useable to identify the platform specific native package object, e.g. the Monticello package name."	^ name!

name: aString	name := aString!

printOn: aStream	super printOn: aStream.	aStream nextPut: $(; nextPutAll: self name; nextPut: $)!

resolveWith: aDictionary	dependencies := dependencies		collect: [ :each |			aDictionary at: each ifAbsent: [				"if Foo-Pharo-Bar fails try Foo-Pharo20-Bar and Foo-Pharo30-Bar"				(each indexOfSubCollection: '-Pharo-' startingAt: 1) ~= 0 ifTrue: [					"try -Pharo40-"					aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo40-') ifAbsent: [						"try -Pharo50-"						aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo50-') ifAbsent: [							"try -Pharo60-"							aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo60-') ifAbsent: [								"try -Pharo70-"								aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo70-') ifAbsent: [									"try -Pharo90-"									aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo90-') ifAbsent: [										"try -Pharo100-"										aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo100-') ifAbsent: [											"try -Pharo110-"											aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo110-') ifAbsent: [												"try -Squeak-"												aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Squeak-') ifAbsent: [													"try -Squeak5-"													aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Squeak5-') ifAbsent: [														"try -Squeak6-"														aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Squeak6-') ifAbsent: [															"specific for Grease-Slime"															aDictionary at: (each copyReplaceAll: 'Grease-Pharo-Slime' with: 'Grease-Slime') ifAbsent: [																self error: self name printString , ' depends on unknown package ' , each printString ] ] ] ] ] ] ] ] ] ] ] ] ] ]!

seasideAddonsUrl	^ 'http://smalltalkhub.com/mc/Seaside/Seaside30Addons/main'!

seasideLGPLUrl	^ 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main'!

seasideUrl	^ 'http://smalltalkhub.com/mc/Seaside/Seaside31/main'!

url	"Answer the base-URL of the package. This string is only meaningful for platforms that can directly access Monticello repositories."	^ url isSymbol		ifTrue: [ self perform: url ]		ifFalse: [ url ]!

url: aStringOrSymbol	"Set the base-URL of the package, or a symbol referring to a method in this class that answers the URL. This setting is only meaningful for platforms that can directly access Monticello repositories."	url := aStringOrSymbol! !

!GRPackage categoriesForMethods!
addDependenciesTo:!private! !
addDependency:!dependencies!public! !
allDependencies!dependencies!public! !
dependencies!dependencies!public! !
description!accessing!public! !
description:!accessing!public! !
greaseUrl!accessing/repositories!public! !
initialize!initialization!public! !
isLGPL!public!testing! !
isMIT!public!testing! !
license!accessing!public! !
license:!accessing!public! !
name!accessing!public! !
name:!accessing!public! !
printOn:!printing!public! !
resolveWith:!dependencies!public! !
seasideAddonsUrl!accessing/repositories!public! !
seasideLGPLUrl!accessing/repositories!public! !
seasideUrl!accessing/repositories!public! !
url!accessing!public! !
url:!accessing!public! !
!

!GRPackage class methodsFor!

greaseCore	^ self new		name: 'Grease-Core';		description: 'The main package of the Grease compatibility layer.';		url: #greaseUrl;		yourself!

grPackages	"Answer a list of all registered packages. A package is registered by adding a class extension to the receiving class answering an instance of the receiving class."	| packages package |	packages := Dictionary new.	self class selectors do: [ :each |		(each numArgs = 0 and: [ each ~= #grPackages ]) ifTrue: [			package := self perform: each.			packages at: package name put: package ] ].	packages do: [ :each | each resolveWith: packages ].	^ packages values! !

!GRPackage class categoriesForMethods!
greaseCore!accessing!public! !
grPackages!public!querying! !
!

