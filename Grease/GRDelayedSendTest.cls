"Filed out from Dolphin Smalltalk"!

TestCase subclass: #GRDelayedSendTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRDelayedSendTest guid: (GUID fromString: '{8fa666f4-3b43-48c8-9bbe-76479788ff0f}')!

GRDelayedSendTest comment: ''!

!GRDelayedSendTest categoriesForClass!Unclassified! !

!GRDelayedSendTest methodsFor!

testArgumentCount	" unary "	| send |	send := GRDelayedSend 		receiver: 1		selector: #negated.	self assert: send argumentCount = 0.	send := GRDelayedSend 		receiver: 1		selector: #negated		arguments: #().	self assert: send argumentCount = 0.	" binary "	send := GRDelayedSend 		receiver: 1		selector: #+.	self assert: send argumentCount = 1.	send := GRDelayedSend 		receiver: 1		selector: #+		argument: 2.	self assert: send argumentCount = 0.	" keyword "	send := GRDelayedSend 		receiver: 1		selector: #between:and:.	self assert: send argumentCount = 2.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		argument: 2.	self assert: send argumentCount = 1.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		arguments: (Array 				with: 2				with: 3).	self assert: send argumentCount = 0!

testValueBinary	| send |	send := GRDelayedSend 		receiver: 1		selector: #+.	self 		should: [ send value ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #+		argument: 2.	self assert: send value = 3!

testValueKeyword	| send |	send := GRDelayedSend 		receiver: 1		selector: #between:and:.	self 		should: [ send value ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		argument: 2.	self 		should: [ send value ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		arguments: (Array 				with: 2				with: 3).	self deny: send value!

testValueUnary	| send |	send := GRDelayedSend 		receiver: 1		selector: #negated.	self assert: send value = -1.	send := GRDelayedSend 		receiver: 1		selector: #negated		arguments: #().	self assert: send value = -1!

testValueValueBinary	| send |	send := GRDelayedSend 		receiver: 1		selector: #+.	self 		should: 			[ send 				value: 2				value: 3 ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #+		argument: 2.	self 		should: 			[ send 				value: 2				value: 3 ]		raise: GRInvalidArgumentCount!

testValueValueKeyword	| send |	send := GRDelayedSend 		receiver: 1		selector: #between:and:.	self deny: (send 			value: 2			value: 3).	send := GRDelayedSend 		receiver: 1		selector: #between:and:		argument: 2.	self 		should: 			[ send 				value: 4				value: 5 ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		arguments: (Array 				with: 2				with: 3).	self 		should: 			[ send 				value: 4				value: 5 ]		raise: GRInvalidArgumentCount!

testValueValueUnary	| send |	send := GRDelayedSend 		receiver: 1		selector: #negated.	self 		should: 			[ send 				value: 2				value: 3 ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #negated		arguments: #().	self 		should: 			[ send 				value: 2				value: 3 ]		raise: GRInvalidArgumentCount!

testValueWithArgumentBinary	| send |	send := GRDelayedSend 		receiver: 1		selector: #+.	self assert: (send value: 2) = 3.	send := GRDelayedSend 		receiver: 1		selector: #+		argument: 2.	self 		should: [ send value: 2 ]		raise: GRInvalidArgumentCount!

testValueWithArgumentKeyword	| send |	send := GRDelayedSend 		receiver: 1		selector: #between:and:.	self 		should: [ send value: 2 ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		argument: 2.	self deny: (send value: 3).	send := GRDelayedSend 		receiver: 1		selector: #between:and:		arguments: #(2 3 ).	self 		should: [ send value: 4 ]		raise: GRInvalidArgumentCount!

testValueWithArgumentsBinary	| send |	send := GRDelayedSend 		receiver: 1		selector: #+.	self 		should: [ send valueWithArguments: #(2 3 ) ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #+		argument: 2.	self 		should: [ send valueWithArguments: #(3 4 ) ]		raise: GRInvalidArgumentCount!

testValueWithArgumentsKeyword	| send |	send := GRDelayedSend 		receiver: 1		selector: #between:and:.	self deny: (send valueWithArguments: #(2 3 )).	send := GRDelayedSend 		receiver: 1		selector: #between:and:		argument: 2.	self 		should: [ send valueWithArguments: #(3 4 ) ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		arguments: #(2 3 ).	self 		should: [ send valueWithArguments: #(4 5 ) ]		raise: GRInvalidArgumentCount!

testValueWithArgumentsUnary	| send |	send := GRDelayedSend 		receiver: 1		selector: #negated.	self 		should: [ send valueWithArguments: #(2 3 ) ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #negated		arguments: #().	self 		should: [ send valueWithArguments: #(2 3 ) ]		raise: GRInvalidArgumentCount!

testValueWithArgumentUnary	| send |	send := GRDelayedSend 		receiver: 1		selector: #negated.	self 		should: [ send value: 2 ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #negated		arguments: #().	self 		should: [ send value: 2 ]		raise: GRInvalidArgumentCount!

testValueWithPossibleArgumentsBinary	| send |	send := GRDelayedSend 		receiver: 1		selector: #+.	self 		should: [ send valueWithPossibleArguments: #() ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #+		argument: 2.	self assert: (send valueWithPossibleArguments: #()) = 3.	send := GRDelayedSend 		receiver: 1		selector: #+.	self assert: (send valueWithPossibleArguments: #(2 )) = 3.	send := GRDelayedSend 		receiver: 1		selector: #+		argument: 2.	self assert: (send valueWithPossibleArguments: #(3 )) = 3.	send := GRDelayedSend 		receiver: 1		selector: #+.	self assert: (send valueWithPossibleArguments: #(2 3 )) = 3.	send := GRDelayedSend 		receiver: 1		selector: #+		argument: 2.	self assert: (send valueWithPossibleArguments: #(3 4 )) = 3!

testValueWithPossibleArgumentsKeyword	| send |	send := GRDelayedSend 		receiver: 1		selector: #between:and:.	self 		should: [ send valueWithPossibleArguments: #() ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		argument: 2.	self 		should: [ send valueWithPossibleArguments: #() ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		arguments: (Array 				with: 2				with: 3).	self deny: (send valueWithPossibleArguments: #()).	send := GRDelayedSend 		receiver: 1		selector: #between:and:.	self 		should: [ send valueWithPossibleArguments: #(2 ) ]		raise: GRInvalidArgumentCount.	send := GRDelayedSend 		receiver: 1		selector: #between:and:		argument: 2.	self deny: (send valueWithPossibleArguments: #(3 )).	send := GRDelayedSend 		receiver: 1		selector: #between:and:		arguments: (Array 				with: 2				with: 3).	self deny: (send valueWithPossibleArguments: #(4 )).	send := GRDelayedSend 		receiver: 1		selector: #between:and:.	self deny: (send valueWithPossibleArguments: #(2 3 )).	send := GRDelayedSend 		receiver: 1		selector: #between:and:		argument: 2.	self deny: (send valueWithPossibleArguments: #(3 4 )).	send := GRDelayedSend 		receiver: 1		selector: #between:and:		arguments: (Array 				with: 2				with: 3).	self deny: (send valueWithPossibleArguments: #(4 5 ))!

testValueWithPossibleArgumentsUnary	| send |	send := GRDelayedSend 		receiver: 1		selector: #negated.	self assert: (send valueWithPossibleArguments: #()) = -1.	send := GRDelayedSend 		receiver: 1		selector: #negated		arguments: #().	self assert: (send valueWithPossibleArguments: #()) = -1.	send := GRDelayedSend 		receiver: 1		selector: #negated.	self assert: (send valueWithPossibleArguments: #(2 )) = -1.	send := GRDelayedSend 		receiver: 1		selector: #negated		arguments: #().	self assert: (send valueWithPossibleArguments: #(2 )) = -1.	send := GRDelayedSend 		receiver: 1		selector: #negated.	self assert: (send valueWithPossibleArguments: #(2 3 )) = -1.	send := GRDelayedSend 		receiver: 1		selector: #negated		arguments: #().	self assert: (send valueWithPossibleArguments: #(2 3 )) = -1! !

!GRDelayedSendTest categoriesForMethods!
testArgumentCount!public!tests/accessing! !
testValueBinary!public!tests/evaluating! !
testValueKeyword!public!tests/evaluating! !
testValueUnary!public!tests/evaluating! !
testValueValueBinary!public!tests/evaluating! !
testValueValueKeyword!public!tests/evaluating! !
testValueValueUnary!public!tests/evaluating! !
testValueWithArgumentBinary!public!tests/evaluating! !
testValueWithArgumentKeyword!public!tests/evaluating! !
testValueWithArgumentsBinary!public!tests/evaluating! !
testValueWithArgumentsKeyword!public!tests/evaluating! !
testValueWithArgumentsUnary!public!tests/evaluating! !
testValueWithArgumentUnary!public!tests/evaluating! !
testValueWithPossibleArgumentsBinary!public!tests/evaluating! !
testValueWithPossibleArgumentsKeyword!public!tests/evaluating! !
testValueWithPossibleArgumentsUnary!public!tests/evaluating! !
!

