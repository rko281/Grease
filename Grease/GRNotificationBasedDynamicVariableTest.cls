"Filed out from Dolphin Smalltalk 7"!

TestCase subclass: #GRNotificationBasedDynamicVariableTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRNotificationBasedDynamicVariableTest guid: (GUID fromString: '{f13a32e1-98b1-4221-beae-7f90c9b1ca0e}')!
GRNotificationBasedDynamicVariableTest comment: ''!
!GRNotificationBasedDynamicVariableTest categoriesForClass!Grease-Tests-Core! !
!GRNotificationBasedDynamicVariableTest methodsFor!

testAnswer	self assert: (GRNotificationBasedDynamicVariable use: 'value' during: [ true ])!

testDefaultValue	self assert: GRTestNotificationBasedDynamicVariable value = 'default test value'.		GRTestNotificationBasedDynamicVariable		use: 'my value'		during: [  ].	self assert: GRTestNotificationBasedDynamicVariable value = 'default test value' description:'The default value is no longer correct'!

testWithNestedValue	GRNotificationBasedDynamicVariable 		use: 'outer' 		during: [			GRNotificationBasedDynamicVariable 				use: 'inner'				during: [ self assert: GRNotificationBasedDynamicVariable value = 'inner' ].			self assert: GRNotificationBasedDynamicVariable value = 'outer' ]!

testWithoutValue	self assert: GRNotificationBasedDynamicVariable value isNil!

testWithValue	GRNotificationBasedDynamicVariable 		use: 'value' 		during: [ self assert: GRNotificationBasedDynamicVariable value = 'value' ]! !
!GRNotificationBasedDynamicVariableTest categoriesFor: #testAnswer!public!tests! !
!GRNotificationBasedDynamicVariableTest categoriesFor: #testDefaultValue!public!tests! !
!GRNotificationBasedDynamicVariableTest categoriesFor: #testWithNestedValue!public!tests! !
!GRNotificationBasedDynamicVariableTest categoriesFor: #testWithoutValue!public!tests! !
!GRNotificationBasedDynamicVariableTest categoriesFor: #testWithValue!public!tests! !

