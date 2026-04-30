Class {
	#name : 'BoardAndShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardAndShipTest >> test001WhenABoardIsCreatedWithOneShipThenItHasOneShip [

	| aShip aCollectionOfShips aBoard |
	aShip := Ship withId: 1.

	aCollectionOfShips := #( aShip ) asOrderedCollection.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.

	self assert: aBoard getAmountOfShips equals: 1
]
