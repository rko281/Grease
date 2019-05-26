"Filed out from Dolphin Smalltalk 7"!

TestCase subclass: #GRDynamicVariableTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GRDynamicVariableTest guid: (GUID fromString: '{e23904b2-afc0-45c5-95fe-7a36cc52f7c5}')!
GRDynamicVariableTest comment: ''!
!GRDynamicVariableTest categoriesForClass!Grease-Tests-Core! !
!GRDynamicVariableTest methodsFor!

testAnswer	self assert: (GRDynamicVariable use: 'value' during: [ true ])!

testDefaultValue	self assert: GRTestDynamicVariable value = 'default test value'.		GRTestDynamicVariable		use: 'my value'		during: [  ].	self assert: GRTestDynamicVariable value = 'default test value' description:'The default value is no longer correct'!

testWithNestedValue	GRDynamicVariable 		use: 'outer' 		during: [			GRDynamicVariable 				use: 'inner'				during: [ self assert: GRDynamicVariable value = 'inner' ].			self assert: GRDynamicVariable value = 'outer' ]!

testWithoutValue	self assert: GRDynamicVariable value isNil!

testWithValue	GRDynamicVariable 		use: 'value' 		during: [ self assert: GRDynamicVariable value = 'value' ]! !
!GRDynamicVariableTest categoriesFor: #testAnswer!public!tests! !
!GRDynamicVariableTest categoriesFor: #testDefaultValue!public!tests! !
!GRDynamicVariableTest categoriesFor: #testWithNestedValue!public!tests! !
!GRDynamicVariableTest categoriesFor: #testWithoutValue!public!tests! !
!GRDynamicVariableTest categoriesFor: #testWithValue!public!tests! !

