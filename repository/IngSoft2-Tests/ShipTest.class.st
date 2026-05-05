Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> test001WhenAShipIsSetWithId1ThenTheIdIs1 [

| aShip |
aShip := Ship withId: 1.

self assert: aShip getId equals: 1.
]

{ #category : 'tests' }
ShipTest >> test002WhenAShipIdIsOtherThanIntegerThenObjectCannotBeInstantiated [

self
		should: [ Ship withId: 'b' ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Ship ID cannot be other than integer type']
]
