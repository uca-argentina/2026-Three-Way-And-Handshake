Class {
	#name : 'DieTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DieTest >> test001WhenTheSidesAreNegativeThenADieCannotBeCreated [

	self
		should: [ Die withSides: -1 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Die sides cannot be negative or zero']
]

{ #category : 'tests' }
DieTest >> test002WhenADieIsInitializedWithOneSideThenADieHasOneSide [

	| aDie |
	aDie := Die withSides: 1.

	self assert: aDie getNumberOfSides equals: 1
]

{ #category : 'tests' }
DieTest >> test003WhenADieWithNSidesIsRolledThenTheOutcomeIsBetween1AndN [ 

| aDie|
aDie:= Die withSides: 5.

self assert: (aDie roll between: 1 and: 5).
]

{ #category : 'tests' }
DieTest >> test004WhenTheSidesAreOtherThanIntegerTypeThenADieCannotBeCreated [ 

	self
		should: [ Die withSides: 'a' ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Die sides cannot be other than integer type']
]
