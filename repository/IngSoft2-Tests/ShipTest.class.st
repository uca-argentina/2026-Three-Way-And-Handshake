Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> test001WhenAShipIdIsOtherThanIntegerThenObjectCannotBeInstantiated [

self
		should: [ Ship withId: 'b' ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Ship ID cannot be other than integer type']
]
