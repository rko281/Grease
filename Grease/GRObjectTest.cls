"Filed out from Dolphin Smalltalk"!

TestCase subclass: #GRObjectTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRObjectTest guid: (GUID fromString: '{89aca37b-f6a2-40fc-8877-6aa77f0989bb}')!

GRObjectTest comment: ''!

!GRObjectTest categoriesForClass!Unclassified! !

!GRObjectTest methodsFor!

testError	"Make sure #error: signals a subclass of GRError."	self 		should: [ GRObject new error: 'oh dear' ]		raise: GRError.	self 		should: [ GRObject error: 'oh dear' ]		raise: GRError!

testInitialize	"Make sure #initialize is called on #new and that calling 'super initialize' doesn't error."	self assert: GRObjectStub new foo!

testRespondsTo	self assert: (GRObject new respondsTo: #greaseString).	self deny: (GRObject new respondsTo: #makeMeASandwich)! !

!GRObjectTest categoriesForMethods!
testError!public!tests! !
testInitialize!public!tests! !
testRespondsTo!public!tests! !
!

