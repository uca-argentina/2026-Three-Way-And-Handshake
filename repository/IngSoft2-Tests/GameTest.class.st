Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
GameTest >> test001WhenAGameIsCreatedAndNoShipMovesThenItIsNoOver [




	|aGame aFirstShip aCollectionOfShips aBoard |
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	
	aGame := Game withABoard: aBoard.


	self deny: aGame over.


]

{ #category : 'running' }
GameTest >> test002WhenAGameIsCreatedWithABoardAndSpaceShipThenThePositionOfTheSpaceShipItIs0 [

	|aGame aFirstShip aCollectionOfShips aBoard |
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	
	aGame := Game withABoard: aBoard.

	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 0.
]

{ #category : 'running' }
GameTest >> test003WhenAShipRollsADieAndTheOutcomeIs5ThenItMoves5Positions [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aFirstShip.
	
	aGame := Game withABoard: aBoard.
	
	
	aLoadedDie:= LoadedDie mustRoll: 5.
	
	aGame moveShip: aFirstShip toPosition: (aLoadedDie roll).

	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 5.
]

{ #category : 'running' }
GameTest >> test004WhenAShipReachTheEndOfTheBoardThenTheGameIsOver [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aFirstShip.
	
	aGame := Game withABoard: aBoard.
	
	
	aLoadedDie:= LoadedDie mustRoll: 10.
	
	aGame moveShip: aFirstShip toPosition: (aLoadedDie roll).

	self assert: aGame over.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 10.
]

{ #category : 'running' }
GameTest >> test005WhenAShipMovesButDoesNotReachTheEndOfTheBoardThenTheGameIsNotOver [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aFirstShip.
	
	aGame := Game withABoard: aBoard.
	
	
	aLoadedDie:= LoadedDie mustRoll: 5.
	
	aGame moveShip: aFirstShip toPosition: (aLoadedDie roll).

	self deny: aGame over.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 5.
]

{ #category : 'running' }
GameTest >> test006WhenAShipIsTheFirstToReachTheEndThenItIsTheWinner [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aFirstShip.
	
	aGame := Game withABoard: aBoard.
	
	
	aLoadedDie:= LoadedDie mustRoll: 10.
	
	aGame moveShip: aFirstShip toPosition: (aLoadedDie roll).

	self assert: aGame over.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 10.
	self assert: aGame getWinner equals: aFirstShip 
]
