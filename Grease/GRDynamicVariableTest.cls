"Filed out from Dolphin Smalltalk"!

TestCase subclass: #GRDynamicVariableTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDynamicVariableTest guid: (GUID fromString: '{611c2c54-2dcb-4786-ada9-6e7a2973bfb9}')!

GRDynamicVariableTest comment: ''!

!GRDynamicVariableTest categoriesForClass!Unclassified! !

!GRDynamicVariableTest methodsFor!

testAnswer	self assert: (GRDynamicVariable use: 'value' during: [ true ])!

testDefaultValue	self assert: GRTestDynamicVariable value = 'default test value'.		GRTestDynamicVariable		use: 'my value'		during: [  ].	self assert: GRTestDynamicVariable value = 'default test value' description:'The default value is no longer correct'!

testWithNestedValue	GRDynamicVariable 		use: 'outer' 		during: [			GRDynamicVariable 				use: 'inner'				during: [ self assert: GRDynamicVariable value = 'inner' ].			self assert: GRDynamicVariable value = 'outer' ]!

testWithoutValue	self assert: GRDynamicVariable value isNil!

testWithValue	GRDynamicVariable 		use: 'value' 		during: [ self assert: GRDynamicVariable value = 'value' ]! !

!GRDynamicVariableTest categoriesForMethods!
testAnswer!public!tests! !
testDefaultValue!public!tests! !
testWithNestedValue!public!tests! !
testWithoutValue!public!tests! !
testWithValue!public!tests! !
!

