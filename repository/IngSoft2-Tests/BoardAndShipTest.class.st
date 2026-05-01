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

{ #category : 'tests' }
BoardAndShipTest >> test002WhenABoardIsInitializedWithACollectionOfShipsThenMoreCanBeAddedFurther [

	| aFirstShip aSecondShip aCollectionOfShips aBoard |
	aFirstShip := Ship withId: 1.
	aSecondShip := Ship withId: 2.

	aCollectionOfShips := #( aFirstShip ) asOrderedCollection.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aSecondShip.

	self assert: aBoard getAmountOfShips equals: 2
]

{ #category : 'tests' }
BoardAndShipTest >> test003WhenTheBoardIsInitializedWithNoShipsThenMoreCanBeAddedFurther [

	| aShip aBoard |
	aShip := Ship withId: 1.

	aBoard := Board withSize: 10.
	aBoard addShip: aShip.

	self assert: aBoard getAmountOfShips equals: 1.
]
