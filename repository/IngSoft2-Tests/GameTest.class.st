Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
GameTest >> test001WhenAGameIsCreatedThenItCanBeKnownThatItEnds [

| aGame |
aGame := Game new.

self assert: aGame over.


]

{ #category : 'running' }
GameTest >> test002WhenAGameIsCreatedThenItCanBePlayed [

	| aGame |


	aGame := Game new.
	
	aGame play.

	self assert: aGame getWinner equals: 1
]

{ #category : 'running' }
GameTest >> test003WhenAGameIsCreatedWithABoardAndSpaceShipThenThePositionOfTheSpaceShipItIs0 [



	|aGame aFirstShip aCollectionOfShips aBoard |
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := #( aFirstShip ) asOrderedCollection.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	
	aGame := Game withABoard: aBoard.

	self assert: (aGame getPositionOfSpaceShip: aFirstShip onTheBoard: aBoard) equals: 0.
]
