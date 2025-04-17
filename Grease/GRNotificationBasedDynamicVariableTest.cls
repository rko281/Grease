"Filed out from Dolphin Smalltalk"!

TestCase subclass: #GRNotificationBasedDynamicVariableTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRNotificationBasedDynamicVariableTest guid: (GUID fromString: '{3e4720f5-f13d-411b-a394-faa5348bff4b}')!

GRNotificationBasedDynamicVariableTest comment: ''!

!GRNotificationBasedDynamicVariableTest categoriesForClass!Unclassified! !

!GRNotificationBasedDynamicVariableTest methodsFor!

testAnswer	self assert: (GRNotificationBasedDynamicVariable use: 'value' during: [ true ])!

testDefaultValue	self assert: GRTestNotificationBasedDynamicVariable value = 'default test value'.		GRTestNotificationBasedDynamicVariable		use: 'my value'		during: [  ].	self assert: GRTestNotificationBasedDynamicVariable value = 'default test value' description:'The default value is no longer correct'!

testWithNestedValue	GRNotificationBasedDynamicVariable 		use: 'outer' 		during: [			GRNotificationBasedDynamicVariable 				use: 'inner'				during: [ self assert: GRNotificationBasedDynamicVariable value = 'inner' ].			self assert: GRNotificationBasedDynamicVariable value = 'outer' ]!

testWithoutValue	self assert: GRNotificationBasedDynamicVariable value isNil!

testWithValue	GRNotificationBasedDynamicVariable 		use: 'value' 		during: [ self assert: GRNotificationBasedDynamicVariable value = 'value' ]! !

!GRNotificationBasedDynamicVariableTest categoriesForMethods!
testAnswer!public!tests! !
testDefaultValue!public!tests! !
testWithNestedValue!public!tests! !
testWithoutValue!public!tests! !
testWithValue!public!tests! !
!

