﻿"Filed out from Dolphin Smalltalk 7"!

GRCountingStreamTest subclass: #GRDolphinCountingStreamTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRDolphinCountingStreamTest guid: (GUID fromString: '{bfe7757d-ba5a-473c-afc8-d516c67c4685}')!
GRDolphinCountingStreamTest comment: ''!
!GRDolphinCountingStreamTest categoriesForClass!Grease-Tests-Core! !
!GRDolphinCountingStreamTest methodsFor!

testNextPut

testNextPutAll
	self assert: countingStream contents asByteArray = #[16rC3 16rA4]! !
!GRDolphinCountingStreamTest categoriesFor: #testNextPut!public!testing! !
!GRDolphinCountingStreamTest categoriesFor: #testNextPutAll!public!testing! !
