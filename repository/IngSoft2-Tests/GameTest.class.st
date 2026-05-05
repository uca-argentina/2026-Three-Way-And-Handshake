Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
GameTest >> test001WhenAGameIsCreatedAndNoShipMovesThenItIsNotOver [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie |
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.



	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 5 ).

	aGame := Game
		         withABoard: aBoard
		         andShips: aCollectionOfShips
		         andDiceSet: aLoadedDie.


	self deny: aGame over
]

{ #category : 'running' }
GameTest >> test002WhenAGameIsCreatedWithABoardAndSpaceShipThenThePositionOfTheSpaceShipItIs0 [

	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie |
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.
	
	aLoadedDie := LoadedDie mustRoll: #(1).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips  andDiceSet: aLoadedDie.

	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 0.
]

{ #category : 'running' }
GameTest >> test003WhenAShipRollsADieAndTheOutcomeIs5ThenItMoves5Positions [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.
	
	aLoadedDie:= LoadedDie mustRoll: #(5).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips  andDiceSet: aLoadedDie.
	
	aGame play.

	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 5.
]

{ #category : 'running' }
GameTest >> test004WhenAShipReachTheEndOfTheBoardThenTheGameIsOver [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.
	
	aLoadedDie:= LoadedDie mustRoll: #(10).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips  andDiceSet: aLoadedDie.
	
	aGame play.

	self assert: aGame over.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 10.
]

{ #category : 'running' }
GameTest >> test005WhenAShipMovesButDoesNotReachTheEndOfTheBoardThenTheGameIsNotOver [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.
		
	aLoadedDie:= LoadedDie mustRoll: #(5).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips  andDiceSet: aLoadedDie.
	
	aGame play.

	self deny: aGame over.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 5.
]

{ #category : 'running' }
GameTest >> test006WhenAShipIsTheFirstToReachTheEndThenItIsTheWinner [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.
	
	aLoadedDie:= LoadedDie mustRoll: #(10).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips  andDiceSet: aLoadedDie.
	
	aGame play.

	self assert: aGame over.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 10.
	self assert: aGame getWinner equals: aFirstShip 
]

{ #category : 'running' }
GameTest >> test007WhenAShipIsOnPosition0AndRolls5TwiceThenItMovesToPosition10 [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.
	
	aLoadedDie:= LoadedDie mustRoll: #(5 5).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips  andDiceSet: aLoadedDie.
		
	aGame play.
	aGame play.

	self assert: aGame over.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 10.
	self assert: aGame getWinner equals: aFirstShip 
]

{ #category : 'running' }
GameTest >> test008WhenAGameWith2ShipsPlayThenEachShipPlaysAtATurnAndLoadedDieGoesBackToFirstValue [


"module implementation on aritmethic calc"
	|aGame aFirstShip aCollectionOfShips aBoard aFirstLoadedDie aSecondShip |
	aFirstShip := Ship withId: 1.
	aSecondShip := Ship withId: 2.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.

	aBoard := Board withSize: 10.
	
	aFirstLoadedDie:= LoadedDie mustRoll: #(4 4).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips andDiceSet: aFirstLoadedDie.
	
	aGame play.
	aGame play.
	aGame play.

	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 8.
	self assert: (aGame getPositionOfSpaceShip: aSecondShip) equals: 4.
]

{ #category : 'running' }
GameTest >> test009WhenASetOfLoadedDiceIsRolledThen [

	| aFirstShip aSecondShip aCollectionOfShips aBoard aFirstLoadedDie aSecondLoadedDie aCollectionOfDice aDiceSet aGame |
	aFirstShip := Ship withId: 1.
	aSecondShip := Ship withId: 2.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.
	aBoard := Board withSize: 10.

	aFirstLoadedDie := LoadedDie mustRoll: #( 4 2 ).
	aSecondLoadedDie := LoadedDie mustRoll: #( 3 4 ).

	aCollectionOfDice := OrderedCollection with: aFirstLoadedDie.
	aCollectionOfDice add: aSecondLoadedDie.

	aDiceSet := DiceSet withDice: aCollectionOfDice.

	aGame := Game
		         withABoard: aBoard
		         andShips: aCollectionOfShips
		         andDiceSet: aDiceSet.
	aGame play.
	aGame play.

	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 7.
	self assert: (aGame getPositionOfSpaceShip: aSecondShip) equals: 6
]

{ #category : 'running' }
GameTest >> test009WhenASetOfLoadedDiceIsRolledThenTheSumOfDiceComesInOrder [

	| aGame aFirstShip aCollectionOfShips aCollectionOfDice aBoard aFirstLoadedDie aSecondLoadedDie aSecondShip aDiceSet |
	aFirstShip := Ship withId: 1.
	aSecondShip := Ship withId: 2.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.
	aBoard := Board withSize: 10.

	aFirstLoadedDie := LoadedDie mustRoll: #( 4 2 ).
	aSecondLoadedDie := LoadedDie mustRoll: #( 3 4 ).

	aCollectionOfDice := OrderedCollection with: aFirstLoadedDie.
	aCollectionOfDice add: aSecondLoadedDie.

	aDiceSet := DiceSet withDice: aCollectionOfDice.

	aGame := Game
		         withABoard: aBoard
		         andShips: aCollectionOfShips
		         andDiceSet: aDiceSet.
	aGame play.
	aGame play.

	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 7.
	self assert: (aGame getPositionOfSpaceShip: aSecondShip) equals: 6
]

{ #category : 'running' }
GameTest >> test010WhenAShipRollsHigherThanTheAmountOfSquaresToFinishThenFinalPositionIsAtFinish [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 9.
	
	aLoadedDie:= LoadedDie mustRoll: #(10).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips  andDiceSet: aLoadedDie.
	
	aGame play.

	self assert: aGame over.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 9.
	self assert: aGame getWinner equals: aFirstShip 
]
