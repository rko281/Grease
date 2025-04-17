"Filed out from Dolphin Smalltalk"!

GRPrinter subclass: #GRStringPrinter
	instanceVariableNames: 'trim length pad character'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

GRStringPrinter guid: (GUID fromString: '{2b1e5cea-4fbb-418e-a526-77d4a82a27bc}')!

GRStringPrinter comment: ''!

!GRStringPrinter categoriesForClass!Text! !

!GRStringPrinter methodsFor!

character: aCharacter	"The character to pad the string with."	character := aCharacter!

initialize	super initialize.	self character: $ ; length: nil.	self trimNone; padNone!

length: anInteger	"The maximal size of the string, or the size to pad to."	length := anInteger!

padCenter	"Pad to the center."	pad := #pad:center:to:!

padLeft	"Pad to the left."	pad := #pad:left:to:!

padNone	"Do not pad the input."	pad := nil!

padRight	"Pad to the right."	pad := #pad:right:to:!

print: anObject on: aStream	| string |	string := anObject greaseString.	trim isNil		ifFalse: [ string := string perform: trim ].	length isNil ifFalse: [		length < string size			ifTrue: [ string := string copyFrom: 1 to: length ].		(pad isNil or: [ character isNil ])			ifFalse: [ string := self perform: pad with: string with: character with: length ] ].	aStream nextPutAll: string!

trimBoth	"Trim to the left and to the right."	trim := #trimBoth!

trimLeft	"Trim to the left and to the right."	trim := #trimLeft!

trimNone	"Do not trim the input."	trim := nil!

trimRight	"Trim to the left and to the right."	trim := #trimRight! !

!GRStringPrinter categoriesForMethods!
character:!accessing!public! !
initialize!initialization!public! !
length:!accessing!public! !
padCenter!padding!public! !
padLeft!padding!public! !
padNone!padding!public! !
padRight!padding!public! !
print:on:!printing!public! !
trimBoth!public!trimming! !
trimLeft!public!trimming! !
trimNone!public!trimming! !
trimRight!public!trimming! !
!

