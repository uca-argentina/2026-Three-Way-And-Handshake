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


	self deny: aGame isOver
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

	self assert: aGame isOver.
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

	self deny: aGame isOver.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 5.
]

{ #category : 'running' }
GameTest >> test006WhenAShipIsTheFirstToReachTheEndThenItIsTheWinner [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie |
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 10 ).

	aGame := Game
		         withABoard: aBoard
		         andShips: aCollectionOfShips
		         andDiceSet: aLoadedDie.

	aGame play.

	self assert: aGame isOver.
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

	self assert: aGame isOver.
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
	
	aFirstLoadedDie:= LoadedDie mustRoll: #(4 3).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips andDiceSet: aFirstLoadedDie.
	
	aGame play.
	aGame play.
	aGame play.

	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 8.
	self assert: (aGame getPositionOfSpaceShip: aSecondShip) equals: 3.
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
GameTest >> test010WhenAShipsRollIsGreaterThanTheAmountOfSquaresToFinishThenFinalPositionIsAtFinish [


	|aGame aFirstShip aCollectionOfShips aBoard aLoadedDie|
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 9.
	
	aLoadedDie:= LoadedDie mustRoll: #(10).
	
	aGame := Game withABoard: aBoard andShips: aCollectionOfShips  andDiceSet: aLoadedDie.
	
	aGame play.

	self assert: aGame isOver.
	self assert: (aGame getPositionOfSpaceShip: aFirstShip) equals: 9.
	self assert: aGame getWinner equals: aFirstShip 
]

{ #category : 'running' }
GameTest >> test011WhenTheGameIsOverThenNoMoreTurnsCanBePlayed [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie |
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 10 ).

	aGame := Game
		         withABoard: aBoard
		         andShips: aCollectionOfShips
		         andDiceSet: aLoadedDie.

	aGame play.

	self assert: aGame isOver.
	self should: [ aGame play ] raise: Error withExceptionDo: [ :error |
		self assert: error messageText equals: 'The game is already over.' ]
]

{ #category : 'running' }
GameTest >> test012WhenTheGameIsNotOverThenAskingForWinnerRaisesError [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie |
	aFirstShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 5 ).

	aGame := Game
		         withABoard: aBoard
		         andShips: aCollectionOfShips
		         andDiceSet: aLoadedDie.

	aGame play.

	self deny: aGame isOver.
	self should: [ aGame getWinner ] raise: Error withExceptionDo: [ :error |
		self assert: error messageText equals: 'The game is not over yet.' ]
]

{ #category : 'running' }
GameTest >> test013WhenTheLastShipPlaysThenItIsFirstShipTurnAgain [

	| aGame aFirstShip aSecondShip aCollectionOfShips aBoard aLoadedDie |
	aFirstShip := Ship withId: 1.
	aSecondShip := Ship withId: 2.
	aCollectionOfShips := OrderedCollection
		                      with: aFirstShip
		                      with: aSecondShip.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aGame := Game
		         withABoard: aBoard
		         andShips: aCollectionOfShips
		         andDiceSet: aLoadedDie.
	aGame play.
	aGame play.
	self assert: aGame getCurrentShip equals: aFirstShip
]

{ #category : 'running' }
GameTest >> test014WhenAGameIsCreatedWithNoShipsThenItCannotBeInstantiated [

	| aBoard aLoadedDie aCollectionOfShips |
	aBoard := Board withSize: 10.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aCollectionOfShips := OrderedCollection new.
	self
		should: [
				Game
					withABoard: aBoard
					andShips: aCollectionOfShips
					andDiceSet: aLoadedDie ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'A game must have at least one ship.' ]
]
