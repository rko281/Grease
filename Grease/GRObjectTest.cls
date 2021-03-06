﻿"Filed out from Dolphin Smalltalk 7"!

TestCase subclass: #GRObjectTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRObjectTest guid: (GUID fromString: '{badc14b4-d3ff-47c9-9af2-0c2722026811}')!
GRObjectTest comment: ''!
!GRObjectTest categoriesForClass!Grease-Tests-Core! !
!GRObjectTest methodsFor!

testError	"Make sure #error: signals a subclass of GRError."	self 		should: [ GRObject new error: 'oh dear' ]		raise: GRError.	self 		should: [ GRObject error: 'oh dear' ]		raise: GRError!

testInitialize	"Make sure #initialize is called on #new and that calling 'super initialize' doesn't error."	self assert: GRObjectStub new foo!

testRespondsTo	self assert: (GRObject new respondsTo: #greaseString).	self deny: (GRObject new respondsTo: #makeMeASandwich)! !
!GRObjectTest categoriesFor: #testError!public!tests! !
!GRObjectTest categoriesFor: #testInitialize!public!tests! !
!GRObjectTest categoriesFor: #testRespondsTo!public!tests! !

