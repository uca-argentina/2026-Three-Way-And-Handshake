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
