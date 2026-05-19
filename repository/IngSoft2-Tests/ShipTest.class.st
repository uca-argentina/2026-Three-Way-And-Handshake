Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> test001WhenAShipNameIsOtherThanStringThenObjectCannotBeInstantiated [

self
		should: [ Ship withName: 1 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Ship Name cannot be other than string type']
]
