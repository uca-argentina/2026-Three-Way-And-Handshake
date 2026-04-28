Class {
	#name : 'DadoTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DadoTest >> test001WhenTheSidesAreNegativeThenADieCannotBeCreated [

	self
		should: [ Die withSides: -1 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Die sides cannot be negative or zero']
]

{ #category : 'tests' }
DadoTest >> test002WhenAOneSidedDieIsRolledThenTheOutcomeIsOne [

| aDie |
aDie:= Die withSides: 1.

self assert: aDie roll equals: 1.
]

{ #category : 'tests' }
DadoTest >> test003 [

| aDie|
aDie:= Die withSides: 5.

self assert: (aDie roll between: 1 and: 5).
]
