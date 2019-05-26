"Filed out from Dolphin Smalltalk 7"!

GRAbstractSequenceableCollectionTest subclass: #GRSymbolTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRSymbolTest guid: (GUID fromString: '{70c9a161-d825-40f4-94ee-ff1ae79dddd2}')!
GRSymbolTest comment: ''!
!GRSymbolTest categoriesForClass!Grease-Tests-Core! !
!GRSymbolTest methodsFor!

allowsDuplicateValues	^ true!

arbitraryCollection	^ #'fadbbc'!

collectionClass	^ Symbol!

duplicateElement	^ $b!

emptyCollection	^ #''!

excludedElement	^ $Q!

includedElement	^ $d!

isExtensible	^ false!

isHomogeneous	^ true!

isInitializable	^ false!

isSequenced	^ false!

isUnique	^ true! !
!GRSymbolTest categoriesFor: #allowsDuplicateValues!configuration!public! !
!GRSymbolTest categoriesFor: #arbitraryCollection!configuration!public! !
!GRSymbolTest categoriesFor: #collectionClass!configuration!public! !
!GRSymbolTest categoriesFor: #duplicateElement!configuration!public! !
!GRSymbolTest categoriesFor: #emptyCollection!configuration!public! !
!GRSymbolTest categoriesFor: #excludedElement!configuration!public! !
!GRSymbolTest categoriesFor: #includedElement!configuration!public! !
!GRSymbolTest categoriesFor: #isExtensible!public!testing/ansi! !
!GRSymbolTest categoriesFor: #isHomogeneous!public!testing! !
!GRSymbolTest categoriesFor: #isInitializable!public!testing/ansi! !
!GRSymbolTest categoriesFor: #isSequenced!public!testing/ansi! !
!GRSymbolTest categoriesFor: #isUnique!public!testing! !

